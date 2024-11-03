import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/calculate.dart';
import '../../../helper/size.dart';
import '../../../helper/color.dart';
import '../../../helper/time.dart';
import '../../../network/model/edit_body_info/edit_body_info_request.dart';
import '../../../network/model/input_body_info/add_body_info_request.dart';
import '../../../storage/Creator/creator_bloc.dart';
import '../../../storage/Permission/permission_bloc.dart';
import '../../../widget/button.dart';
import '../../../helper/string.dart';
import '../../../widget/select/select_birth.dart';
import '../../../widget/select/select_birth_day/select_birth_day_bloc.dart';
import '../../../widget/select/select_birth_month/select_birth_month_bloc.dart';
import '../../../widget/select/select_birth_year/select_birth_year_bloc.dart';
import '../../../widget/select/select_measure.dart';
import '../../../widget/select/select_measure_day/select_measure_day_bloc.dart';
import '../../../widget/select/select_measure_month/select_measure_month_bloc.dart';
import '../../../widget/select/select_measure_year/select_measure_year_bloc.dart';
import '../../../widget/text_input/text_input.dart';
import '../../../widget/bottom_sheet.dart';
import '../../../widget/text_input/text_input_address/text_input_address_bloc.dart';
import '../../../widget/text_input/text_input_height/text_input_height_bloc.dart';
import '../../../widget/text_input/text_input_nickname/text_input_nickname_bloc.dart';
import '../../../widget/text_input/text_input_phone/text_input_phone_bloc.dart';
import '../../../widget/text_input/text_input_weight/text_input_weight_bloc.dart';
import '../../../widget/toggle_button/toggle_button_gender.dart';
import '../../../widget/toggle_button/toggle_button_gender/toggle_button_gender_bloc.dart';
import '../../../screen/input_body_info/state/edit_body_info/edit_body_info_bloc.dart';
import '../state/add_body_info/add_body_info_bloc.dart';

Widget tab1({
  required BuildContext context,
  required VoidCallback nextTab,
  required AppColor appColor,
  required TextEditingController nicknameController,
  required StateSelectBirthDay birthDay,
  required StateSelectBirthMonth birthMonth,
  required StateSelectBirthYear birthYear,
  required CalculateX calculateX,
  required DateTimeX dateTimeX,
}) {
  bool condition = birthDay.day.contains('วัน') ||
      (birthMonth.month.contains('เดือน') || birthMonth.month.contains('00')) ||
      birthYear.year.contains('ปี');
  int? yearY;
  int? yearM;
  if (!condition) {
    int index = dateTimeX.thaiShortMonthToIndex(birthMonth.month);
    yearY =
        calculateX.age(birthday: '${birthDay.day}-$index-${birthYear.year}')[0];
    yearM =
        calculateX.age(birthday: '${birthDay.day}-$index-${birthYear.year}')[1];
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 2.0,
          runSpacing: 2.0,
          children: [
            inputNickname(
              context: context,
              controller: nicknameController,
              icon: Icons.info_rounded,
              hintText: 'ชื่อเล่น',
              appColor: appColor,
              width: context.width * .9,
              textAlign: TextAlign.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'วันเกิด'.textTitleTab(context),
                      if (yearY != null && yearM != null) ...[
                        '$yearY ปี $yearM เดือน'.textTitleTab(context),
                      ],
                    ],
                  ),
                ),
                const Divider(
                  indent: 5.0,
                  endIndent: 5.0,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 2.0,
                  runSpacing: 2.0,
                  children: [
                    buttonBottomSheet(
                      context: context,
                      string: birthDay.day,
                      width: context.width * .25,
                      function: () => selectBirthDay(context: context),
                      appColor: appColor,
                    ),
                    buttonBottomSheet(
                      context: context,
                      string: birthMonth.month,
                      width: context.width * .35,
                      function: () => selectBirthMonth(context: context),
                      appColor: appColor,
                    ),
                    buttonBottomSheet(
                      context: context,
                      string: birthYear.year,
                      width: context.width * .25,
                      function: () => selectBirthYear(context: context),
                      appColor: appColor,
                    ),
                  ],
                ),
                const Divider(
                  indent: 5.0,
                  endIndent: 5.0,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: buttonIconColor(
                context: context,
                string: 'ถัดไป',
                function: nextTab,
                icon: Icons.arrow_back_ios_rounded,
                color: appColor.blue,
                appColor: appColor,
                rtl: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget tab2({
  required BuildContext context,
  required List<Widget> icons,
  required VoidCallback backTab,
  required AppColor appColor,
  required StateToggleButtonGender isSelected,
  required TextEditingController heightController,
  required TextEditingController weightController,
  required StateSelectMeasureDay measureDay,
  required StateSelectMeasureMonth measureMonth,
  required StateSelectMeasureYear measureYear,
  required StateTextInputNickName nickname,
  required StateTextInputAddress address,
  required StateTextInputPhone phone,
  required StateSelectBirthDay birthDay,
  required StateSelectBirthMonth birthMonth,
  required StateSelectBirthYear birthYear,
  required StateTextInputHeight height,
  required StateTextInputWeight weight,
  required StateCreator creator,
  required DateTimeX dateTimeX,
  required StatePermission permission,
  bool isEdit = false,
  int? id,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 2.0,
          runSpacing: 2.0,
          children: [
            toggleButton(
              context: context,
              appColor: appColor,
              children: icons,
              width: context.width * .9,
              isSelected: isSelected,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: 'วันที่ชั่งวัด'.textTitleTab(context),
                ),
                const Divider(
                  indent: 5.0,
                  endIndent: 5.0,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 2.0,
                  runSpacing: 2.0,
                  children: [
                    buttonBottomSheet(
                      context: context,
                      string: measureDay.day,
                      width: context.width * .25,
                      function: () => selectMeasureDay(context: context),
                      appColor: appColor,
                    ),
                    buttonBottomSheet(
                      context: context,
                      string: measureMonth.month,
                      width: context.width * .35,
                      function: () => selectMeasureMonth(context: context),
                      appColor: appColor,
                    ),
                    buttonBottomSheet(
                      context: context,
                      string: measureYear.year,
                      width: context.width * .25,
                      function: () => selectMeasureYear(context: context),
                      appColor: appColor,
                    ),
                  ],
                ),
                const Divider(
                  indent: 5.0,
                  endIndent: 5.0,
                ),
              ],
            ),
            inputHeight(
              context: context,
              controller: heightController,
              icon: Icons.height_rounded,
              hintText: 'ส่วนสูง',
              appColor: appColor,
              width: context.width * .9,
              textAlign: TextAlign.center,
              suffixText: 'เซนติเมตร',
              keyboardType: TextInputType.number,
            ),
            inputWeight(
              context: context,
              controller: weightController,
              icon: Icons.boy_rounded,
              hintText: 'น้ำหนัก',
              appColor: appColor,
              width: context.width * .9,
              textAlign: TextAlign.center,
              suffixText: 'กิโลกรัม',
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buttonIconColor(
                    context: context,
                    string: 'ย้อนกลับ',
                    function: backTab,
                    icon: Icons.arrow_back_ios_rounded,
                    color: appColor.blue,
                    appColor: appColor,
                  ),
                  buttonIconColor(
                    context: context,
                    string: 'บันทึก',
                    function: () {
                      var gender = isSelected.gender[0] ? 'ชาย' : 'หญิง';
                      var birth = dateTimeX.thaiFormat(
                        day: birthDay.day,
                        month: birthMonth.month,
                        year: birthYear.year,
                      );
                      var measure = dateTimeX.thaiFormat(
                        day: measureDay.day,
                        month: measureMonth.month,
                        year: measureYear.year,
                      );
                      if (isEdit) {
                        if (id != null) {
                          context.read<EditBodyInfoBloc>().add(
                                EventEditBodyInfoFetching(
                                  context: context,
                                  model: EditBodyInfoRequestModel(
                                    id: id,
                                    nickname: nickname.nickname,
                                    address: address.address,
                                    phone: phone.phone,
                                    birth: birth,
                                    gender: gender,
                                    date: measure,
                                    height: height.height,
                                    weight: weight.weight,
                                    creator: creator.by,
                                    result1: '',
                                    result2: '',
                                    result3: '',
                                    department:
                                        permission.permission.department,
                                  ),
                                ),
                              );
                        }
                      } else {
                        context.read<AddBodyInfoBloc>().add(
                              EventAddBodyInfoFetching(
                                context: context,
                                model: AddBodyInfoRequestModel(
                                  nickname: nickname.nickname,
                                  address: address.address,
                                  phone: phone.phone,
                                  birth: birth,
                                  gender: gender,
                                  date: measure,
                                  height: height.height,
                                  weight: weight.weight,
                                  creator: creator.by,
                                  result1: '',
                                  result2: '',
                                  result3: '',
                                  department: permission.permission.department,
                                ),
                              ),
                            );
                      }
                    },
                    icon: Icons.save_as_rounded,
                    color: appColor.green,
                    appColor: appColor,
                    rtl: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
