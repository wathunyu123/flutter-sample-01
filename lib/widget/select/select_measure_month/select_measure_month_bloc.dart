import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/variable.dart';

part 'select_measure_month_event.dart';
part 'select_measure_month_state.dart';

class SelectMeasureMonthBloc
    extends Bloc<EventSelectMeasureMonth, StateSelectMeasureMonth> {
  SelectMeasureMonthBloc()
      : super(const StateSelectMeasureMonth(month: 'เดือน')) {
    on<EventSelectMeasureMonth>((event, emit) {
      if (event.month.isNotEmpty) {
        int? index = int.tryParse(event.month);
        if (index != null) {
          bool condition =
              !index.isNegative && !index.isInfinite && !index.isNaN;
          if (condition) {
            String month = VariableX.instance.thaiShortMonths[index];
            emit(
              state.copyWith(
                month: month,
              ),
            );
          }
        } else {
          emit(
            state.copyWith(
              month: 'เดือน',
            ),
          );
        }
      }
    });
  }
}
