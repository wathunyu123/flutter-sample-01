part of 'text_input_password_bloc.dart';

@override
class EventTextInputPassword extends Equatable {
  final String password;

  const EventTextInputPassword({
    required this.password,
  });

  EventTextInputPassword copyWith({
    String? password,
  }) {
    return EventTextInputPassword(
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        password,
      ];
}
