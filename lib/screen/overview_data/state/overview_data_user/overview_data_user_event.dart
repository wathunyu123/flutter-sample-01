part of 'overview_data_user_bloc.dart';

abstract class GetOverviewDataUserEvent extends Equatable {
  const GetOverviewDataUserEvent();

  @override
  List<Object> get props => [];
}

class EventOverviewDataUserInitial extends GetOverviewDataUserEvent {}

class EventOverviewDataUserFetching extends GetOverviewDataUserEvent {
  final BuildContext context;
  final String userId;
  const EventOverviewDataUserFetching({
    required this.context,
    required this.userId,
  });

  @override
  List<Object> get props => [
        context,
        userId,
      ];
}
