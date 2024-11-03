part of 'overview_data_department_bloc.dart';

abstract class GetOverviewDataDepartmentState extends Equatable {
  const GetOverviewDataDepartmentState();

  @override
  List<Object> get props => [];
}

final class StateGetOverviewDataDepartmentInitial
    extends GetOverviewDataDepartmentState {}

class StateOverviewDataDepartmentFetchSuccess
    extends GetOverviewDataDepartmentState {
  final int countDepartment;
  const StateOverviewDataDepartmentFetchSuccess({
    required this.countDepartment,
  });

  @override
  List<Object> get props => [
        countDepartment,
      ];
}

final class StateGetOverviewDataDepartmentFetchError
    extends GetOverviewDataDepartmentState {}
