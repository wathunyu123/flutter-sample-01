part of 'calculate_body_info_bloc.dart';

@override
abstract class EventCalculateBodyInfo extends Equatable {
  @override
  List<Object> get props => [];
}

class EventCalculateBodyInfoInitial extends EventCalculateBodyInfo {}

class EventCalculateBodyInfoFetching extends EventCalculateBodyInfo {
  final GetBodyInfoResponseModel model;

  EventCalculateBodyInfoFetching({
    required this.model,
  });

  EventCalculateBodyInfoFetching copyWith({
    GetBodyInfoResponseModel? model,
  }) {
    return EventCalculateBodyInfoFetching(
      model: model ?? this.model,
    );
  }

  @override
  List<Object> get props => [
        model,
      ];
}
