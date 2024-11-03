import 'package:flutter/material.dart';

import '../../../helper/string.dart';
import '../../../storage/Department/department_bloc.dart';
import 'grid_menu.dart';
import '../../../helper/size.dart';
import '../../../helper/icon.dart';
import '../../../helper/color.dart';
import '../../../network/model/login/login_response.dart';

Widget body({
  required BuildContext context,
  required AppColor appColor,
  required AppIcon appIcon,
  required Permission permission,
  required StateDepartment department,
}) {
  return Align(
    alignment: Alignment.center,
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            color: appColor.white.withOpacity(.55),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: context.width * .9,
                  height: context.height * .9,
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              'สังกัด'.textSubDepartment(context),
                              department.departmentName.textDepartment(context),
                            ],
                          ),
                        ),
                        gridMenu(
                          context: context,
                          appColor: appColor,
                          appIcon: appIcon,
                          permission: permission,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
