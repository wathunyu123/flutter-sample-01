part of 'text_input_weight_bloc.dart';

@override
class EventTextInputWeight extends Equatable {
  final String weight;

  const EventTextInputWeight({
    required this.weight,
  });

  EventTextInputWeight copyWith({
    String? weight,
  }) {
    return EventTextInputWeight(
      weight: weight ?? this.weight,
    );
  }

  @override
  List<Object> get props => [
        weight,
      ];
}
