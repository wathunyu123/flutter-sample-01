part of 'select_measure_year_bloc.dart';

@override
class EventSelectMeasureYear extends Equatable {
  final String year;

  const EventSelectMeasureYear({
    required this.year,
  });

  EventSelectMeasureYear copyWith({
    String? year,
  }) {
    return EventSelectMeasureYear(
      year: year ?? this.year,
    );
  }

  @override
  List<Object> get props => [
        year,
      ];
}
