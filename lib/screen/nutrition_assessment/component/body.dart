import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../helper/size.dart';
import '../../../helper/icon.dart';
import '../../../helper/color.dart';
import '../../../helper/text_style.dart';
import '../../../router/define.dart';
import '../../../widget/button.dart';
import '../../../helper/string.dart';
import '../../../widget/tab_bar.dart';
import '../../../widget/text.dart';
import '../state/get_body_info/get_body_info_bloc.dart';
import '../state/select_body_info/select_body_info_bloc.dart';

Widget body({
  required BuildContext context,
  required AppColor appColor,
  required AppIcon appIcon,
  required AppText appText,
  required AppTextStyle appTextStyle,
  required GetBodyInfoState bodyInfo,
}) {
  return Align(
    alignment: Alignment.center,
    child: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            color: appColor.white.withOpacity(.55),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    width: context.width * .9,
                    height: context.height * .9,
                  ),
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      'ชื่อเล่น'.textTitleBody(context),
                                      'วันที่ชั่งวัด'.textTitleBody(context),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  indent: 5.0,
                                  endIndent: 5.0,
                                ),
                              ],
                            ),
                            if (bodyInfo
                                is StateGetBodyInfoAllFetchSuccess) ...[
                              ConstrainedBox(
                                constraints: BoxConstraints.expand(
                                  height: context.height * .76,
                                ),
                                child: ListView.builder(
                                  physics: const ScrollPhysics(),
                                  itemCount: bodyInfo.model.length,
                                  itemBuilder: (context, index) {
                                    var item = bodyInfo.model[index];
                                    return buttonListWhite(
                                      context: context,
                                      stringLeft: item.nickname,
                                      stringRight: item.date,
                                      width: context.width * .85,
                                      function: () {
                                        context.read<SelectBodyInfoBloc>().add(
                                              EventSelectBodyInfo(
                                                model: bodyInfo.model[index],
                                              ),
                                            );
                                        context.push(
                                          RouterName
                                              .nutritionAssessmentDetail.toPath,
                                        );
                                      },
                                      appColor: appColor,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              indent: 5.0,
                              endIndent: 5.0,
                            ),
                            backButton(
                              context: context,
                              appColor: appColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget bodyDetail({
  required BuildContext context,
  required AppColor appColor,
}) {
  return Align(
    alignment: Alignment.center,
    child: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            color: appColor.white.withOpacity(.55),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    width: context.width * .9,
                    height: context.height * .9,
                  ),
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: appColor.white,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DetailTabBar(),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              indent: 5.0,
                              endIndent: 5.0,
                            ),
                            backButton(
                              context: context,
                              appColor: appColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
