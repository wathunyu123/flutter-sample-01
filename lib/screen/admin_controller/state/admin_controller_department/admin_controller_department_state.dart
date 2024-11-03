part of 'admin_controller_department_bloc.dart';

abstract class GetAdminControllerDepartmentState extends Equatable {
  const GetAdminControllerDepartmentState();

  @override
  List<Object> get props => [];
}

final class StateGetAdminControllerDepartmentInitial
    extends GetAdminControllerDepartmentState {}

class StateAdminControllerDepartmentFetchSuccess
    extends GetAdminControllerDepartmentState {
  final List<GetAdminControllerDepartmentResponseModel> model;
  const StateAdminControllerDepartmentFetchSuccess({
    required this.model,
  });

  @override
  List<Object> get props => [
        model,
      ];
}

final class StateGetAdminControllerDepartmentFetchError
    extends GetAdminControllerDepartmentState {}
