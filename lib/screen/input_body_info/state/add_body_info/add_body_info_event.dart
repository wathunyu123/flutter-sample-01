part of 'add_body_info_bloc.dart';

abstract class AddBodyInfoEvent extends Equatable {
  const AddBodyInfoEvent();

  @override
  List<Object> get props => [];
}

class EventAddBodyInfoInitial extends AddBodyInfoEvent {}

class EventAddBodyInfoFetching extends AddBodyInfoEvent {
  final BuildContext context;
  final AddBodyInfoRequestModel model;
  const EventAddBodyInfoFetching({
    required this.context,
    required this.model,
  });

  @override
  List<Object> get props => [
        context,
        model,
      ];
}
