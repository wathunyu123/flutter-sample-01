class CalculateRecommendResponseModel {
  final double ibw;
  final double ha;
  final double weightPercentage;
  final double heightPercentage;

  CalculateRecommendResponseModel({
    required this.ibw,
    required this.ha,
    required this.weightPercentage,
    required this.heightPercentage,
  });

  CalculateRecommendResponseModel copyWith({
    double? ibw,
    double? ha,
    double? weightPercentage,
    double? heightPercentage,
  }) =>
      CalculateRecommendResponseModel(
        ibw: ibw ?? this.ibw,
        ha: ha ?? this.ha,
        weightPercentage: weightPercentage ?? this.weightPercentage,
        heightPercentage: heightPercentage ?? this.heightPercentage,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ibw'] = ibw;
    data['ha'] = ha;
    data['weight_percentage'] = weightPercentage;
    data['height_percentage'] = heightPercentage;
    return data;
  }

  factory CalculateRecommendResponseModel.fromJson(Map<String, dynamic> json) {
    return CalculateRecommendResponseModel(
      ibw: double.tryParse(json['ibw'].toString()) ?? .0,
      ha: double.tryParse(json['ha'].toString()) ?? .0,
      weightPercentage:
          double.tryParse(json['weight_percentage'].toString()) ?? .0,
      heightPercentage:
          double.tryParse(json['height_percentage'].toString()) ?? .0,
    );
  }
}
