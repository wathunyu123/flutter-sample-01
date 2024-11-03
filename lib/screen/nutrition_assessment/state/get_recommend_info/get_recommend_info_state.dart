part of 'get_recommend_info_bloc.dart';

abstract class GetRecommendInfoState extends Equatable {
  const GetRecommendInfoState();

  @override
  List<Object> get props => [];
}

final class StateGetRecommendInfoInitial extends GetRecommendInfoState {}

class StateGetRecommendInfoFetchSuccess extends GetRecommendInfoState {
  final GetRecommendInfoResponseModel model;
  const StateGetRecommendInfoFetchSuccess({
    required this.model,
  });

  @override
  List<Object> get props => [
        model,
      ];
}

final class StateGetRecommendInfoFetchNotFound extends GetRecommendInfoState {
  final String message;
  const StateGetRecommendInfoFetchNotFound({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

final class StateGetRecommendInfoFetchError extends GetRecommendInfoState {
  final String message;
  const StateGetRecommendInfoFetchError({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
