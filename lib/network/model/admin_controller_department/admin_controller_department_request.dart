class GetAdminControllerDepartmentRequestModel {
  final int level;

  GetAdminControllerDepartmentRequestModel({
    required this.level,
  });

  GetAdminControllerDepartmentRequestModel copyWith({
    int? level,
  }) =>
      GetAdminControllerDepartmentRequestModel(
        level: level ?? this.level,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    return data;
  }

  factory GetAdminControllerDepartmentRequestModel.fromJson(
      Map<String, dynamic> json) {
    return GetAdminControllerDepartmentRequestModel(
      level: json['level'],
    );
  }
}
