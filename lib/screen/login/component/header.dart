import 'package:flutter/material.dart';
import 'package:lookdek/helper/lottie.dart';

import '../../../helper/size.dart';
import '../../../helper/string.dart';

Widget header({
  required BuildContext context,
}) {
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: EdgeInsets.only(
        top: context.height * .05,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: context.width * .5,
          maxWidth: context.width * .5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            lottieFile(
              context: context,
              path: 'assets/lottie/baby.lottie',
              width: context.width * .32,
              height: context.width * .32,
            ),
            'LookDek'.textHome(context),
          ],
        ),
      ),
    ),
  );
}
