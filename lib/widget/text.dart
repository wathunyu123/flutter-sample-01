import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../helper/size.dart';
import '../helper/color.dart';

class AppText {
  AppText._();
  static final instance = AppText._();

  Widget show({
    required BuildContext context,
    required String string,
    int? maxLines,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
    required AppColor appColor,
  }) {
    double factors = context.width <= 640
        ? .7
        : context.width <= 750
            ? .8
            : context.width <= 1080
                ? .85
                : context.width <= 1290
                    ? 1.0
                    : 1.25;
    return AutoSizeText(
      string,
      maxLines: maxLines,
      textAlign: textAlign,
      style: style,
      overflow: overflow,
      textScaleFactor: factors,
    );
  }
}
