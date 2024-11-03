class GetOverviewDataDepartmentRequestModel {
  final int departmentId;

  GetOverviewDataDepartmentRequestModel({
    required this.departmentId,
  });

  GetOverviewDataDepartmentRequestModel copyWith({
    int? departmentId,
  }) =>
      GetOverviewDataDepartmentRequestModel(
        departmentId: departmentId ?? this.departmentId,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentId'] = departmentId;
    return data;
  }

  factory GetOverviewDataDepartmentRequestModel.fromJson(
      Map<String, dynamic> json) {
    return GetOverviewDataDepartmentRequestModel(
      departmentId: json['departmentId'],
    );
  }
}
