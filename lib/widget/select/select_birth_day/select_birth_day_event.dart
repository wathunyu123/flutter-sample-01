part of 'select_birth_day_bloc.dart';

@override
class EventSelectBirthDay extends Equatable {
  final String day;

  const EventSelectBirthDay({
    required this.day,
  });

  EventSelectBirthDay copyWith({
    String? day,
  }) {
    return EventSelectBirthDay(
      day: day ?? this.day,
    );
  }

  @override
  List<Object> get props => [
        day,
      ];
}
