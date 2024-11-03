import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/variable.dart';

part 'select_birth_month_event.dart';
part 'select_birth_month_state.dart';

class SelectBirthMonthBloc
    extends Bloc<EventSelectBirthMonth, StateSelectBirthMonth> {
  SelectBirthMonthBloc() : super(const StateSelectBirthMonth(month: 'เดือน')) {
    on<EventSelectBirthMonth>((event, emit) {
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
