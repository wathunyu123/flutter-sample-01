import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../helper/string.dart';
import '../../helper/size.dart';
import 'select_measure_day/select_measure_day_bloc.dart';
import 'select_measure_year/select_measure_year_bloc.dart';
import 'select_measure_month/select_measure_month_bloc.dart';
import '../bottom_sheet.dart';
import '../../helper/variable.dart';

Future<T?> selectMeasureDay<T>({required BuildContext context}) async {
  bottomSheetMeasure(
    context: context,
    child: ConstrainedBox(
      constraints: BoxConstraints.expand(height: context.height * .75),
      child: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: VariableX.instance.days.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: VariableX.instance.days[index].textListTile(context),
            onTap: () {
              context.read<SelectMeasureDayBloc>().add(
                    EventSelectMeasureDay(
                      day: index.toString(),
                    ),
                  );
              context.pop();
            },
          );
        },
      ),
    ),
  );
}

Future<T?> selectMeasureMonth<T>({required BuildContext context}) async {
  bottomSheetMeasure(
    context: context,
    child: ConstrainedBox(
      constraints: BoxConstraints.expand(height: context.height * .75),
      child: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: VariableX.instance.thaiShortMonths.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VariableX.instance.thaiFullMonths[index].textListTile(context),
                VariableX.instance.thaiShortMonths[index].textListTile(context),
              ],
            ),
            onTap: () {
              context.read<SelectMeasureMonthBloc>().add(
                    EventSelectMeasureMonth(
                      month: index.toString(),
                    ),
                  );
              context.pop();
            },
          );
        },
      ),
    ),
  );
}

Future<T?> selectMeasureYear<T>({required BuildContext context}) async {
  bottomSheetMeasure(
    context: context,
    child: ConstrainedBox(
      constraints: BoxConstraints.expand(height: context.height * .75),
      child: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: VariableX.instance.buddhaYear.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VariableX.instance.buddhaYear[index].textListTile(context),
                '(${VariableX.instance.christYear[index]})'
                    .textListTile(context),
              ],
            ),
            onTap: () {
              context.read<SelectMeasureYearBloc>().add(
                    EventSelectMeasureYear(
                      year: index.toString(),
                    ),
                  );
              context.pop();
            },
          );
        },
      ),
    ),
  );
}
