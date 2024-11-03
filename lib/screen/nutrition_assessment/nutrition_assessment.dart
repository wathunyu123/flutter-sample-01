import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../storage/Creator/creator_bloc.dart';
import 'component/body.dart';
import '../../helper/text_style.dart';
import '../../widget/text.dart';
import '../login/component/behavior.dart';
import '../../helper/size.dart';
import '../../helper/icon.dart';
import '../../helper/color.dart';
import '../../widget/background.dart';
import 'state/get_body_info/get_body_info_bloc.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class NutritionAssessmentScreen extends StatefulWidget {
  const NutritionAssessmentScreen({super.key});

  @override
  _NutritionAssessmentScreenState createState() =>
      _NutritionAssessmentScreenState();
}

class _NutritionAssessmentScreenState extends State<NutritionAssessmentScreen> {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final AppText appText = AppText.instance;
  final AppTextStyle appTextStyle = AppTextStyle.instance;
  final int flexBody = 9;

  @override
  void initState() {
    context.read<GetBodyInfoBloc>().add(
          EventGetBodyInfoInitial(),
        );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userId = context.select((CreatorBloc bloc) => bloc.state);
    var bodyInfo = context.select((GetBodyInfoBloc bloc) => bloc.state);
    if (bodyInfo is StateGetBodyInfoInitial) {
      context.read<GetBodyInfoBloc>().add(
            EventGetBodyInfoAllFetching(
              context: context,
              userId: userId.by,
            ),
          );
    }
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
                      appText: appText,
                      appTextStyle: appTextStyle,
                      bodyInfo: bodyInfo,
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
}
