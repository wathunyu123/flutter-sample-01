import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/text_input/text_input_address/text_input_address_bloc.dart';
import '../../widget/text_input/text_input_phone/text_input_phone_bloc.dart';
import 'component/body.dart';
import '../../helper/calculate.dart';
import '../../helper/time.dart';
import '../../storage/Creator/creator_bloc.dart';
import '../../widget/select/select_birth_day/select_birth_day_bloc.dart';
import '../../widget/select/select_birth_month/select_birth_month_bloc.dart';
import '../../widget/select/select_birth_year/select_birth_year_bloc.dart';
import '../../widget/select/select_measure_day/select_measure_day_bloc.dart';
import '../../widget/select/select_measure_month/select_measure_month_bloc.dart';
import '../../widget/select/select_measure_year/select_measure_year_bloc.dart';
import '../../widget/text_input/text_input_height/text_input_height_bloc.dart';
import '../../widget/text_input/text_input_nickname/text_input_nickname_bloc.dart';
import '../../widget/text_input/text_input_weight/text_input_weight_bloc.dart';
import '../../widget/toggle_button/toggle_button_gender/toggle_button_gender_bloc.dart';
import '../login/component/behavior.dart';
import '../../helper/size.dart';
import '../../helper/icon.dart';
import '../../helper/color.dart';
import '../../widget/background.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class InputBodyInfoScreen extends StatefulWidget {
  const InputBodyInfoScreen({super.key});

  @override
  State<InputBodyInfoScreen> createState() {
    return _InputBodyInfoScreenState();
  }
}

class _InputBodyInfoScreenState extends State<InputBodyInfoScreen>
    with SingleTickerProviderStateMixin {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final CalculateX calculateX = CalculateX.instance;
  final DateTimeX dateTimeX = DateTimeX.instance;
  final int flexBody = 9;

  late TabController tabController;

  TextEditingController nicknameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    initBloc();
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var nickname = context.select((TextInputNicknameBloc bloc) => bloc.state);
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
    return Scaffold(
      backgroundColor: appColor.lightBlack,
      body: ScrollConfiguration(
        behavior: LoginBehavior(),
        child: SizedBox(
          height: context.height,
          child: Stack(
            children: [
              const Background(),
              Column(
                children: [
                  Expanded(
                    flex: flexBody,
                    child: body(
                      context: context,
                      appColor: appColor,
                      appIcon: appIcon,
                      tabController: tabController,
                      isSelected: isGender,
                      nicknameController: nicknameController,
                      heightController: heightController,
                      weightController: weightController,
                      birthDay: birthDay,
                      birthMonth: birthMonth,
                      birthYear: birthYear,
                      measureDay: measureDay,
                      measureMonth: measureMonth,
                      measureYear: measureYear,
                      nickname: nickname,
                      height: height,
                      weight: weight,
                      creator: creator,
                      calculateX: calculateX,
                      dateTimeX: dateTimeX,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initBloc() {
    context.read<SelectBirthDayBloc>().add(
          const EventSelectBirthDay(
            day: 'วัน',
          ),
        );
    context.read<ToggleButtonGenderBloc>().add(
          const EventToggleButtonGender(
            gender: [
              true,
              false,
            ],
          ),
        );
    context.read<TextInputNicknameBloc>().add(
          const EventTextInputNickname(
            nickname: '',
          ),
        );
    context.read<TextInputAddressBloc>().add(
          const EventTextInputAddress(
            address: '',
          ),
        );
    context.read<TextInputPhoneBloc>().add(
          const EventTextInputPhone(
            phone: '',
          ),
        );
    context.read<TextInputHeightBloc>().add(
          const EventTextInputHeight(
            height: '',
          ),
        );
    context.read<TextInputWeightBloc>().add(
          const EventTextInputWeight(
            weight: '',
          ),
        );
    context.read<SelectBirthDayBloc>().add(
          const EventSelectBirthDay(
            day: 'วัน',
          ),
        );
    context.read<SelectBirthMonthBloc>().add(
          const EventSelectBirthMonth(
            month: 'เดือน',
          ),
        );
    context.read<SelectBirthYearBloc>().add(
          const EventSelectBirthYear(
            year: 'ปี',
          ),
        );
    context.read<SelectMeasureDayBloc>().add(
          const EventSelectMeasureDay(
            day: 'วัน',
          ),
        );
    context.read<SelectMeasureMonthBloc>().add(
          const EventSelectMeasureMonth(
            month: 'เดือน',
          ),
        );
    context.read<SelectMeasureYearBloc>().add(
          const EventSelectMeasureYear(
            year: 'ปี',
          ),
        );
  }
}
