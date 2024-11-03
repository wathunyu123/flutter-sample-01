part of 'toggle_button_gender_bloc.dart';

@override
class EventToggleButtonGender extends Equatable {
  final List<bool> gender;

  const EventToggleButtonGender({
    required this.gender,
  });

  EventToggleButtonGender copyWith({
    List<bool>? gender,
  }) {
    return EventToggleButtonGender(
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object> get props => [
        gender,
      ];
}
