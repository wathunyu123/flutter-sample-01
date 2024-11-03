part of 'text_input_address_bloc.dart';

@override
class EventTextInputAddress extends Equatable {
  final String address;

  const EventTextInputAddress({
    required this.address,
  });

  EventTextInputAddress copyWith({
    String? address,
  }) {
    return EventTextInputAddress(
      address: address ?? this.address,
    );
  }

  @override
  List<Object> get props => [
        address,
      ];
}
