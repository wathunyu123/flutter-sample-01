part of 'text_input_height_bloc.dart';

@override
class StateTextInputHeight extends Equatable {
  final String height;

  const StateTextInputHeight({
    required this.height,
  });

  StateTextInputHeight copyWith({
    String? height,
  }) {
    return StateTextInputHeight(
      height: height ?? this.height,
    );
  }

  @override
  List<Object> get props => [
        height,
      ];
}
