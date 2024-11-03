part of 'select_birth_year_bloc.dart';

@override
class StateSelectBirthYear extends Equatable {
  final String year;

  const StateSelectBirthYear({
    required this.year,
  });

  StateSelectBirthYear copyWith({
    String? year,
  }) {
    return StateSelectBirthYear(
      year: year ?? this.year,
    );
  }

  @override
  List<Object> get props => [
        year,
      ];
}
