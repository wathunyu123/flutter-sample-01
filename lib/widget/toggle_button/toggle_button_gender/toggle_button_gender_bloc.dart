import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_button_gender_event.dart';
part 'toggle_button_gender_state.dart';

class ToggleButtonGenderBloc
    extends Bloc<EventToggleButtonGender, StateToggleButtonGender> {
  ToggleButtonGenderBloc()
      : super(const StateToggleButtonGender(gender: [true, false])) {
    on<EventToggleButtonGender>((event, emit) {
      emit(
        state.copyWith(
          gender: [
            event.gender[0],
            event.gender[1],
          ],
        ),
      );
    });
  }
}
