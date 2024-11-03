import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_input_phone_event.dart';
part 'text_input_phone_state.dart';

class TextInputPhoneBloc
    extends Bloc<EventTextInputPhone, StateTextInputPhone> {
  TextInputPhoneBloc() : super(const StateTextInputPhone(phone: '')) {
    on<EventTextInputPhone>((event, emit) {
      emit(
        state.copyWith(
          phone: event.phone,
        ),
      );
    });
  }
}
