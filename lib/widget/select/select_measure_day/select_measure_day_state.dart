part of 'select_measure_day_bloc.dart';

@override
class StateSelectMeasureDay extends Equatable {
  final String day;

  const StateSelectMeasureDay({
    required this.day,
  });

  StateSelectMeasureDay copyWith({
    String? day,
  }) {
    return StateSelectMeasureDay(
      day: day ?? this.day,
    );
  }

  @override
  List<Object> get props => [
        day,
      ];
}
