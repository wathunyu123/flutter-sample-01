import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_input_address_event.dart';
part 'text_input_address_state.dart';

class TextInputAddressBloc
    extends Bloc<EventTextInputAddress, StateTextInputAddress> {
  TextInputAddressBloc() : super(const StateTextInputAddress(address: '')) {
    on<EventTextInputAddress>((event, emit) {
      emit(
        state.copyWith(
          address: event.address,
        ),
      );
    });
  }
}
