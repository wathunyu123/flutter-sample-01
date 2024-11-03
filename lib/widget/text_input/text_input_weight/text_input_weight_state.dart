part of 'text_input_weight_bloc.dart';

@override
class StateTextInputWeight extends Equatable {
  final String weight;

  const StateTextInputWeight({
    required this.weight,
  });

  StateTextInputWeight copyWith({
    String? weight,
  }) {
    return StateTextInputWeight(
      weight: weight ?? this.weight,
    );
  }

  @override
  List<Object> get props => [
        weight,
      ];
}
