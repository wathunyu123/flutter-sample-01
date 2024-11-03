part of 'add_body_info_bloc.dart';

sealed class AddBodyInfoState extends Equatable {
  const AddBodyInfoState();

  @override
  List<Object> get props => [];
}

final class StateAddBodyInfoInitial extends AddBodyInfoState {}

class StateAddBodyInfoFetchSuccess extends AddBodyInfoState {
  final String message;
  const StateAddBodyInfoFetchSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
