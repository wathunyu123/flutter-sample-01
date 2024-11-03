part of 'text_input_password_bloc.dart';

@override
class StateTextInputPassword extends Equatable {
  final String text;

  const StateTextInputPassword({
    required this.text,
  });

  StateTextInputPassword copyWith({
    String? text,
  }) {
    return StateTextInputPassword(
      text: text ?? this.text,
    );
  }

  @override
  List<Object> get props => [
        text,
      ];
}
