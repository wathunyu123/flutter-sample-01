part of 'text_input_phone_bloc.dart';

@override
class EventTextInputPhone extends Equatable {
  final String phone;

  const EventTextInputPhone({
    required this.phone,
  });

  EventTextInputPhone copyWith({
    String? phone,
  }) {
    return EventTextInputPhone(
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object> get props => [
        phone,
      ];
}
