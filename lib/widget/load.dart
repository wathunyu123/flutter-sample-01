import 'package:flutter/material.dart';

import '../helper/string.dart';
import '../helper/color.dart';
import '../helper/size.dart';

Widget loading({
  required BuildContext context,
}) {
  return Align(
    alignment: Alignment.center,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.height * .3,
            ),
            child: Column(
              children: [
                CircularProgressIndicator.adaptive(
                  backgroundColor: AppColor.instance.blue,
                  strokeWidth: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: 'กำลังโหลดข้อมูล'.textTitleLoading(context),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
