import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_input_username_event.dart';
part 'text_input_username_state.dart';

class TextInputUsernameBloc
    extends Bloc<EventTextInputUsername, StateTextInputUsername> {
  TextInputUsernameBloc() : super(const StateTextInputUsername(text: '')) {
    on<EventTextInputUsername>((event, emit) {
      emit(
        state.copyWith(
          text: event.username,
        ),
      );
    });
  }
}
