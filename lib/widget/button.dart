import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helper/lottie.dart';
import '../helper/string.dart';
import '../helper/color.dart';
import '../../helper/size.dart';

Widget buttonBlur({
  required BuildContext context,
  required String string,
  required double width,
  required VoidCallback function,
  required AppColor appColor,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
      child: InkWell(
        highlightColor: appColor.transparent,
        splashColor: appColor.transparent,
        onTap: function,
        child: Container(
          height: context.width / 8,
          width: context.width / width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: appColor.white.withOpacity(.55),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: string.textButtonLogin(context),
          ),
        ),
      ),
    ),
  );
}

Widget buttonOutline({
  required BuildContext context,
  required String string,
  required double width,
  required VoidCallback function,
  required AppColor appColor,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: InkWell(
      highlightColor: appColor.grey.withOpacity(.55),
      splashColor: appColor.grey.withOpacity(.55),
      child: OutlinedButton(
        onPressed: function,
        child: string.textButtonOutline(context),
      ),
    ),
  );
}

Widget buttonIconColor({
  required BuildContext context,
  required String string,
  required IconData icon,
  required VoidCallback function,
  required Color color,
  required AppColor appColor,
  TextDirection? rtl,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Directionality(
      textDirection: rtl ?? TextDirection.ltr,
      child: OutlinedButton.icon(
        onPressed: function,
        label: string.textButtonOutline(context),
        icon: Icon(icon),
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(appColor.darkBlack),
          backgroundColor: MaterialStatePropertyAll(color.withOpacity(.55)),
          side: const MaterialStatePropertyAll(BorderSide.none),
        ),
      ),
    ),
  );
}

Widget buttonRecommend({
  required BuildContext context,
  required String string,
  // required IconData icon,
  required String icon,
  required VoidCallback function,
  required Color color,
  required AppColor appColor,
  TextDirection? rtl,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Directionality(
      textDirection: rtl ?? TextDirection.ltr,
      child: OutlinedButton.icon(
        onPressed: function,
        label: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.width * .025,
            horizontal: context.width * .07,
          ),
          child: string.textButtonOutline(context),
        ),
        icon: lottieFile(
          context: context,
          path: icon,
          width: context.width * .1,
          height: context.width * .1,
        ),
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(appColor.darkBlack),
          backgroundColor: MaterialStatePropertyAll(color.withOpacity(.55)),
          side: const MaterialStatePropertyAll(BorderSide.none),
        ),
      ),
    ),
  );
}

Widget buttonListWhite({
  required BuildContext context,
  required String stringLeft,
  required String stringRight,
  required double width,
  required VoidCallback function,
  required AppColor appColor,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: TextButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          appColor.white,
        ),
        foregroundColor: MaterialStatePropertyAll(
          appColor.darkBlack,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              stringLeft.textButtonListWhiteLeft(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  stringRight.textButtonListWhiteRight(context),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 5.0,
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget backButton({
  required BuildContext context,
  required AppColor appColor,
}) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: context.width * .3,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextButton.icon(
        onPressed: () => context.pop(),
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(appColor.darkBlack),
          backgroundColor: MaterialStatePropertyAll(
            appColor.white,
          ),
          side: const MaterialStatePropertyAll(BorderSide.none),
        ),
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        label: 'กลับ'.textButtonBack(context),
      ),
    ),
  );
}
