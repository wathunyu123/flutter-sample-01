part of 'calculate_body_info_bloc.dart';

@override
abstract class StateCalculateBodyInfo extends Equatable {
  @override
  List<Object> get props => [];
}

class StateCalculateBodyInfoInitial extends StateCalculateBodyInfo {}

class StateCalculateBodyInfoFetchSuccess extends StateCalculateBodyInfo {
  final CalculateBodyInfoModel model;
  final WeightByAgeResponseModel weightByAge;
  final HeightByAgeResponseModel heightByAge;
  final HeightByWeightResponseModel heightByWeight;
  final CalculateRecommendResponseModel calculateRecommend;

  StateCalculateBodyInfoFetchSuccess({
    required this.model,
    required this.weightByAge,
    required this.heightByAge,
    required this.heightByWeight,
    required this.calculateRecommend,
  });

  StateCalculateBodyInfoFetchSuccess copyWith({
    CalculateBodyInfoModel? model,
    WeightByAgeResponseModel? weightByAge,
    HeightByAgeResponseModel? heightByAge,
    HeightByWeightResponseModel? heightByWeight,
    CalculateRecommendResponseModel? calculateRecommend,
  }) {
    return StateCalculateBodyInfoFetchSuccess(
      model: model ?? this.model,
      weightByAge: weightByAge ?? this.weightByAge,
      heightByAge: heightByAge ?? this.heightByAge,
      heightByWeight: heightByWeight ?? this.heightByWeight,
      calculateRecommend: calculateRecommend ?? this.calculateRecommend,
    );
  }

  @override
  List<Object> get props => [
        model,
        weightByAge,
        heightByAge,
        heightByWeight,
        calculateRecommend,
      ];
}
