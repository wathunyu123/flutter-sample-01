part of 'get_level_recommend_info_bloc.dart';

abstract class GetLevelRecommendInfoEvent extends Equatable {
  const GetLevelRecommendInfoEvent();

  @override
  List<Object> get props => [];
}

class EventGetLevelRecommendInfoInitial extends GetLevelRecommendInfoEvent {}

class EventGetLevelRecommendInfoFetching extends GetLevelRecommendInfoEvent {
  final BuildContext context;
  final GetLevelRecommendInfoRequestModel model;
  const EventGetLevelRecommendInfoFetching({
    required this.context,
    required this.model,
  });

  @override
  List<Object> get props => [
        context,
        model,
      ];
}
