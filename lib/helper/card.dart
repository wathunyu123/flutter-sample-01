import 'package:flutter/material.dart';

import '../helper/size.dart';
import '../helper/string.dart';
import 'color.dart';
import 'lottie.dart';

class WidgetCard {
  WidgetCard._();
  static final instance = WidgetCard._();

  Widget show({
    required BuildContext context,
    required String title,
    required Widget child,
    required AppColor appColor,
    Color? color,
    bool warning = false,
  }) {
    return Card(
      elevation: 3.0,
      color: color ?? appColor.white,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (warning) ...[
                  lottieFile(
                    context: context,
                    path: 'assets/lottie/warning.lottie',
                    width: context.width * .15,
                    height: context.width * .15,
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: title.textTitleCard(context),
                ),
              ],
            ),
          ),
          Divider(
            indent: 5.0,
            endIndent: 5.0,
            thickness: .35,
            color: color == appColor.lightRed
                ? appColor.white
                : appColor.darkBlack,
          ),
          child,
        ],
      ),
    );
  }
}
