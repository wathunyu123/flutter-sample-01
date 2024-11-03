import 'package:flutter/material.dart';

import 'color.dart';

class AppTextStyle {
  AppTextStyle._();
  static final instance = AppTextStyle._();

  TextStyle get home => TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w900,
        color: AppColor.instance.darkBlack.withOpacity(.9),
        letterSpacing: 1,
        wordSpacing: 4,
      );

  TextStyle get buttonLogin => TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get dark14 => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get dark16 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get titleTab => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get titleTabBold => TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get toggleButton => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      );

  TextStyle get gridMenu => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get darkBold12 => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get darkBold14 => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get twoColumnLeft => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get twoColumnRight => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get darkBold16 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get powerBarTitle => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get powerBar => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get powerBarActive => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.white,
      );

  TextStyle get listWhiteLeft => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get listWhiteRight => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get titleBody => TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get titleLoad => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get buttonOutline => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get buttonRecommend => TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get darkBold18 => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get darkBold20 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get required => TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.red,
      );

  TextStyle get department => TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get subDepartment => TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get overviewCardTitle => TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get overviewCardSubTitle => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get titleCard => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get titleDialog => TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get bodyDialog => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );

  TextStyle get okDialog => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.deepBlue,
      );

  TextStyle get cancelDialog => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.red,
      );

  TextStyle get white => TextStyle(
        fontWeight: FontWeight.normal,
        color: AppColor.instance.white,
      );

  TextStyle get hintText => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.white,
      );

  TextStyle get labelText => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.white,
      );

  TextStyle get whiteBold => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.white,
      );

  TextStyle get buttonBottomSheet => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColor.instance.white,
      );

  TextStyle get listTile => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: AppColor.instance.darkBlack,
      );
}
