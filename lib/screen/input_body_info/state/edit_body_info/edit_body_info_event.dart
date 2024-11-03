part of 'edit_body_info_bloc.dart';

abstract class EditBodyInfoEvent extends Equatable {
  const EditBodyInfoEvent();

  @override
  List<Object> get props => [];
}

class EventEditBodyInfoInitial extends EditBodyInfoEvent {}

class EventEditBodyInfoFetching extends EditBodyInfoEvent {
  final BuildContext context;
  final EditBodyInfoRequestModel model;
  const EventEditBodyInfoFetching({
    required this.context,
    required this.model,
  });

  @override
  List<Object> get props => [
        context,
        model,
      ];
}
