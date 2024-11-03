part of 'toggle_button_gender_bloc.dart';

@override
class StateToggleButtonGender extends Equatable {
  final List<bool> gender;

  const StateToggleButtonGender({
    required this.gender,
  });

  StateToggleButtonGender copyWith({
    List<bool>? gender,
  }) {
    return StateToggleButtonGender(
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object> get props => [
        gender,
      ];
}
