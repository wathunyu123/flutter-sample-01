import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_measure_day_event.dart';
part 'select_measure_day_state.dart';

class SelectMeasureDayBloc
    extends Bloc<EventSelectMeasureDay, StateSelectMeasureDay> {
  SelectMeasureDayBloc() : super(const StateSelectMeasureDay(day: 'วัน')) {
    on<EventSelectMeasureDay>((event, emit) {
      if (event.day.isNotEmpty) {
        int? index = int.tryParse(event.day);
        if (index != null) {
          bool condition =
              !index.isNegative && !index.isInfinite && !index.isNaN;
          if (condition) {
            String day = (index + 1).toString();
            emit(
              state.copyWith(
                day: day,
              ),
            );
          }
        } else {
          emit(
            state.copyWith(
              day: 'วัน',
            ),
          );
        }
      }
    });
  }
}
