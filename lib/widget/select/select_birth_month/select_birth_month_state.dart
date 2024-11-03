part of 'select_birth_month_bloc.dart';

@override
class StateSelectBirthMonth extends Equatable {
  final String month;

  const StateSelectBirthMonth({
    required this.month,
  });

  StateSelectBirthMonth copyWith({
    String? month,
  }) {
    return StateSelectBirthMonth(
      month: month ?? this.month,
    );
  }

  @override
  List<Object> get props => [
        month,
      ];
}
