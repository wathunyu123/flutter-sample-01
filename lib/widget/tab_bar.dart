import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../network/model/get_level_recommend_info/get_level_recommend_info_request.dart';
import '../screen/nutrition_assessment/state/get_level_recommend_info/get_level_recommend_info_bloc.dart';
import 'button.dart';
import 'power_bar.dart';
import '../helper/column.dart';
import '../helper/string.dart';
import '../helper/color.dart';
import '../helper/icon.dart';
import '../network/model/delete_body_info/delete_body_info_request.dart';
import '../network/model/get_recommend_info/get_recommend_info_request.dart';
import '../router/define.dart';
import '../screen/input_body_info/state/delete_body_info/delete_body_info_bloc.dart';
import '../screen/input_body_info/state/edit_body_info/edit_body_info_bloc.dart';
import '../screen/nutrition_assessment/component/bottomSheet.dart';
import '../screen/nutrition_assessment/state/calculate_body_info/calculate_body_info_bloc.dart';
import '../screen/nutrition_assessment/state/get_recommend_info/get_recommend_info_bloc.dart';
import '../screen/nutrition_assessment/state/select_body_info/select_body_info_bloc.dart';
import '../../helper/size.dart';
import '../../widget/load.dart';

Widget tabViwer({
  Widget? title,
  Widget? leading,
  double? leadingWidth,
  required int length,
  required List<Widget> tabs,
  required List<Widget> children,
  required AppColor appColor,
  required AppIcon appIcon,
  required TabController tabController,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10.0,
      ),
      color: appColor.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: DefaultTabController(
        length: length,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: leading,
            leadingWidth: leadingWidth,
            bottom: TabBar(
              controller: tabController,
              tabs: tabs,
            ),
            title: title,
          ),
          body: TabBarView(
            controller: tabController,
            children: children,
          ),
        ),
      ),
    ),
  );
}

class DetailTabBar extends StatefulWidget implements PreferredSizeWidget {
  const DetailTabBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  State<DetailTabBar> createState() {
    return _DetailTabBarState();
  }
}

class _DetailTabBarState extends State<DetailTabBar>
    with SingleTickerProviderStateMixin {
  final AppColor appColor = AppColor.instance;
  late TabController tabController;
  final Map<String, IconData> tabs = {
    'ข้อมูล': Icons.app_registration_rounded,
    'ประเมิน': Icons.app_shortcut_rounded,
  };
  late List<Color> tabColors;
  late Color currentColor;

  @override
  void initState() {
    initBloc();
    initVariable();
    tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    currentColor = tabColors.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectBodyInfo =
        context.select((SelectBodyInfoBloc bloc) => bloc.state);
    var calculate = context.select((CalculateBodyInfoBloc bloc) => bloc.state);
    if (calculate is StateCalculateBodyInfoInitial) {
      context.read<CalculateBodyInfoBloc>().add(
            EventCalculateBodyInfoFetching(
              model: selectBodyInfo.model,
            ),
          );
    }
    var recommend = context.select((GetRecommendInfoBloc bloc) => bloc.state);
    if (recommend is StateGetRecommendInfoInitial) {
      if (calculate is StateCalculateBodyInfoFetchSuccess) {
        context.read<GetRecommendInfoBloc>().add(
              EventGetRecommendInfoFetching(
                context: context,
                model: GetRecommendInfoRequestModel(
                  month: calculate.model.ageDateMonth,
                ),
              ),
            );
        context.read<GetLevelRecommendInfoBloc>().add(
              EventGetLevelRecommendInfoFetching(
                context: context,
                model: GetLevelRecommendInfoRequestModel(
                  month: calculate.model.ageDateMonth,
                  levelHeightAge: calculate.heightByAge.heightByAge.level,
                  levelHeightWeight:
                      calculate.heightByWeight.heightByWeight.level,
                ),
              ),
            );
      }
    }
    var level = context.select((GetLevelRecommendInfoBloc bloc) => bloc.state);

    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        height: context.height * .8,
      ),
      child: Container(
        // margin: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: appColor.grey,
        ),
        clipBehavior: Clip.hardEdge,
        child: Theme(
          data: ThemeData(
            highlightColor: appColor.transparent,
            splashColor: appColor.transparent,
          ),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(
                context.width * .95,
                context.width * .2,
              ),
              child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: currentColor,
                ),
                onTap: (value) {
                  setState(() {
                    currentColor = tabColors[value];
                  });
                },
                dividerColor: appColor.transparent,
                labelColor: appColor.white,
                unselectedLabelColor: appColor.darkBlack.withOpacity(.25),
                tabs: tabs.entries.map((entry) {
                  String label = entry.key;
                  IconData icon = entry.value;
                  return ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: context.width * .2,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 0.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 2.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(icon),
                          label.textTitleDetailTab(context),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                // tabs
                //     .map(
                //       (label) => ConstrainedBox(
                //         constraints:
                //             BoxConstraints.expand(height: context.width * .15),
                //         child: Container(
                //           margin: const EdgeInsets.symmetric(
                //             horizontal: 0.0,
                //           ),
                //           padding: const EdgeInsets.symmetric(
                //             vertical: 5.0,
                //             horizontal: 2.0,
                //           ),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Icon(la)
                //               label.textTitleDetailTab(context),
                //             ],
                //           ),
                //         ),
                //       ),
                //     )
                //     .toList(),
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: <Widget>[
                // Tab 1
                if (calculate is StateCalculateBodyInfoFetchSuccess) ...[
                  Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: context.height * .61,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Columns.instance.twoColumn(
                                    context: context,
                                    listString: <String>[
                                      'ชื่อเล่น',
                                      calculate.model.nickName,
                                      'ที่อยู่',
                                      calculate.model.address,
                                      'เบอร์โทร',
                                      calculate.model.phone,
                                      'อายุปัจจุบัน',
                                      calculate.model.ageCurrent,
                                      'อายุ ณ วันวัดชั่ง',
                                      calculate.model.ageDate,
                                      'วันที่วัด',
                                      calculate.model.date,
                                      'เพศ',
                                      calculate.model.gender,
                                      'วันเกิด',
                                      calculate.model.birth,
                                      'ส่วนสูง',
                                      calculate.model.height,
                                      'น้ำหนัก',
                                      calculate.model.weight,
                                      'Ideal Body Weight (IBW)',
                                      calculate.model.ibw,
                                      'น้ำหนักเป็น',
                                      calculate.model.weightAs,
                                      'Median Height-for-age (HA)',
                                      calculate.model.ha,
                                      'ส่วนสูงเป็น',
                                      calculate.model.heightAs,
                                    ],
                                    appColor: appColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: context.height * .1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buttonIconColor(
                                context: context,
                                string: 'แก้ไข',
                                function: () => context
                                    .push(RouterName.editBodyInfo.toPath),
                                color: appColor.blue,
                                icon: Icons.edit_rounded,
                                appColor: appColor,
                              ),
                              buttonIconColor(
                                context: context,
                                string: 'ลบ',
                                function: () {
                                  context.read<DeleteBodyInfoBloc>().add(
                                        EventDeleteBodyInfoFetching(
                                          context: context,
                                          model: DeleteBodyInfoRequestModel(
                                            id: selectBodyInfo.model.id,
                                            nickname:
                                                selectBodyInfo.model.nickname,
                                            address:
                                                selectBodyInfo.model.address,
                                            phone: selectBodyInfo.model.phone,
                                            birth: selectBodyInfo.model.birth,
                                            gender: selectBodyInfo.model.gender,
                                            date: selectBodyInfo.model.date,
                                            height: selectBodyInfo.model.height,
                                            weight: selectBodyInfo.model.weight,
                                            creator:
                                                selectBodyInfo.model.creator,
                                            result1:
                                                selectBodyInfo.model.result1,
                                            result2:
                                                selectBodyInfo.model.result2,
                                            result3:
                                                selectBodyInfo.model.result3,
                                            department:
                                                selectBodyInfo.model.department,
                                          ),
                                        ),
                                      );
                                },
                                color: appColor.red,
                                icon: Icons.delete_forever_rounded,
                                appColor: appColor,
                                rtl: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  loading(context: context),
                ],
                // Tab 2
                if (calculate is StateCalculateBodyInfoFetchSuccess) ...[
                  Column(
                    children: [
                      if (recommend is StateGetRecommendInfoFetchSuccess) ...[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: context.height * .585,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 5.0,
                            ),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5.0,
                                        ),
                                        child: 'น้ำหนักตามเกณฑ์อายุ'
                                            .textTitlePowerBar(context),
                                      ),
                                      PowerBar.instance.weightForAge(
                                        context: context,
                                        levels: calculate
                                            .weightByAge.weightByAge.level,
                                        appColor: appColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5.0,
                                        ),
                                        child: 'ส่วนสูงตามเกณฑ์อายุ'
                                            .textTitlePowerBar(context),
                                      ),
                                      PowerBar.instance.heightForAge(
                                        context: context,
                                        levels: calculate
                                            .heightByAge.heightByAge.level,
                                        appColor: appColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5.0,
                                        ),
                                        child: 'น้ำหนักตามเกณฑ์ส่วนสูง'
                                            .textTitlePowerBar(context),
                                      ),
                                      PowerBar.instance.heightForWeight(
                                        context: context,
                                        levels: calculate.heightByWeight
                                            .heightByWeight.level,
                                        appColor: appColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: context.height * .1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            child: Center(
                              child: buttonRecommend(
                                context: context,
                                string: 'คำแนะนำ',
                                function: () {
                                  showRecommendInfo(
                                    context: context,
                                    appColor: appColor,
                                    recommend: recommend,
                                    level: level,
                                  );
                                },
                                color: appColor.yellow,
                                icon: 'assets/lottie/talk.lottie',
                                appColor: appColor,
                              ),
                            ),
                          ),
                        ),
                      ] else ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5.0,
                                      ),
                                      child: 'น้ำหนักตามเกณฑ์อายุ'
                                          .textTitlePowerBar(context),
                                    ),
                                    PowerBar.instance.weightForAge(
                                      context: context,
                                      levels: calculate
                                          .weightByAge.weightByAge.level,
                                      appColor: appColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5.0,
                                      ),
                                      child: 'ส่วนสูงตามเกณฑ์อายุ'
                                          .textTitlePowerBar(context),
                                    ),
                                    PowerBar.instance.heightForAge(
                                      context: context,
                                      levels: calculate
                                          .heightByAge.heightByAge.level,
                                      appColor: appColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5.0,
                                      ),
                                      child: 'น้ำหนักตามเกณฑ์ส่วนสูง'
                                          .textTitlePowerBar(context),
                                    ),
                                    PowerBar.instance.heightForWeight(
                                      context: context,
                                      levels: calculate
                                          .heightByWeight.heightByWeight.level,
                                      appColor: appColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ] else ...[
                  loading(context: context),
                ],
                // Tab 3
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 5.0,
                //     horizontal: 5.0,
                //   ),
                //   child: SingleChildScrollView(
                //     physics: const ScrollPhysics(),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Center(
                //           child: buttonIconColor(
                //             context: context,
                //             string: 'คำแนะนำ',
                //             function: () {
                //               showRecommendInfo(
                //                 context: context,
                //                 appColor: appColor,
                //                 recommend: recommend,
                //               );
                //             },
                //             color: appColor.yellow,
                //             icon: Icons.star_rounded,
                //             appColor: appColor,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initBloc() {
    context.read<CalculateBodyInfoBloc>().add(
          EventCalculateBodyInfoInitial(),
        );
    context.read<EditBodyInfoBloc>().add(
          EventEditBodyInfoInitial(),
        );
    context.read<DeleteBodyInfoBloc>().add(
          EventDeleteBodyInfoInitial(),
        );
    context.read<GetRecommendInfoBloc>().add(
          EventGetRecommendInfoInitial(),
        );
    context.read<GetLevelRecommendInfoBloc>().add(
          EventGetLevelRecommendInfoInitial(),
        );
  }

  void initVariable() {
    tabColors = [
      appColor.blue,
      appColor.deepPurple,
      appColor.green,
    ];
  }
}
