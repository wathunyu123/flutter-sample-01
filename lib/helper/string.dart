import 'package:flutter/material.dart';

import '../widget/text.dart';
import 'color.dart';
import 'text_style.dart';

extension SizeExtensions on String {
  Widget textHome(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.home,
        appColor: AppColor.instance,
      );

  Widget textMenu(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.gridMenu,
        appColor: AppColor.instance,
        overflow: TextOverflow.ellipsis,
      );

  Widget textTitle(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.darkBold20,
        appColor: AppColor.instance,
      );

  Widget textRequired(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.required,
        appColor: AppColor.instance,
      );

  Widget textDepartment(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.department,
        appColor: AppColor.instance,
      );

  Widget textSubDepartment(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.subDepartment,
        appColor: AppColor.instance,
      );

  Widget textOverviewCardTitle(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.overviewCardTitle,
        appColor: AppColor.instance,
      );

  Widget textOverviewCardSubTitle(BuildContext context) =>
      AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.end,
        style: AppTextStyle.instance.overviewCardSubTitle,
        appColor: AppColor.instance,
      );

  Widget textTitleCard(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.titleCard,
        appColor: AppColor.instance,
      );

  Widget textDetailCard(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.darkBold14,
        appColor: AppColor.instance,
      );

  Widget textTitleTab(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.titleTabBold,
        appColor: AppColor.instance,
      );

  Widget textTitleTabDetail(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.titleTab,
        appColor: AppColor.instance,
      );

  Widget textTitleDetailTab(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        appColor: AppColor.instance,
      );

  Widget textTitleLoading(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.titleLoad,
        appColor: AppColor.instance,
      );

  Widget textTitleBody(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.titleBody,
        appColor: AppColor.instance,
      );

  Widget textTitlePowerBar(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.powerBarTitle,
        appColor: AppColor.instance,
      );

  Widget textButtonOutline(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.buttonRecommend,
        appColor: AppColor.instance,
      );

  Widget textButtonListWhiteLeft(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.listWhiteLeft,
        appColor: AppColor.instance,
      );

  Widget textButtonListWhiteRight(BuildContext context) =>
      AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.listWhiteRight,
        appColor: AppColor.instance,
      );

  Widget textButtonLogin(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        style: AppTextStyle.instance.buttonLogin,
        appColor: AppColor.instance,
      );

  Widget textButtonBack(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        style: AppTextStyle.instance.buttonOutline,
        appColor: AppColor.instance,
      );

  Widget textPowerBar(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.powerBar,
        appColor: AppColor.instance,
      );

  Widget textPowerBarActive(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.powerBarActive,
        appColor: AppColor.instance,
      );

  Widget textTwoColumnLeft(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 2,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.twoColumnLeft,
        appColor: AppColor.instance,
      );

  Widget textTwoColumnRight(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 2,
        textAlign: TextAlign.start,
        style: AppTextStyle.instance.twoColumnRight,
        appColor: AppColor.instance,
      );

  Widget textButtonBottomSheet(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.buttonBottomSheet,
        appColor: AppColor.instance,
      );

  Widget textListTile(BuildContext context) => AppText.instance.show(
        context: context,
        string: this,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: AppTextStyle.instance.listTile,
        appColor: AppColor.instance,
      );
}
