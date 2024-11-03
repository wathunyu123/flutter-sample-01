import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/variable.dart';

part 'select_measure_year_event.dart';
part 'select_measure_year_state.dart';

class SelectMeasureYearBloc
    extends Bloc<EventSelectMeasureYear, StateSelectMeasureYear> {
  SelectMeasureYearBloc() : super(const StateSelectMeasureYear(year: 'ปี')) {
    on<EventSelectMeasureYear>((event, emit) {
      if (event.year.isNotEmpty) {
        int? index = int.tryParse(event.year);
        if (index != null) {
          if (index.toString().length >= 4) {
            emit(
              state.copyWith(
                year: index.toString(),
              ),
            );
          } else {
            bool condition =
                !index.isNegative && !index.isInfinite && !index.isNaN;
            if (condition) {
              String year = VariableX.instance.buddhaYear[index];
              emit(
                state.copyWith(
                  year: year,
                ),
              );
            }
          }
        } else {
          emit(
            state.copyWith(
              year: 'ปี',
            ),
          );
        }
      }
    });
  }
}
