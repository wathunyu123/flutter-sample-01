part of 'admin_controller_department_bloc.dart';

abstract class GetAdminControllerDepartmentEvent extends Equatable {
  const GetAdminControllerDepartmentEvent();

  @override
  List<Object> get props => [];
}

class EventAdminControllerDepartmentInitial
    extends GetAdminControllerDepartmentEvent {}

class EventAdminControllerDepartmentFetching
    extends GetAdminControllerDepartmentEvent {
  final BuildContext context;
  final int level;
  const EventAdminControllerDepartmentFetching({
    required this.context,
    required this.level,
  });

  @override
  List<Object> get props => [
        context,
        level,
      ];
}
