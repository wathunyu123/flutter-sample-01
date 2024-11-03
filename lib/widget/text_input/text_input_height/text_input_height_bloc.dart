import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_input_height_event.dart';
part 'text_input_height_state.dart';

class TextInputHeightBloc
    extends Bloc<EventTextInputHeight, StateTextInputHeight> {
  TextInputHeightBloc() : super(const StateTextInputHeight(height: '')) {
    on<EventTextInputHeight>((event, emit) {
      emit(
        state.copyWith(
          height: event.height,
        ),
      );
    });
  }
}
