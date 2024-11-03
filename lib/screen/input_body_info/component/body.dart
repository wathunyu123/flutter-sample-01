import 'package:flutter/material.dart';

import '../../../helper/calculate.dart';
import '../../../helper/time.dart';
import '../../../storage/Creator/creator_bloc.dart';
import '../../../widget/select/select_birth_day/select_birth_day_bloc.dart';
import '../../../widget/select/select_birth_month/select_birth_month_bloc.dart';
import '../../../widget/select/select_birth_year/select_birth_year_bloc.dart';
import '../../../widget/select/select_measure_day/select_measure_day_bloc.dart';
import '../../../widget/select/select_measure_month/select_measure_month_bloc.dart';
import '../../../widget/select/select_measure_year/select_measure_year_bloc.dart';
import '../../../widget/text_input/text_input_height/text_input_height_bloc.dart';
import '../../../widget/text_input/text_input_nickname/text_input_nickname_bloc.dart';
import '../../../widget/text_input/text_input_weight/text_input_weight_bloc.dart';
import 'page1.dart';
import 'tab.dart';
import '../../../helper/size.dart';
import '../../../helper/icon.dart';
import '../../../helper/color.dart';
import '../../../helper/string.dart';
import '../../../widget/button.dart';
import '../../../widget/tab_bar.dart';
import '../../../widget/toggle_button/toggle_button_gender/toggle_button_gender_bloc.dart';

Widget body({
  required BuildContext context,
  required AppColor appColor,
  required AppIcon appIcon,
  required TabController tabController,
  required StateToggleButtonGender isSelected,
  required TextEditingController nicknameController,
  required TextEditingController heightController,
  required TextEditingController weightController,
  required StateSelectBirthDay birthDay,
  required StateSelectBirthMonth birthMonth,
  required StateSelectBirthYear birthYear,
  required StateSelectMeasureDay measureDay,
  required StateSelectMeasureMonth measureMonth,
  required StateSelectMeasureYear measureYear,
  required StateTextInputNickName nickname,
  required StateTextInputHeight height,
  required StateTextInputWeight weight,
  required StateCreator creator,
  required CalculateX calculateX,
  required DateTimeX dateTimeX,
  bool isEdit = false,
  int? id,
}) {
  void nextTab() {
    if (tabController.index < tabController.length - 1) {
      tabController.animateTo(tabController.index + 1);
    }
  }

  void backTab() {
    if (tabController.index > 0) {
      tabController.animateTo(tabController.index - 1);
    }
  }

  final List<Widget> icons = <Widget>[
    SizedBox(
      width: context.width * .35,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.male_rounded),
          Text('ชาย'),
        ],
      ),
    ),
    SizedBox(
      width: context.width * .35,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.female_rounded),
          Text('หญิง'),
        ],
      ),
    ),
  ];

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
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: context.height * .835,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColor.white,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2.0,
                              ),
                              child: isEdit
                                  ? Page1(
                                      isEdit: isEdit,
                                      id: id,
                                    )
                                  : const Page1(),
                            ),
                          ),
                          // tabViwer(
                          //   tabController: tabController,
                          //   title: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       'บันทึกข้อมูล'.textTitle(context),
                          //     ],
                          //   ),
                          //   length: 2,
                          //   tabs: [
                          //     const Tab(
                          //       icon: Icon(Icons.add_reaction_rounded),
                          //       text: 'ทั่วไป',
                          //     ),
                          //     const Tab(
                          //       icon: Icon(Icons.boy_rounded),
                          //       text: 'ร่างกาย',
                          //     ),
                          //   ],
                          //   children: [
                          //     SingleChildScrollView(
                          //       physics: const ScrollPhysics(),
                          //       child: tab1(
                          //         context: context,
                          //         nicknameController: nicknameController,
                          //         nextTab: nextTab,
                          //         appColor: appColor,
                          //         birthDay: birthDay,
                          //         birthMonth: birthMonth,
                          //         birthYear: birthYear,
                          //         calculateX: calculateX,
                          //         dateTimeX: dateTimeX,
                          //       ),
                          //     ),
                          //     SingleChildScrollView(
                          //       physics: const ScrollPhysics(),
                          //       child: tab2(
                          //         context: context,
                          //         heightController: heightController,
                          //         weightController: weightController,
                          //         icons: icons,
                          //         backTab: backTab,
                          //         appColor: appColor,
                          //         isSelected: isSelected,
                          //         measureDay: measureDay,
                          //         measureMonth: measureMonth,
                          //         measureYear: measureYear,
                          //         nickname: nickname,
                          //         birthDay: birthDay,
                          //         birthMonth: birthMonth,
                          //         birthYear: birthYear,
                          //         height: height,
                          //         weight: weight,
                          //         creator: creator,
                          //         dateTimeX: dateTimeX,
                          //         isEdit: isEdit,
                          //         id: id,
                          //       ),
                          //     ),
                          //   ],
                          //   appColor: appColor,
                          //   appIcon: appIcon,
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              backButton(
                                context: context,
                                appColor: appColor,
                              ),
                            ],
                          ),
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
