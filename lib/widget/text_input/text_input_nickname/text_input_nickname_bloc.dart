import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_input_nickname_event.dart';
part 'text_input_nickname_state.dart';

class TextInputNicknameBloc
    extends Bloc<EventTextInputNickname, StateTextInputNickName> {
  TextInputNicknameBloc() : super(const StateTextInputNickName(nickname: '')) {
    on<EventTextInputNickname>((event, emit) {
      emit(
        state.copyWith(
          nickname: event.nickname,
        ),
      );
    });
  }
}
