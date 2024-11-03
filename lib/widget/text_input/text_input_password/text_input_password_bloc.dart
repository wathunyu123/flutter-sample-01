import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_input_password_event.dart';
part 'text_input_password_state.dart';

class TextInputPasswordBloc
    extends Bloc<EventTextInputPassword, StateTextInputPassword> {
  TextInputPasswordBloc() : super(const StateTextInputPassword(text: '')) {
    on<EventTextInputPassword>((event, emit) {
      emit(
        state.copyWith(
          text: event.password,
        ),
      );
    });
  }
}
