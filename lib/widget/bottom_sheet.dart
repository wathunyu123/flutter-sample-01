import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:go_router/go_router.dart';

import '../helper/size.dart';
import '../helper/color.dart';
import '../helper/string.dart';

Widget buttonBottomSheet({
  required BuildContext context,
  required String string,
  double? width,
  required VoidCallback function,
  required AppColor appColor,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.width / 6,
        maxWidth: width ?? context.width / 1.2,
      ),
      child: InkWell(
        onTap: function,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            right: context.width / 30,
          ),
          decoration: BoxDecoration(
            color: appColor.darkBlack,
            borderRadius: BorderRadius.circular(15),
          ),
          child: string.textButtonBottomSheet(context),
        ),
      ),
    ),
  );
}

Future<T?> bottomSheet<T>({
  required BuildContext context,
  required double height,
  required Widget child,
}) async {
  _body(
    ScrollController sc,
    double pos,
    Widget child,
  ) {
    return child;
  }

  showSlidingBox(
    context: context,
    box: SlidingBox(
      minHeight: context.height * .35,
      maxHeight: context.height * .85,
      color: AppColor.instance.white,
      bodyBuilder: (scrollController, boxPosition) => _body(
        scrollController,
        boxPosition,
        child,
      ),
      draggable: false,
    ),
    barrierColor: AppColor.instance.grey.withOpacity(.75),
  );
  // showModalBottomSheet<T>(
  //   context: context,
  //   builder: (context) {
  //     return SizedBox(
  //       height: height,
  //       child: child,
  //     );
  //   },
  // );
}

Future<T?> bottomSheetBirt<T>({
  required BuildContext context,
  required Widget child,
}) async {
  bottomSheet(
    context: context,
    height: context.height * .85,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          closeSheet(context: context),
          child,
        ],
      ),
    ),
  );
}

Future<T?> bottomSheetMeasure<T>({
  required BuildContext context,
  required Widget child,
}) async {
  bottomSheet(
    context: context,
    height: context.height * .85,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          closeSheet(context: context),
          child,
        ],
      ),
    ),
  );
}

Future<T?> bottomSheetRecommend<T>({
  required BuildContext context,
  required Widget child,
}) async {
  bottomSheet(
    context: context,
    height: context.height * .85,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          closeSheet(context: context),
          child,
        ],
      ),
    ),
  );
}

Align closeSheet({
  required BuildContext context,
}) {
  return Align(
    alignment: Alignment.topRight,
    child: OutlinedButton(
      onPressed: () => context.pop(),
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(
          AppColor.instance.darkBlack,
        ),
        backgroundColor: MaterialStatePropertyAll(
          AppColor.instance.transparent,
        ),
        side: const MaterialStatePropertyAll(BorderSide.none),
      ),
      child: 'ปิด'.textButtonOutline(context),
    ),
  );
}
