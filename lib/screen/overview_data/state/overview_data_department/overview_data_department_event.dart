part of 'overview_data_department_bloc.dart';

abstract class GetOverviewDataDepartmentEvent extends Equatable {
  const GetOverviewDataDepartmentEvent();

  @override
  List<Object> get props => [];
}

class EventOverviewDataDepartmentInitial
    extends GetOverviewDataDepartmentEvent {}

class EventOverviewDataDepartmentFetching
    extends GetOverviewDataDepartmentEvent {
  final BuildContext context;
  final int departmentId;
  const EventOverviewDataDepartmentFetching({
    required this.context,
    required this.departmentId,
  });

  @override
  List<Object> get props => [
        context,
        departmentId,
      ];
}
