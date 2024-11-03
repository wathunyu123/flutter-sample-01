part of 'creator_bloc.dart';

@override
class EventCreator extends Equatable {
  final String by;

  const EventCreator({
    required this.by,
  });

  EventCreator copyWith({
    String? by,
  }) {
    return EventCreator(
      by: by ?? this.by,
    );
  }

  @override
  List<Object> get props => [
        by,
      ];
}
