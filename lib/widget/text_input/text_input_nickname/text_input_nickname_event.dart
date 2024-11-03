part of 'text_input_nickname_bloc.dart';

@override
class EventTextInputNickname extends Equatable {
  final String nickname;

  const EventTextInputNickname({
    required this.nickname,
  });

  EventTextInputNickname copyWith({
    String? nickname,
  }) {
    return EventTextInputNickname(
      nickname: nickname ?? this.nickname,
    );
  }

  @override
  List<Object> get props => [
        nickname,
      ];
}
