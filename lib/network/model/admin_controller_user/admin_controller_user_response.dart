class GetAdminControllerUserResponseModel {
  final String identityNumber;
  final int level;
  final String department;

  GetAdminControllerUserResponseModel({
    required this.identityNumber,
    required this.level,
    required this.department,
  });

  GetAdminControllerUserResponseModel copyWith({
    String? identityNumber,
    int? level,
    String? department,
  }) =>
      GetAdminControllerUserResponseModel(
        identityNumber: identityNumber ?? this.identityNumber,
        level: level ?? this.level,
        department: department ?? this.department,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identityNumber'] = identityNumber;
    data['level'] = level;
    data['department'] = department;
    return data;
  }

  factory GetAdminControllerUserResponseModel.fromJson(
      Map<String, dynamic> json) {
    return GetAdminControllerUserResponseModel(
      identityNumber: json['identityNumber'],
      level: json['level'],
      department: json['department'],
    );
  }
}
