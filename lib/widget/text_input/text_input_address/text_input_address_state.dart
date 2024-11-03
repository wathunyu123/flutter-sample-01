part of 'text_input_address_bloc.dart';

@override
class StateTextInputAddress extends Equatable {
  final String address;

  const StateTextInputAddress({
    required this.address,
  });

  StateTextInputAddress copyWith({
    String? address,
  }) {
    return StateTextInputAddress(
      address: address ?? this.address,
    );
  }

  @override
  List<Object> get props => [
        address,
      ];
}
