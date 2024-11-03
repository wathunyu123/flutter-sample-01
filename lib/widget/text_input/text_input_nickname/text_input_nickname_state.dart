part of 'text_input_nickname_bloc.dart';

@override
class StateTextInputNickName extends Equatable {
  final String nickname;

  const StateTextInputNickName({
    required this.nickname,
  });

  StateTextInputNickName copyWith({
    String? nickname,
  }) {
    return StateTextInputNickName(
      nickname: nickname ?? this.nickname,
    );
  }

  @override
  List<Object> get props => [
        nickname,
      ];
}
