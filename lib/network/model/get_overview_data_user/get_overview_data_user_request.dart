class GetOverviewDataUserRequestModel {
  final String userId;

  GetOverviewDataUserRequestModel({
    required this.userId,
  });

  GetOverviewDataUserRequestModel copyWith({
    String? userId,
  }) =>
      GetOverviewDataUserRequestModel(
        userId: userId ?? this.userId,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    return data;
  }

  factory GetOverviewDataUserRequestModel.fromJson(Map<String, dynamic> json) {
    return GetOverviewDataUserRequestModel(
      userId: json['userId'],
    );
  }
}
