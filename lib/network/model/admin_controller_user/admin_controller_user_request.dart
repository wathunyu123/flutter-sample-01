class GetAdminControllerUserRequestModel {
  final int departmentId;

  GetAdminControllerUserRequestModel({
    required this.departmentId,
  });

  GetAdminControllerUserRequestModel copyWith({
    int? departmentId,
  }) =>
      GetAdminControllerUserRequestModel(
        departmentId: departmentId ?? this.departmentId,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentId'] = departmentId;
    return data;
  }

  factory GetAdminControllerUserRequestModel.fromJson(
      Map<String, dynamic> json) {
    return GetAdminControllerUserRequestModel(
      departmentId: json['departmentId'],
    );
  }
}
