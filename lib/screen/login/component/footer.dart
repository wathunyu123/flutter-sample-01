import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../helper/size.dart';
import '../../../helper/color.dart';
import '../../../helper/version.dart';
import '../../../widget/button.dart';

Widget footer({
  required BuildContext context,
  required Version version,
}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FutureBuilder(
            future: version.init(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return buttonBlur(
                context: context,
                string: 'เวอร์ชัน ${snapshot.data}',
                width: 2,
                function: () {
                  HapticFeedback.lightImpact();
                  // Fluttertoast.showToast(
                  //     msg: 'Create a new account button pressed');
                },
                appColor: AppColor.instance,
              );
            }),
        SizedBox(height: context.height * .05),
      ],
    ),
  );
}
