part of 'select_birth_month_bloc.dart';

@override
class EventSelectBirthMonth extends Equatable {
  final String month;

  const EventSelectBirthMonth({
    required this.month,
  });

  EventSelectBirthMonth copyWith({
    String? month,
  }) {
    return EventSelectBirthMonth(
      month: month ?? this.month,
    );
  }

  @override
  List<Object> get props => [
        month,
      ];
}
