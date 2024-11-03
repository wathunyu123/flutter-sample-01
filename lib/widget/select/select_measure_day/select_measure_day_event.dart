part of 'select_measure_day_bloc.dart';

@override
class EventSelectMeasureDay extends Equatable {
  final String day;

  const EventSelectMeasureDay({
    required this.day,
  });

  EventSelectMeasureDay copyWith({
    String? day,
  }) {
    return EventSelectMeasureDay(
      day: day ?? this.day,
    );
  }

  @override
  List<Object> get props => [
        day,
      ];
}
