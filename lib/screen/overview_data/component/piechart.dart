import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/color.dart';
import '../../../helper/icon.dart';
import '../../../helper/text_style.dart';
import '../../../widget/text.dart';
import '../state/overview_data_department/overview_data_department_bloc.dart';
import '../state/overview_data_user/overview_data_user_bloc.dart';
import 'indicator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final AppText appText = AppText.instance;
  final AppTextStyle appTextStyle = AppTextStyle.instance;
  int touchedIndex = -1;

  double countUser = .0;
  double countDepartment = .0;

  @override
  Widget build(BuildContext context) {
    var overviewDataUser =
        context.select((GetOverviewDataUserBloc bloc) => bloc.state);
    var overviewDataDepartment =
        context.select((GetOverviewDataDepartmentBloc bloc) => bloc.state);
    if (overviewDataUser is StateOverviewDataUserFetchSuccess) {
      countUser = double.tryParse(overviewDataUser.countUser.toString()) ?? .0;
    }
    if (overviewDataDepartment is StateOverviewDataDepartmentFetchSuccess) {
      countDepartment =
          double.tryParse(overviewDataDepartment.countDepartment.toString()) ??
              .0;
    }
    if (countUser > 0 && countDepartment > 0) {
      return AspectRatio(
        aspectRatio: 1.3,
        child: Row(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 3.0,
                  ),
                  child: Indicator(
                    color: appColor.deepBlue,
                    text: 'บัญชีนี้',
                    isSquare: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 3.0,
                  ),
                  child: Indicator(
                    color: appColor.red,
                    text: 'สังกัด',
                    isSquare: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 30.0 : 20.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: appColor.deepBlue,
            value: countUser,
            title: countUser.toStringAsFixed(0),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: appColor.darkBlack,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: appColor.red,
            value: countDepartment,
            title: countDepartment.toStringAsFixed(0),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: appColor.darkBlack,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
