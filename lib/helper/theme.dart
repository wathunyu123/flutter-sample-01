import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          primary: AppColor.instance.deepBlue,
          seedColor: AppColor.instance.deepPurple,
        ),
      );
}
