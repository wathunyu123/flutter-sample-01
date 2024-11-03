part of 'text_input_height_bloc.dart';

@override
class EventTextInputHeight extends Equatable {
  final String height;

  const EventTextInputHeight({
    required this.height,
  });

  EventTextInputHeight copyWith({
    String? height,
  }) {
    return EventTextInputHeight(
      height: height ?? this.height,
    );
  }

  @override
  List<Object> get props => [
        height,
      ];
}
