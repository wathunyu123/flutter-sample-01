part of 'edit_body_info_bloc.dart';

sealed class EditBodyInfoState extends Equatable {
  const EditBodyInfoState();

  @override
  List<Object> get props => [];
}

final class StateEditBodyInfoInitial extends EditBodyInfoState {}

class StateEditBodyInfoFetchSuccess extends EditBodyInfoState {
  final String message;
  const StateEditBodyInfoFetchSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
