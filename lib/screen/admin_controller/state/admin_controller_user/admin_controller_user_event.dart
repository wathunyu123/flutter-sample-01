part of 'admin_controller_user_bloc.dart';

abstract class GetAdminControllerUserEvent extends Equatable {
  const GetAdminControllerUserEvent();

  @override
  List<Object> get props => [];
}

class EventAdminControllerUserInitial extends GetAdminControllerUserEvent {}

class EventAdminControllerUserFetching extends GetAdminControllerUserEvent {
  final BuildContext context;
  final int departmentId;
  const EventAdminControllerUserFetching({
    required this.context,
    required this.departmentId,
  });

  @override
  List<Object> get props => [
        context,
        departmentId,
      ];
}
