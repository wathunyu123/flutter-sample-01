import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_birth_day_event.dart';
part 'select_birth_day_state.dart';

class SelectBirthDayBloc
    extends Bloc<EventSelectBirthDay, StateSelectBirthDay> {
  SelectBirthDayBloc() : super(const StateSelectBirthDay(day: 'วัน')) {
    on<EventSelectBirthDay>((event, emit) {
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
