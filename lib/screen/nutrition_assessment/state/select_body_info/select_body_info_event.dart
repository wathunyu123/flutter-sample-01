part of 'select_body_info_bloc.dart';

@override
class EventSelectBodyInfo extends Equatable {
  final GetBodyInfoResponseModel model;

  const EventSelectBodyInfo({
    required this.model,
  });

  EventSelectBodyInfo copyWith({
    GetBodyInfoResponseModel? model,
  }) {
    return EventSelectBodyInfo(
      model: model ?? this.model,
    );
  }

  @override
  List<Object> get props => [
        model,
      ];
}
