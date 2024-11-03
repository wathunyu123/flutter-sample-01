class Permission {
  final int level;
  final int department;

  Permission({
    required this.level,
    required this.department,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      level: int.tryParse(json['level'].toString()) ?? 0,
      department: int.tryParse(json['department'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'department': department,
    };
  }
}

class LoginResponseModel {
  final String accessToken;
  final String tokenType;
  final String expiresIn;
  final Permission permission;

  LoginResponseModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.permission,
  });

  LoginResponseModel copyWith({
    String? accessToken,
    String? tokenType,
    String? expiresIn,
    Permission? permission,
  }) =>
      LoginResponseModel(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        permission: permission ?? this.permission,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['permission'] = permission.toJson();
    return data;
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'].toString(),
      tokenType: json['token_type'].toString(),
      expiresIn: json['expires_in'].toString(),
      permission: Permission.fromJson(json['permission']),
    );
  }
}
