part of 'get_body_info_bloc.dart';

abstract class GetBodyInfoState extends Equatable {
  const GetBodyInfoState();

  @override
  List<Object> get props => [];
}

final class StateGetBodyInfoInitial extends GetBodyInfoState {}

class StateGetBodyInfoAllFetchSuccess extends GetBodyInfoState {
  final List<GetBodyInfoResponseModel> model;
  const StateGetBodyInfoAllFetchSuccess({
    required this.model,
  });

  @override
  List<Object> get props => [
        model,
      ];
}
