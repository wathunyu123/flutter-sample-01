part of 'select_birth_day_bloc.dart';

@override
class StateSelectBirthDay extends Equatable {
  final String day;

  const StateSelectBirthDay({
    required this.day,
  });

  StateSelectBirthDay copyWith({
    String? day,
  }) {
    return StateSelectBirthDay(
      day: day ?? this.day,
    );
  }

  @override
  List<Object> get props => [
        day,
      ];
}
