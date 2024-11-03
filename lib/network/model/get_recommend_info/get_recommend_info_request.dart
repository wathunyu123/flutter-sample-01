class GetRecommendInfoRequestModel {
  final int month;

  GetRecommendInfoRequestModel({
    required this.month,
  });

  GetRecommendInfoRequestModel copyWith({
    int? month,
  }) =>
      GetRecommendInfoRequestModel(
        month: month ?? this.month,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    return data;
  }

  factory GetRecommendInfoRequestModel.fromJson(Map<String, dynamic> json) {
    return GetRecommendInfoRequestModel(
      month: json['month'],
    );
  }
}
