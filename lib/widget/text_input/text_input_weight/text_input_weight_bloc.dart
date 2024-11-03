import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_input_weight_event.dart';
part 'text_input_weight_state.dart';

class TextInputWeightBloc
    extends Bloc<EventTextInputWeight, StateTextInputWeight> {
  TextInputWeightBloc() : super(const StateTextInputWeight(weight: '')) {
    on<EventTextInputWeight>((event, emit) {
      emit(
        state.copyWith(
          weight: event.weight,
        ),
      );
    });
  }
}
