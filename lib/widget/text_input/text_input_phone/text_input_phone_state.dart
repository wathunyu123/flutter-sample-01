part of 'text_input_phone_bloc.dart';

@override
class StateTextInputPhone extends Equatable {
  final String phone;

  const StateTextInputPhone({
    required this.phone,
  });

  StateTextInputPhone copyWith({
    String? phone,
  }) {
    return StateTextInputPhone(
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object> get props => [
        phone,
      ];
}
