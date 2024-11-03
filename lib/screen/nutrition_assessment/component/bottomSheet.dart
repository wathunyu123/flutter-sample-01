import 'package:flutter/material.dart';

import '../../../helper/string.dart';
import '../../../helper/card.dart';
import '../../../helper/color.dart';
import '../../../widget/bottom_sheet.dart';
import '../../../widget/expansion/expansion.dart';
import '../state/get_level_recommend_info/get_level_recommend_info_bloc.dart';
import '../state/get_recommend_info/get_recommend_info_bloc.dart';

Future<T?> showRecommendInfo<T>({
  required BuildContext context,
  required AppColor appColor,
  required GetRecommendInfoState recommend,
  required GetLevelRecommendInfoState level,
}) async {
  if (recommend is StateGetRecommendInfoFetchSuccess) {
    bool isTopic1H1 = recommend.model.baby.topic1.header.isNotEmpty;
    bool isTopic2H1 = recommend.model.baby.topic2.header.isNotEmpty;
    bool isTopic3H1 = recommend.model.baby.topic3.header.isNotEmpty;
    bool isTopic4H1 = recommend.model.baby.topic4.header.isNotEmpty;
    bool isTopic5H1 = recommend.model.baby.topic5.header.isNotEmpty;
    bool isTopic6H1 = recommend.model.baby.topic6.header.isNotEmpty;
    bool isTopic7H1 = recommend.model.baby.topic7.header.isNotEmpty;
    bool isTopic8H1 = recommend.model.baby.topic8.header.isNotEmpty;
    bool isTopic9H1 = recommend.model.baby.topic9.header.isNotEmpty;
    bool isTopic10H1 = recommend.model.baby.topic10.header.isNotEmpty;

    bool isTopic1H2 = recommend.model.mom.topic1.header.isNotEmpty;
    bool isTopic2H2 = recommend.model.mom.topic2.header.isNotEmpty;
    bool isTopic3H2 = recommend.model.mom.topic3.header.isNotEmpty;
    bool isTopic4H2 = recommend.model.mom.topic4.header.isNotEmpty;
    bool isTopic5H2 = recommend.model.mom.topic5.header.isNotEmpty;
    bool isTopic6H2 = recommend.model.mom.topic6.header.isNotEmpty;
    bool isTopic7H2 = recommend.model.mom.topic7.header.isNotEmpty;
    bool isTopic8H2 = recommend.model.mom.topic8.header.isNotEmpty;
    bool isTopic9H2 = recommend.model.mom.topic9.header.isNotEmpty;
    bool isTopic10H2 = recommend.model.mom.topic10.header.isNotEmpty;

    bool isTopic1H3 = recommend.model.modified.topic1.header.isNotEmpty;
    bool isTopic2H3 = recommend.model.modified.topic2.header.isNotEmpty;
    bool isTopic3H3 = recommend.model.modified.topic3.header.isNotEmpty;
    bool isTopic4H3 = recommend.model.modified.topic4.header.isNotEmpty;
    bool isTopic5H3 = recommend.model.modified.topic5.header.isNotEmpty;
    bool isTopic6H3 = recommend.model.modified.topic6.header.isNotEmpty;
    bool isTopic7H3 = recommend.model.modified.topic7.header.isNotEmpty;
    bool isTopic8H3 = recommend.model.modified.topic8.header.isNotEmpty;
    bool isTopic9H3 = recommend.model.modified.topic9.header.isNotEmpty;
    bool isTopic10H3 = recommend.model.modified.topic10.header.isNotEmpty;

    bool isLevel1H1 = false;
    bool isLevel2H1 = false;
    bool isLevel3H1 = false;
    bool isLevel4H1 = false;
    bool isLevel5H1 = false;
    bool isLevel6H1 = false;
    bool isLevel7H1 = false;
    bool isLevel8H1 = false;
    bool isLevel9H1 = false;
    bool isLevel10H1 = false;

    if (level is StateGetLevelRecommendInfoFetchSuccess) {
      isLevel1H1 = level.model.recommend.topic1.header.isNotEmpty;
      isLevel2H1 = level.model.recommend.topic2.header.isNotEmpty;
      isLevel3H1 = level.model.recommend.topic3.header.isNotEmpty;
      isLevel4H1 = level.model.recommend.topic4.header.isNotEmpty;
      isLevel5H1 = level.model.recommend.topic5.header.isNotEmpty;
      isLevel6H1 = level.model.recommend.topic6.header.isNotEmpty;
      isLevel7H1 = level.model.recommend.topic7.header.isNotEmpty;
      isLevel8H1 = level.model.recommend.topic8.header.isNotEmpty;
      isLevel9H1 = level.model.recommend.topic9.header.isNotEmpty;
      isLevel10H1 = level.model.recommend.topic10.header.isNotEmpty;
    }

    bottomSheetRecommend(
      context: context,
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            if (level is StateGetLevelRecommendInfoFetchSuccess &&
                isLevel1H1) ...[
              WidgetCard.instance.show(
                context: context,
                title: 'ข้อควรระวัง',
                warning: true,
                color: appColor.lightRed,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isLevel1H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic1.header}',
                          itemCount: level.model.recommend.topic1.detail.length,
                          list: level.model.recommend.topic1.detail,
                        ),
                      ],
                      if (isLevel2H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic2.header}',
                          itemCount: level.model.recommend.topic2.detail.length,
                          list: level.model.recommend.topic2.detail,
                        ),
                      ],
                      if (isLevel3H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic3.header}',
                          itemCount: level.model.recommend.topic3.detail.length,
                          list: level.model.recommend.topic3.detail,
                        ),
                      ],
                      if (isLevel4H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic4.header}',
                          itemCount: level.model.recommend.topic4.detail.length,
                          list: level.model.recommend.topic4.detail,
                        ),
                      ],
                      if (isLevel5H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic5.header}',
                          itemCount: level.model.recommend.topic5.detail.length,
                          list: level.model.recommend.topic5.detail,
                        ),
                      ],
                      if (isLevel6H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic6.header}',
                          itemCount: level.model.recommend.topic6.detail.length,
                          list: level.model.recommend.topic6.detail,
                        ),
                      ],
                      if (isLevel7H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic7.header}',
                          itemCount: level.model.recommend.topic7.detail.length,
                          list: level.model.recommend.topic7.detail,
                        ),
                      ],
                      if (isLevel8H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic8.header}',
                          itemCount: level.model.recommend.topic8.detail.length,
                          list: level.model.recommend.topic8.detail,
                        ),
                      ],
                      if (isLevel9H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic9.header}',
                          itemCount: level.model.recommend.topic9.detail.length,
                          list: level.model.recommend.topic9.detail,
                        ),
                      ],
                      if (isLevel10H1) ...[
                        Accordion(
                          title: '• ${level.model.recommend.topic10.header}',
                          itemCount:
                              level.model.recommend.topic10.detail.length,
                          list: level.model.recommend.topic10.detail,
                        ),
                      ],
                    ],
                  ),
                ),
                appColor: appColor,
              ),
            ],
            if (isTopic1H1) ...[
              WidgetCard.instance.show(
                context: context,
                title: 'ทารกที่ได้รับนมแม่',
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isTopic1H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic1.header}',
                          itemCount: recommend.model.baby.topic1.detail.length,
                          list: recommend.model.baby.topic1.detail,
                        ),
                      ],
                      if (isTopic2H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic2.header}',
                          itemCount: recommend.model.baby.topic2.detail.length,
                          list: recommend.model.baby.topic2.detail,
                        ),
                      ],
                      if (isTopic3H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic3.header}',
                          itemCount: recommend.model.baby.topic3.detail.length,
                          list: recommend.model.baby.topic3.detail,
                        ),
                      ],
                      if (isTopic4H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic4.header}',
                          itemCount: recommend.model.baby.topic4.detail.length,
                          list: recommend.model.baby.topic4.detail,
                        ),
                      ],
                      if (isTopic5H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic5.header}',
                          itemCount: recommend.model.baby.topic5.detail.length,
                          list: recommend.model.baby.topic5.detail,
                        ),
                      ],
                      if (isTopic6H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic6.header}',
                          itemCount: recommend.model.baby.topic6.detail.length,
                          list: recommend.model.baby.topic6.detail,
                        ),
                      ],
                      if (isTopic7H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic7.header}',
                          itemCount: recommend.model.baby.topic7.detail.length,
                          list: recommend.model.baby.topic7.detail,
                        ),
                      ],
                      if (isTopic8H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic8.header}',
                          itemCount: recommend.model.baby.topic8.detail.length,
                          list: recommend.model.baby.topic8.detail,
                        ),
                      ],
                      if (isTopic9H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic9.header}',
                          itemCount: recommend.model.baby.topic9.detail.length,
                          list: recommend.model.baby.topic9.detail,
                        ),
                      ],
                      if (isTopic10H1) ...[
                        Accordion(
                          title: '• ${recommend.model.baby.topic10.header}',
                          itemCount: recommend.model.baby.topic10.detail.length,
                          list: recommend.model.baby.topic10.detail,
                        ),
                      ],
                    ],
                  ),
                ),
                appColor: appColor,
              ),
            ],
            if (isTopic1H2) ...[
              WidgetCard.instance.show(
                context: context,
                title: 'แม่ที่ให้นมบุตร',
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isTopic1H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic1.header}',
                          itemCount: recommend.model.mom.topic1.detail.length,
                          list: recommend.model.mom.topic1.detail,
                        ),
                      ],
                      if (isTopic2H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic2.header}',
                          itemCount: recommend.model.mom.topic2.detail.length,
                          list: recommend.model.mom.topic2.detail,
                        ),
                      ],
                      if (isTopic3H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic3.header}',
                          itemCount: recommend.model.mom.topic3.detail.length,
                          list: recommend.model.mom.topic3.detail,
                        ),
                      ],
                      if (isTopic4H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic4.header}',
                          itemCount: recommend.model.mom.topic4.detail.length,
                          list: recommend.model.mom.topic4.detail,
                        ),
                      ],
                      if (isTopic5H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic5.header}',
                          itemCount: recommend.model.mom.topic5.detail.length,
                          list: recommend.model.mom.topic5.detail,
                        ),
                      ],
                      if (isTopic6H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic6.header}',
                          itemCount: recommend.model.mom.topic6.detail.length,
                          list: recommend.model.mom.topic6.detail,
                        ),
                      ],
                      if (isTopic7H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic7.header}',
                          itemCount: recommend.model.mom.topic7.detail.length,
                          list: recommend.model.mom.topic7.detail,
                        ),
                      ],
                      if (isTopic8H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic8.header}',
                          itemCount: recommend.model.mom.topic8.detail.length,
                          list: recommend.model.mom.topic8.detail,
                        ),
                      ],
                      if (isTopic9H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic9.header}',
                          itemCount: recommend.model.mom.topic9.detail.length,
                          list: recommend.model.mom.topic9.detail,
                        ),
                      ],
                      if (isTopic10H2) ...[
                        Accordion(
                          title: '• ${recommend.model.mom.topic10.header}',
                          itemCount: recommend.model.mom.topic10.detail.length,
                          list: recommend.model.mom.topic10.detail,
                        ),
                      ],
                    ],
                  ),
                ),
                appColor: appColor,
              ),
            ],
            if (isTopic1H3) ...[
              WidgetCard.instance.show(
                context: context,
                title: 'ทารกที่ได้รับนมดัดแปลง',
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isTopic1H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic1.header}',
                          itemCount:
                              recommend.model.modified.topic1.detail.length,
                          list: recommend.model.modified.topic1.detail,
                        ),
                      ],
                      if (isTopic2H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic2.header}',
                          itemCount:
                              recommend.model.modified.topic2.detail.length,
                          list: recommend.model.modified.topic2.detail,
                        ),
                      ],
                      if (isTopic3H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic3.header}',
                          itemCount:
                              recommend.model.modified.topic3.detail.length,
                          list: recommend.model.modified.topic3.detail,
                        ),
                      ],
                      if (isTopic4H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic4.header}',
                          itemCount:
                              recommend.model.modified.topic4.detail.length,
                          list: recommend.model.modified.topic4.detail,
                        ),
                      ],
                      if (isTopic5H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic5.header}',
                          itemCount:
                              recommend.model.modified.topic5.detail.length,
                          list: recommend.model.modified.topic5.detail,
                        ),
                      ],
                      if (isTopic6H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic6.header}',
                          itemCount:
                              recommend.model.modified.topic6.detail.length,
                          list: recommend.model.modified.topic6.detail,
                        ),
                      ],
                      if (isTopic7H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic7.header}',
                          itemCount:
                              recommend.model.modified.topic7.detail.length,
                          list: recommend.model.modified.topic7.detail,
                        ),
                      ],
                      if (isTopic8H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic8.header}',
                          itemCount:
                              recommend.model.modified.topic8.detail.length,
                          list: recommend.model.modified.topic8.detail,
                        ),
                      ],
                      if (isTopic9H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic9.header}',
                          itemCount:
                              recommend.model.modified.topic9.detail.length,
                          list: recommend.model.modified.topic9.detail,
                        ),
                      ],
                      if (isTopic10H3) ...[
                        Accordion(
                          title: '• ${recommend.model.modified.topic10.header}',
                          itemCount:
                              recommend.model.modified.topic10.detail.length,
                          list: recommend.model.modified.topic10.detail,
                        ),
                      ],
                    ],
                  ),
                ),
                appColor: appColor,
              ),
            ],
          ],
        ),
      ),
    );
  } else if (recommend is StateGetRecommendInfoFetchNotFound) {
    bottomSheetRecommend(
      context: context,
      child: Column(
        children: [
          'ไม่พบข้อมูล'.textTitle(context),
        ],
      ),
    );
  } else if (recommend is StateGetRecommendInfoFetchError) {
    bottomSheetRecommend(
      context: context,
      child: Column(
        children: [
          'เกิดข้อผิดพลาดในการเรียกขอข้อมูล'.textTitle(context),
        ],
      ),
    );
  }
}
