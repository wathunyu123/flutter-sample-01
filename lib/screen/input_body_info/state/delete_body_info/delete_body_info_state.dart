part of 'delete_body_info_bloc.dart';

sealed class DeleteBodyInfoState extends Equatable {
  const DeleteBodyInfoState();

  @override
  List<Object> get props => [];
}

final class StateDeleteBodyInfoInitial extends DeleteBodyInfoState {}

class StateDeleteBodyInfoFetchSuccess extends DeleteBodyInfoState {
  final String message;
  const StateDeleteBodyInfoFetchSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
