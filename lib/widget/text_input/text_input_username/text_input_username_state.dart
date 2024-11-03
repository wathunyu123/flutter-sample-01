part of 'text_input_username_bloc.dart';

@override
class StateTextInputUsername extends Equatable {
  final String text;

  const StateTextInputUsername({
    required this.text,
  });

  StateTextInputUsername copyWith({
    String? text,
  }) {
    return StateTextInputUsername(
      text: text ?? this.text,
    );
  }

  @override
  List<Object> get props => [
        text,
      ];
}
