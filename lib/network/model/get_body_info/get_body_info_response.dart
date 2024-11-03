class GetBodyInfoResponseModel {
  final int id;
  final String nickname;
  final String address;
  final String phone;
  final String birth;
  final String gender;
  final String date;
  final String height;
  final String weight;
  final String creator;
  final String result1;
  final String result2;
  final String result3;
  final int department;
  final String createdAt;
  final String updatedAt;

  GetBodyInfoResponseModel({
    required this.id,
    required this.nickname,
    required this.address,
    required this.phone,
    required this.birth,
    required this.gender,
    required this.date,
    required this.height,
    required this.weight,
    required this.creator,
    required this.result1,
    required this.result2,
    required this.result3,
    required this.department,
    required this.createdAt,
    required this.updatedAt,
  });

  GetBodyInfoResponseModel copyWith({
    int? id,
    String? nickname,
    String? address,
    String? phone,
    String? birth,
    String? gender,
    String? date,
    String? height,
    String? weight,
    String? creator,
    String? result1,
    String? result2,
    String? result3,
    int? department,
    String? createdAt,
    String? updatedAt,
  }) =>
      GetBodyInfoResponseModel(
        id: id ?? this.id,
        nickname: nickname ?? this.nickname,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        birth: birth ?? this.birth,
        gender: gender ?? this.gender,
        date: date ?? this.date,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        creator: creator ?? this.creator,
        result1: result1 ?? this.result1,
        result2: result2 ?? this.result2,
        result3: result3 ?? this.result3,
        department: department ?? this.department,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickname'] = nickname;
    data['address'] = address;
    data['mobile'] = phone;
    data['birth'] = birth;
    data['gender'] = gender;
    data['date'] = date;
    data['height'] = height;
    data['weight'] = weight;
    data['creator'] = creator;
    data['result1'] = result1;
    data['result2'] = result2;
    data['result3'] = result3;
    data['department'] = department;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  factory GetBodyInfoResponseModel.fromJson(Map<String, dynamic> json) {
    return GetBodyInfoResponseModel(
      id: json['id'],
      nickname: json['nickname'] ?? '',
      address: json['address'] ?? '',
      phone: json['mobile'] ?? '',
      birth: json['birth'] ?? '',
      gender: json['gender'] ?? '',
      date: json['date'] ?? '',
      height: json['height'] ?? '',
      weight: json['weight'] ?? '',
      creator: json['creator'] ?? '',
      result1: json['result1'] ?? '',
      result2: json['result2'] ?? '',
      result3: json['result3'] ?? '',
      department: json['department'] < 0 ? 0 : json['department'],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
