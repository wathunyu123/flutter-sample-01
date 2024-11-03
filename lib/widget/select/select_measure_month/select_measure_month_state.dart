part of 'select_measure_month_bloc.dart';

@override
class StateSelectMeasureMonth extends Equatable {
  final String month;

  const StateSelectMeasureMonth({
    required this.month,
  });

  StateSelectMeasureMonth copyWith({
    String? month,
  }) {
    return StateSelectMeasureMonth(
      month: month ?? this.month,
    );
  }

  @override
  List<Object> get props => [
        month,
      ];
}
