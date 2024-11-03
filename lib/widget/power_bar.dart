import 'package:flutter/material.dart';

import '../data/weight_age_level.dart';
import '../helper/color.dart';
import '../helper/size.dart';
import '../helper/string.dart';
import '../data/height_age_level.dart';
import '../data/height_weight_level.dart';
import '../model/level_detail.dart';

class PowerBar {
  PowerBar._();
  static final instance = PowerBar._();

  Widget mainElement({
    required BuildContext context,
    required String thai,
    String? english,
    Color? color,
    required AppColor appColor,
    bool active = false,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.width * .1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: context.width * .03,
            decoration: BoxDecoration(
              color: color ?? appColor.white,
              border: Border.all(
                color: appColor.darkBlack,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (active) ...[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: thai.textPowerBarActive(context),
                  ),
                ] else ...[
                  thai.textPowerBar(context),
                ],
              ],
            ),
          ),
          if (english != null && english.isNotEmpty) ...[
            '($english)'.textPowerBar(context),
          ],
        ],
      ),
    );
  }

  Widget weightForAge({
    required BuildContext context,
    required int levels,
    required AppColor appColor,
  }) {
    levels = levels > -1 ? levels : 1;
    levels = levels <= weightLevels.length ? levels : weightLevels.length;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Center(
        child: Wrap(
          spacing: 3.0,
          runSpacing: 20.0,
          children: List.generate(
            weightLevels.length,
            (index) {
              final LevelDetail level = weightLevels[index];
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: levels == index + 1
                      ? context.width * .45
                      : context.width * .25,
                ),
                child: mainElement(
                  context: context,
                  thai: level.thai,
                  english: level.english,
                  color: levels == index + 1
                      ? (levels == 3
                          ? appColor.green
                          : levels == 2 || levels == 4
                              ? appColor.yellow
                              : levels == 1 || levels == 5
                                  ? appColor.red
                                  : appColor.transparent)
                      : appColor.white,
                  appColor: appColor,
                  active: levels == index + 1 ? true : false,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget heightForAge({
    required BuildContext context,
    required int levels,
    required AppColor appColor,
  }) {
    levels = levels > -1 ? levels : 1;
    levels = levels <= heightLevels.length ? levels : heightLevels.length;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Center(
        child: Wrap(
          spacing: 3.0,
          runSpacing: 20.0,
          children: List.generate(
            heightLevels.length,
            (index) {
              final LevelDetail level = heightLevels[index];
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: levels == index + 1
                      ? context.width * .45
                      : context.width * .25,
                ),
                child: mainElement(
                  context: context,
                  thai: level.thai,
                  english: level.english,
                  color: levels == index + 1
                      ? (levels == 3 || levels == 4 || levels == 5
                          ? appColor.green
                          : levels == 2
                              ? appColor.yellow
                              : levels == 1
                                  ? appColor.red
                                  : appColor.transparent)
                      : appColor.white,
                  appColor: appColor,
                  active: levels == index + 1 ? true : false,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget heightForWeight({
    required BuildContext context,
    required int levels,
    required AppColor appColor,
  }) {
    levels = levels > -1 ? levels : 1;
    levels = levels <= heightByWeightLevels.length
        ? levels
        : heightByWeightLevels.length;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Center(
        child: Wrap(
          spacing: 3.0,
          runSpacing: 20.0,
          children: List.generate(
            heightByWeightLevels.length,
            (index) {
              final LevelDetail level = heightByWeightLevels[index];
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: levels == index + 1
                      ? context.width * .45
                      : context.width * .25,
                ),
                child: mainElement(
                  context: context,
                  thai: level.thai,
                  english: level.english,
                  color: levels == index + 1
                      ? (levels == 3 || levels == 4
                          ? appColor.green
                          : levels == 2 || levels == 5
                              ? appColor.yellow
                              : levels == 1 || levels == 6
                                  ? appColor.red
                                  : appColor.transparent)
                      : appColor.white,
                  appColor: appColor,
                  active: levels == index + 1 ? true : false,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
