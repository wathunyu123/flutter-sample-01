part of 'select_measure_month_bloc.dart';

@override
class EventSelectMeasureMonth extends Equatable {
  final String month;

  const EventSelectMeasureMonth({
    required this.month,
  });

  EventSelectMeasureMonth copyWith({
    String? month,
  }) {
    return EventSelectMeasureMonth(
      month: month ?? this.month,
    );
  }

  @override
  List<Object> get props => [
        month,
      ];
}
