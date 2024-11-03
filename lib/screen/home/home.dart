import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../storage/Department/department_bloc.dart';
import '../../storage/Permission/permission_bloc.dart';
import 'component/body.dart';
import '../login/component/behavior.dart';
import '../../helper/size.dart';
import '../../helper/icon.dart';
import '../../helper/color.dart';
import '../../widget/background.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final int flexBody = 9;
  final int flexFooter = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var permission = context.select((PermissionBloc bloc) => bloc.state);
    var department = context.select((DepartmentBloc bloc) => bloc.state);
    return Scaffold(
      backgroundColor: appColor.lightBlack,
      body: ScrollConfiguration(
        behavior: LoginBehavior(),
        child: SizedBox(
          height: context.height,
          child: Stack(
            children: [
              const Background(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: flexBody,
                    child: body(
                      context: context,
                      appColor: appColor,
                      appIcon: appIcon,
                      permission: permission.permission,
                      department: department,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
