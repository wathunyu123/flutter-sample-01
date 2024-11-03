import 'package:flutter/material.dart';

import 'component/body.dart';
import '../../helper/time.dart';
import '../../widget/text.dart';
import '../../helper/calculate.dart';
import '../../helper/text_style.dart';
import '../login/component/behavior.dart';
import '../../helper/size.dart';
import '../../helper/icon.dart';
import '../../helper/color.dart';
import '../../widget/background.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class NutritionAssessmentDetailScreen extends StatefulWidget {
  const NutritionAssessmentDetailScreen({super.key});

  @override
  _NutritionAssessmentScreenDetailState createState() =>
      _NutritionAssessmentScreenDetailState();
}

class _NutritionAssessmentScreenDetailState
    extends State<NutritionAssessmentDetailScreen> {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final AppText appText = AppText.instance;
  final AppTextStyle appTextStyle = AppTextStyle.instance;
  final CalculateX calculateX = CalculateX.instance;
  final DateTimeX dateTimeX = DateTimeX.instance;
  final int flexBody = 9;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: bodyDetail(
                      context: context,
                      appColor: appColor,
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
