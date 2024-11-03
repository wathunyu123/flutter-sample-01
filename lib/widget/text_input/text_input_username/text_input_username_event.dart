part of 'text_input_username_bloc.dart';

@override
class EventTextInputUsername extends Equatable {
  final String username;

  const EventTextInputUsername({
    required this.username,
  });

  EventTextInputUsername copyWith({
    String? username,
  }) {
    return EventTextInputUsername(
      username: username ?? this.username,
    );
  }

  @override
  List<Object> get props => [
        username,
      ];
}
