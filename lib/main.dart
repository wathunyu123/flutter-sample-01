import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/provider.dart';
import 'helper/theme.dart';
import 'router/configure.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final providers = AppProviders.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    providers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers.data,
      child: MaterialApp.router(
        title: 'LookDek',
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
