import 'package:flutter/material.dart';

import 'color.dart';
import '../helper/size.dart';
import '../helper/string.dart';

class Columns {
  Columns._();
  static final instance = Columns._();

  Widget twoColumn({
    required BuildContext context,
    required List<String> listString,
    required AppColor appColor,
  }) {
    if (listString.length % 2 == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < listString.length; i += 2) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 3.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.width * .4,
                    child: listString[i].textTwoColumnLeft(context),
                  ),
                  SizedBox(
                    width: context.width * .4,
                    child: listString[i + 1].textTwoColumnRight(context),
                  ),
                ],
              ),
            ),
          ],
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
