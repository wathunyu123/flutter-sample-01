class CalculateBodyInfoRequestModel {
  final int id;
  final String nickname;
  final String birth;
  final String gender;
  final String date;
  final String height;
  final String weight;
  final String creator;

  CalculateBodyInfoRequestModel({
    required this.id,
    required this.nickname,
    required this.birth,
    required this.gender,
    required this.date,
    required this.height,
    required this.weight,
    required this.creator,
  });

  CalculateBodyInfoRequestModel copyWith({
    int? id,
    String? nickname,
    String? birth,
    String? gender,
    String? date,
    String? height,
    String? weight,
    String? creator,
  }) =>
      CalculateBodyInfoRequestModel(
        id: id ?? this.id,
        nickname: nickname ?? this.nickname,
        birth: birth ?? this.birth,
        gender: gender ?? this.gender,
        date: date ?? this.date,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        creator: creator ?? this.creator,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickname'] = nickname;
    data['birth'] = birth;
    data['gender'] = gender;
    data['date'] = date;
    data['height'] = height;
    data['weight'] = weight;
    data['creator'] = creator;
    return data;
  }

  factory CalculateBodyInfoRequestModel.fromJson(Map<String, dynamic> json) {
    return CalculateBodyInfoRequestModel(
      id: json['id'],
      nickname: json['nickname'],
      birth: json['birth'],
      gender: json['gender'],
      date: json['date'],
      height: json['height'],
      weight: json['weight'],
      creator: json['creator'],
    );
  }
}
