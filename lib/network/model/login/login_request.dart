class LoginRequestModel {
  final String identityNumber;
  final String password;

  LoginRequestModel({
    required this.identityNumber,
    required this.password,
  });

  LoginRequestModel copyWith({
    String? identityNumber,
    String? password,
  }) =>
      LoginRequestModel(
        identityNumber: identityNumber ?? this.identityNumber,
        password: password ?? this.password,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identityNumber'] = identityNumber;
    data['password'] = password;
    return data;
  }

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      identityNumber: json['identityNumber'],
      password: json['password'],
    );
  }
}
