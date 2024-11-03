part of 'get_body_info_bloc.dart';

abstract class GetBodyInfoEvent extends Equatable {
  const GetBodyInfoEvent();

  @override
  List<Object> get props => [];
}

class EventGetBodyInfoInitial extends GetBodyInfoEvent {}

class EventGetBodyInfoAllFetching extends GetBodyInfoEvent {
  final BuildContext context;
  final String userId;
  const EventGetBodyInfoAllFetching({
    required this.context,
    required this.userId,
  });

  @override
  List<Object> get props => [
        context,
        userId,
      ];
}
