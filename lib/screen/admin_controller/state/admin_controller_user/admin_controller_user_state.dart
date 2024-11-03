part of 'admin_controller_user_bloc.dart';

abstract class GetAdminControllerUserState extends Equatable {
  const GetAdminControllerUserState();

  @override
  List<Object> get props => [];
}

final class StateGetAdminControllerUserInitial
    extends GetAdminControllerUserState {}

class StateAdminControllerUserFetchSuccess extends GetAdminControllerUserState {
  final List<GetAdminControllerUserResponseModel> model;
  const StateAdminControllerUserFetchSuccess({
    required this.model,
  });

  @override
  List<Object> get props => [
        model,
      ];
}

final class StateGetAdminControllerUserFetchError
    extends GetAdminControllerUserState {}
