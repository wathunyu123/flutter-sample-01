import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'icon.dart';
import '../../../router/define.dart';
import '../../../helper/color.dart';
import '../../../helper/icon.dart';
import '../../../network/model/login/login_response.dart';

Widget gridMenu({
  required BuildContext context,
  required AppColor appColor,
  required AppIcon appIcon,
  required Permission permission,
}) {
  return Wrap(
    alignment: WrapAlignment.spaceAround,
    crossAxisAlignment: WrapCrossAlignment.center,
    runSpacing: 3.0,
    children: [
      oIcon(
        context: context,
        icon: appIcon.infoChart,
        string: 'บันทึกข้อมูลทั่วไป',
        appColor: appColor,
        appIcon: appIcon,
        onTap: () => context.push(RouterName.inputBodyInfo.toPath),
      ),
      oIcon(
        context: context,
        icon: appIcon.healthFolder,
        string: 'ผลการประเมินโภชนาการ',
        appColor: appColor,
        appIcon: appIcon,
        onTap: () => context.push(RouterName.nutritionAssessment.toPath),
      ),
      if (permission.level > -1) ...[
        oIcon(
          context: context,
          icon: appIcon.nurse,
          string: 'สรุปข้อมูลภาพรวม',
          appColor: appColor,
          appIcon: appIcon,
          onTap: () => context.push(RouterName.overviewData.toPath),
        ),
      ],
      if (permission.level > 0) ...[
        oIcon(
          context: context,
          icon: appIcon.admin,
          string: 'ผู้ดูแลระบบ',
          appColor: appColor,
          appIcon: appIcon,
          onTap: () => context.push(RouterName.adminController.toPath),
        ),
      ],
    ],
  );
}
