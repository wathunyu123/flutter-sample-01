import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../helper/string.dart';
import '../../helper/size.dart';
import '../../helper/variable.dart';
import '../bottom_sheet.dart';
import 'select_birth_day/select_birth_day_bloc.dart';
import 'select_birth_month/select_birth_month_bloc.dart';
import 'select_birth_year/select_birth_year_bloc.dart';

Future<T?> selectBirthDay<T>({required BuildContext context}) async {
  bottomSheetBirt(
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
              context.read<SelectBirthDayBloc>().add(
                    EventSelectBirthDay(
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

Future<T?> selectBirthMonth<T>({required BuildContext context}) async {
  bottomSheetBirt(
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
              context.read<SelectBirthMonthBloc>().add(
                    EventSelectBirthMonth(
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

Future<T?> selectBirthYear<T>({required BuildContext context}) async {
  bottomSheetBirt(
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
              context.read<SelectBirthYearBloc>().add(
                    EventSelectBirthYear(
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
