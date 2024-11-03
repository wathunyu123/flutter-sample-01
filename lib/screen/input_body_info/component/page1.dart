import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/calculate.dart';
import '../../../helper/icon.dart';
import '../../../helper/size.dart';
import '../../../helper/svg.dart';
import '../../../helper/string.dart';
import '../../../helper/color.dart';
import '../../../helper/page_indicator.dart';
import '../../../helper/text_style.dart';
import '../../../helper/time.dart';
import '../../../network/model/edit_body_info/edit_body_info_request.dart';
import '../../../network/model/input_body_info/add_body_info_request.dart';
import '../../../storage/Creator/creator_bloc.dart';
import '../../../storage/Permission/permission_bloc.dart';
import '../../../widget/bottom_sheet.dart';
import '../../../widget/button.dart';
import '../../../widget/select/select_birth.dart';
import '../../../widget/select/select_birth_day/select_birth_day_bloc.dart';
import '../../../widget/select/select_birth_month/select_birth_month_bloc.dart';
import '../../../widget/select/select_birth_year/select_birth_year_bloc.dart';
import '../../../widget/select/select_measure.dart';
import '../../../widget/select/select_measure_day/select_measure_day_bloc.dart';
import '../../../widget/select/select_measure_month/select_measure_month_bloc.dart';
import '../../../widget/select/select_measure_year/select_measure_year_bloc.dart';
import '../../../widget/text_input/text_input.dart';
import '../../../widget/text_input/text_input_address/text_input_address_bloc.dart';
import '../../../widget/text_input/text_input_height/text_input_height_bloc.dart';
import '../../../widget/text_input/text_input_nickname/text_input_nickname_bloc.dart';
import '../../../widget/text_input/text_input_phone/text_input_phone_bloc.dart';
import '../../../widget/text_input/text_input_weight/text_input_weight_bloc.dart';
import '../../../widget/toggle_button/toggle_button_gender.dart';
import '../../../widget/toggle_button/toggle_button_gender/toggle_button_gender_bloc.dart';
import '../../nutrition_assessment/state/select_body_info/select_body_info_bloc.dart';
import '../state/add_body_info/add_body_info_bloc.dart';
import '../state/edit_body_info/edit_body_info_bloc.dart';

class Page1 extends StatefulWidget {
  final bool? isEdit;
  final int? id;
  const Page1({
    super.key,
    this.isEdit,
    this.id,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final CalculateX calculateX = CalculateX.instance;
  final DateTimeX dateTimeX = DateTimeX.instance;

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  int _totalPages = 8;

  bool isStart = true;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: _totalPages, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var nickname = context.select((TextInputNicknameBloc bloc) => bloc.state);
    var address = context.select((TextInputAddressBloc bloc) => bloc.state);
    var phone = context.select((TextInputPhoneBloc bloc) => bloc.state);
    var isGender = context.select((ToggleButtonGenderBloc bloc) => bloc.state);
    var birthDay = context.select((SelectBirthDayBloc bloc) => bloc.state);
    var birthMonth = context.select((SelectBirthMonthBloc bloc) => bloc.state);
    var birthYear = context.select((SelectBirthYearBloc bloc) => bloc.state);
    var measureDay = context.select((SelectMeasureDayBloc bloc) => bloc.state);
    var measureMonth =
        context.select((SelectMeasureMonthBloc bloc) => bloc.state);
    var measureYear =
        context.select((SelectMeasureYearBloc bloc) => bloc.state);
    var height = context.select((TextInputHeightBloc bloc) => bloc.state);
    var weight = context.select((TextInputWeightBloc bloc) => bloc.state);
    var creator = context.select((CreatorBloc bloc) => bloc.state);
    var permission = context.select((PermissionBloc bloc) => bloc.state);

    if (widget.isEdit == true) {
      var selectBodyInfo =
          context.select((SelectBodyInfoBloc bloc) => bloc.state);
      prepare(selectBodyInfo);
    }

    bool condition = birthDay.day.contains('วัน') ||
        (birthMonth.month.contains('เดือน') ||
            birthMonth.month.contains('00')) ||
        birthYear.year.contains('ปี');
    int? yearY;
    int? yearM;
    if (!condition) {
      int index = dateTimeX.thaiShortMonthToIndex(birthMonth.month);
      yearY = calculateX.age(
          birthday: '${birthDay.day}-$index-${birthYear.year}')[0];
      yearM = calculateX.age(
          birthday: '${birthDay.day}-$index-${birthYear.year}')[1];
    }

    final List<Widget> icons = <Widget>[
      SizedBox(
        width: context.width * .35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.male_rounded,
              size: context.width * .12,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'ชาย',
                style: AppTextStyle.instance.toggleButton,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: context.width * .35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.female_rounded,
              size: context.width * .12,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'หญิง',
                style: AppTextStyle.instance.toggleButton,
              ),
            ),
          ],
        ),
      ),
    ];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: <Widget>[
            item(
              context: context,
              child: inputNickname(
                context: context,
                controller: nicknameController,
                icon: Icons.info_rounded,
                hintText: 'ชื่อเล่น',
                appColor: appColor,
                width: context.width * .9,
                textAlign: TextAlign.center,
              ),
              icon: appIcon.baby,
              widget: 'ชื่อเล่น'.textTitleTab(context),
              next: true,
              required: true,
            ),
            item(
              context: context,
              child: inputAddress(
                context: context,
                controller: addressController,
                icon: Icons.home_rounded,
                hintText: 'ที่อยู่',
                appColor: appColor,
                width: context.width * .9,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
              ),
              icon: appIcon.home,
              widget: 'ที่อยู่'.textTitleTab(context),
              back: true,
              next: true,
              required: true,
            ),
            item(
              context: context,
              child: inputPhone(
                context: context,
                controller: phoneController,
                icon: Icons.phone_rounded,
                hintText: 'เบอร์โทร',
                appColor: appColor,
                width: context.width * .9,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
              icon: appIcon.phone,
              widget: 'เบอร์โทร'.textTitleTab(context),
              back: true,
              next: true,
              required: false,
            ),
            item(
              context: context,
              child: toggleButton(
                context: context,
                appColor: appColor,
                children: icons,
                width: context.width * .9,
                isSelected: isGender,
              ),
              icon: appIcon.gender,
              widget: 'เพศ'.textTitleTab(context),
              back: true,
              next: true,
              required: true,
            ),
            item(
              context: context,
              child: Wrap(
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
              icon: appIcon.birthday,
              widget: Column(
                children: [
                  'วันเกิด'.textTitleTab(context),
                  if (yearY != null && yearM != null) ...[
                    '$yearY ปี $yearM เดือน'.textTitleTabDetail(context),
                  ],
                ],
              ),
              back: true,
              next: true,
              required: true,
            ),
            item(
              context: context,
              child: Wrap(
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
              icon: appIcon.calendar,
              widget: 'วันที่ชั่งวัด'.textTitleTab(context),
              back: true,
              next: true,
              required: true,
            ),
            item(
              context: context,
              child: inputHeight(
                context: context,
                controller: heightController,
                icon: Icons.height_rounded,
                hintText: 'ส่วนสูง',
                appColor: appColor,
                width: context.width * .9,
                textAlign: TextAlign.center,
                suffixText: 'เซนติเมตร',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              icon: appIcon.measure,
              widget: 'ส่วนสูง'.textTitleTab(context),
              back: true,
              next: true,
              required: true,
            ),
            item(
              context: context,
              child: inputWeight(
                context: context,
                controller: weightController,
                icon: Icons.boy_rounded,
                hintText: 'น้ำหนัก',
                appColor: appColor,
                width: context.width * .9,
                textAlign: TextAlign.center,
                suffixText: 'กิโลกรัม',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              icon: appIcon.weight,
              widget: 'น้ำหนัก'.textTitleTab(context),
              back: true,
              submit: true,
              required: true,
              submitButton: widget.isEdit == null && widget.id == null
                  ? submitButton(
                      context: context,
                      isGender: isGender,
                      heightController: heightController,
                      weightController: weightController,
                      measureDay: measureDay,
                      measureMonth: measureMonth,
                      measureYear: measureYear,
                      nickname: nickname,
                      address: address,
                      phone: phone,
                      birthDay: birthDay,
                      birthMonth: birthMonth,
                      birthYear: birthYear,
                      height: height,
                      weight: weight,
                      creator: creator,
                      dateTimeX: dateTimeX,
                      permission: permission,
                    )
                  : submitButton(
                      context: context,
                      isGender: isGender,
                      heightController: heightController,
                      weightController: weightController,
                      measureDay: measureDay,
                      measureMonth: measureMonth,
                      measureYear: measureYear,
                      nickname: nickname,
                      address: address,
                      phone: phone,
                      birthDay: birthDay,
                      birthMonth: birthMonth,
                      birthYear: birthYear,
                      height: height,
                      weight: weight,
                      creator: creator,
                      dateTimeX: dateTimeX,
                      permission: permission,
                      isEdit: widget.isEdit ?? false,
                      id: widget.id ?? 0,
                    ),
            ),
          ],
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
        ),
      ],
    );
  }

  Widget item({
    required BuildContext context,
    required Widget child,
    required String icon,
    Widget? widget,
    bool back = false,
    bool next = false,
    bool submit = false,
    Widget? submitButton,
    bool required = false,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: context.height * .1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: icon.svgToIcon(
                width: context.icon,
                height: context.icon,
              ),
            ),
            if (widget != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: widget,
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: child,
            ),
            if (required) ...[
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: '* จำเป็น'.textRequired(context),
              ),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (back) ...[
                  buttonIconColor(
                    context: context,
                    string: 'ย้อนกลับ',
                    function: _goToPreviousPage,
                    icon: Icons.arrow_back_ios_rounded,
                    color: appColor.blue,
                    appColor: appColor,
                  ),
                ],
                if (next) ...[
                  buttonIconColor(
                    context: context,
                    string: 'ถัดไป',
                    function: _goToNextPage,
                    icon: Icons.arrow_back_ios_rounded,
                    color: appColor.green,
                    appColor: appColor,
                    rtl: TextDirection.rtl,
                  ),
                ],
                if (submit && submitButton != null) ...[
                  submitButton,
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget submitButton({
    required BuildContext context,
    required StateToggleButtonGender isGender,
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
    return buttonIconColor(
      context: context,
      string: 'บันทึก',
      function: () {
        var gender = isGender.gender[0] ? 'ชาย' : 'หญิง';
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
                      department: permission.permission.department,
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
    );
  }

  void _goToPreviousPage() {
    int previousIndex = _currentPageIndex - 1;
    if (previousIndex >= 0) {
      _updateCurrentPageIndex(previousIndex);
    }
  }

  void _goToNextPage() {
    int nextIndex = _currentPageIndex + 1;
    if (nextIndex < _totalPages) {
      _updateCurrentPageIndex(nextIndex);
    }
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void prepare(StateSelectBodyInfo selectBodyInfo) {
    if (isStart) {
      setState(() {
        isStart = !isStart;
      });
      context.read<TextInputNicknameBloc>().add(
            EventTextInputNickname(nickname: selectBodyInfo.model.nickname),
          );
      context.read<TextInputAddressBloc>().add(
            EventTextInputAddress(address: selectBodyInfo.model.address),
          );
      context.read<TextInputPhoneBloc>().add(
            EventTextInputPhone(phone: selectBodyInfo.model.phone),
          );
      var genders = selectBodyInfo.model.gender.contains('ชาย')
          ? [true, false]
          : [false, true];
      context.read<ToggleButtonGenderBloc>().add(
            EventToggleButtonGender(gender: genders),
          );
      var listBirth = dateTimeX.parseListInt(selectBodyInfo.model.birth);
      int dayBirth = listBirth[0];
      int monthBirth = listBirth[1];
      int yearBirth = listBirth[2];
      context.read<SelectBirthDayBloc>().add(
            EventSelectBirthDay(day: dayBirth.toString()),
          );
      context.read<SelectBirthMonthBloc>().add(
            EventSelectBirthMonth(month: monthBirth.toString()),
          );
      context.read<SelectBirthYearBloc>().add(
            EventSelectBirthYear(year: yearBirth.toString()),
          );

      var listDate = dateTimeX.parseListInt(selectBodyInfo.model.date);
      int dayDate = listDate[0];
      int monthDate = listDate[1];
      int yearDate = listDate[2];
      context.read<SelectMeasureDayBloc>().add(
            EventSelectMeasureDay(day: dayDate.toString()),
          );
      context.read<SelectMeasureMonthBloc>().add(
            EventSelectMeasureMonth(month: monthDate.toString()),
          );
      context.read<SelectMeasureYearBloc>().add(
            EventSelectMeasureYear(year: yearDate.toString()),
          );
      context.read<TextInputHeightBloc>().add(
            EventTextInputHeight(height: selectBodyInfo.model.height),
          );
      context.read<TextInputWeightBloc>().add(
            EventTextInputWeight(weight: selectBodyInfo.model.weight),
          );

      nicknameController.text = selectBodyInfo.model.nickname;
      addressController.text = selectBodyInfo.model.address;
      phoneController.text = selectBodyInfo.model.phone;
      heightController.text = selectBodyInfo.model.height;
      weightController.text = selectBodyInfo.model.weight;
    }
  }
}
