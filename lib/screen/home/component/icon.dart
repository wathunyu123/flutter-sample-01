import 'package:flutter/material.dart';

import '../../../helper/svg.dart';
import '../../../helper/color.dart';
import '../../../helper/icon.dart';
import '../../../helper/size.dart';
import '../../../helper/string.dart';

Widget oIcon({
  required BuildContext context,
  required String icon,
  required String string,
  required AppColor appColor,
  required AppIcon appIcon,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 5.0,
    ),
    child: ConstrainedBox(
      constraints: BoxConstraints.expand(
        width: context.sizeIcon(
          ratio: .85,
        ),
        height: context.sizeIcon(
          ratio: .55,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: appColor.white,
            border: Border.all(
              color: appColor.darkBlack,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon.svgToIcon(
                  width: context.icon,
                  height: context.icon,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: context.width * .125,
                  ),
                  child: string.textMenu(context),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
