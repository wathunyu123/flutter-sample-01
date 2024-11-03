part of 'get_level_recommend_info_bloc.dart';

abstract class GetLevelRecommendInfoState extends Equatable {
  const GetLevelRecommendInfoState();

  @override
  List<Object> get props => [];
}

final class StateGetLevelRecommendInfoInitial
    extends GetLevelRecommendInfoState {}

class StateGetLevelRecommendInfoFetchSuccess
    extends GetLevelRecommendInfoState {
  final GetLevelRecommendInfoResponseModel model;
  const StateGetLevelRecommendInfoFetchSuccess({
    required this.model,
  });

  @override
  List<Object> get props => [
        model,
      ];
}

final class StateGetLevelRecommendInfoFetchNotFound
    extends GetLevelRecommendInfoState {
  final String message;
  const StateGetLevelRecommendInfoFetchNotFound({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

final class StateGetLevelRecommendInfoFetchError
    extends GetLevelRecommendInfoState {
  final String message;
  const StateGetLevelRecommendInfoFetchError({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
