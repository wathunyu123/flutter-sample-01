part of 'select_body_info_bloc.dart';

@override
class StateSelectBodyInfo extends Equatable {
  final GetBodyInfoResponseModel model;

  const StateSelectBodyInfo({
    required this.model,
  });

  StateSelectBodyInfo copyWith({
    GetBodyInfoResponseModel? model,
  }) {
    return StateSelectBodyInfo(
      model: model ?? this.model,
    );
  }

  @override
  List<Object> get props => [
        model,
      ];
}
