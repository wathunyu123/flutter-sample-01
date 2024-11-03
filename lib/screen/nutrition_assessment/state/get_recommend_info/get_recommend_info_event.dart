part of 'get_recommend_info_bloc.dart';

abstract class GetRecommendInfoEvent extends Equatable {
  const GetRecommendInfoEvent();

  @override
  List<Object> get props => [];
}

class EventGetRecommendInfoInitial extends GetRecommendInfoEvent {}

class EventGetRecommendInfoFetching extends GetRecommendInfoEvent {
  final BuildContext context;
  final GetRecommendInfoRequestModel model;
  const EventGetRecommendInfoFetching({
    required this.context,
    required this.model,
  });

  @override
  List<Object> get props => [
        context,
        model,
      ];
}
