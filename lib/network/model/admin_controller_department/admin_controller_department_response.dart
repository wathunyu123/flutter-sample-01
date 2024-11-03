class GetAdminControllerDepartmentResponseModel {
  final int id;
  final String name;

  GetAdminControllerDepartmentResponseModel({
    required this.id,
    required this.name,
  });

  GetAdminControllerDepartmentResponseModel copyWith({
    int? id,
    String? name,
  }) =>
      GetAdminControllerDepartmentResponseModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  factory GetAdminControllerDepartmentResponseModel.fromJson(
      Map<String, dynamic> json) {
    return GetAdminControllerDepartmentResponseModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
