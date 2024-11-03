part of 'creator_bloc.dart';

@override
class StateCreator extends Equatable {
  final String by;

  const StateCreator({
    required this.by,
  });

  StateCreator copyWith({
    String? by,
  }) {
    return StateCreator(
      by: by ?? this.by,
    );
  }

  @override
  List<Object> get props => [
        by,
      ];
}
