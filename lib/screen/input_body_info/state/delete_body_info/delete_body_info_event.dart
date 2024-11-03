part of 'delete_body_info_bloc.dart';

abstract class DeleteBodyInfoEvent extends Equatable {
  const DeleteBodyInfoEvent();

  @override
  List<Object> get props => [];
}

class EventDeleteBodyInfoInitial extends DeleteBodyInfoEvent {}

class EventDeleteBodyInfoFetching extends DeleteBodyInfoEvent {
  final BuildContext context;
  final DeleteBodyInfoRequestModel model;
  const EventDeleteBodyInfoFetching({
    required this.context,
    required this.model,
  });

  @override
  List<Object> get props => [
        context,
        model,
      ];
}
