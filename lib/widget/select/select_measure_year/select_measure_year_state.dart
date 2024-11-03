part of 'select_measure_year_bloc.dart';

@override
class StateSelectMeasureYear extends Equatable {
  final String year;

  const StateSelectMeasureYear({
    required this.year,
  });

  StateSelectMeasureYear copyWith({
    String? year,
  }) {
    return StateSelectMeasureYear(
      year: year ?? this.year,
    );
  }

  @override
  List<Object> get props => [
        year,
      ];
}
