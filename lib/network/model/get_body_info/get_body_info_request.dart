class GetBodyInfoRequestModel {
  final String userId;

  GetBodyInfoRequestModel({
    required this.userId,
  });

  GetBodyInfoRequestModel copyWith({
    String? userId,
  }) =>
      GetBodyInfoRequestModel(
        userId: userId ?? this.userId,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    return data;
  }

  factory GetBodyInfoRequestModel.fromJson(Map<String, dynamic> json) {
    return GetBodyInfoRequestModel(
      userId: json['userId'],
    );
  }
}
