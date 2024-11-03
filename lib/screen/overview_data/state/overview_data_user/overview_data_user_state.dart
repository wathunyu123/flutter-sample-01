part of 'overview_data_user_bloc.dart';

abstract class GetOverviewDataUserState extends Equatable {
  const GetOverviewDataUserState();

  @override
  List<Object> get props => [];
}

final class StateGetOverviewDataUserInitial extends GetOverviewDataUserState {}

class StateOverviewDataUserFetchSuccess extends GetOverviewDataUserState {
  final int countUser;
  const StateOverviewDataUserFetchSuccess({
    required this.countUser,
  });

  @override
  List<Object> get props => [
        countUser,
      ];
}

final class StateGetOverviewDataUserFetchError
    extends GetOverviewDataUserState {}
