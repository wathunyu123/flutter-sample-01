class GetLevelRecommendInfoRequestModel {
  final int month;
  final int levelHeightAge;
  final int levelHeightWeight;

  GetLevelRecommendInfoRequestModel({
    required this.month,
    required this.levelHeightAge,
    required this.levelHeightWeight,
  });

  GetLevelRecommendInfoRequestModel copyWith({
    int? month,
    int? levelHeightAge,
    int? levelHeightWeight,
  }) =>
      GetLevelRecommendInfoRequestModel(
        month: month ?? this.month,
        levelHeightAge: levelHeightAge ?? this.levelHeightAge,
        levelHeightWeight: levelHeightWeight ?? this.levelHeightWeight,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['level_height_age'] = levelHeightAge;
    data['level_height_weight'] = levelHeightWeight;
    return data;
  }

  factory GetLevelRecommendInfoRequestModel.fromJson(
      Map<String, dynamic> json) {
    return GetLevelRecommendInfoRequestModel(
      month: json['month'],
      levelHeightAge: json['level_height_age'],
      levelHeightWeight: json['level_height_weight'],
    );
  }
}
