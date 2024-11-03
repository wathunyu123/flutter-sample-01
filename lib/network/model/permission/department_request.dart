class PermissionDepartmentNameRequest {
  final int departmentId;

  PermissionDepartmentNameRequest({
    required this.departmentId,
  });

  PermissionDepartmentNameRequest copyWith({
    int? departmentId,
  }) =>
      PermissionDepartmentNameRequest(
        departmentId: departmentId ?? this.departmentId,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentId'] = departmentId;
    return data;
  }

  factory PermissionDepartmentNameRequest.fromJson(Map<String, dynamic> json) {
    return PermissionDepartmentNameRequest(
      departmentId: json['departmentId'],
    );
  }
}
