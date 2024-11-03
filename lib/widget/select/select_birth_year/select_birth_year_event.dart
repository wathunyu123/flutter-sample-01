part of 'select_birth_year_bloc.dart';

@override
class EventSelectBirthYear extends Equatable {
  final String year;

  const EventSelectBirthYear({
    required this.year,
  });

  EventSelectBirthYear copyWith({
    String? year,
  }) {
    return EventSelectBirthYear(
      year: year ?? this.year,
    );
  }

  @override
  List<Object> get props => [
        year,
      ];
}
