class CalculateBodyInfoModel {
  final String nickName;
  final String address;
  final String phone;
  final String ageCurrent;
  final String ageDate;
  final int ageCurrentMonth;
  final int ageDateMonth;
  final String gender;
  final String birth;
  final String height;
  final String weight;
  final String date;
  final String ibw;
  final String weightAs;
  final String ha;
  final String heightAs;

  CalculateBodyInfoModel({
    required this.nickName,
    required this.address,
    required this.phone,
    required this.ageCurrent,
    required this.ageDate,
    required this.ageCurrentMonth,
    required this.ageDateMonth,
    required this.gender,
    required this.birth,
    required this.height,
    required this.weight,
    required this.date,
    required this.ibw,
    required this.weightAs,
    required this.ha,
    required this.heightAs,
  });

  CalculateBodyInfoModel copyWith({
    String? nickName,
    String? address,
    String? phone,
    String? ageCurrent,
    String? ageDate,
    int? ageCurrentMonth,
    int? ageDateMonth,
    String? gender,
    String? birth,
    String? height,
    String? weight,
    String? date,
    String? ibw,
    String? weightAs,
    String? ha,
    String? heightAs,
  }) =>
      CalculateBodyInfoModel(
        nickName: nickName ?? this.nickName,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        ageCurrent: ageCurrent ?? this.ageCurrent,
        ageDate: ageDate ?? this.ageDate,
        ageCurrentMonth: ageCurrentMonth ?? this.ageCurrentMonth,
        ageDateMonth: ageDateMonth ?? this.ageDateMonth,
        gender: gender ?? this.gender,
        birth: birth ?? this.birth,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        date: date ?? this.date,
        ibw: ibw ?? this.ibw,
        weightAs: weightAs ?? this.weightAs,
        ha: ha ?? this.ha,
        heightAs: heightAs ?? this.heightAs,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickName'] = nickName;
    data['address'] = address;
    data['mobile'] = phone;
    data['ageCurrent'] = ageCurrent;
    data['ageDate'] = ageDate;
    data['ageCurrentMonth'] = ageCurrentMonth;
    data['ageDateMonth'] = ageDateMonth;
    data['gender'] = gender;
    data['birth'] = birth;
    data['height'] = height;
    data['weight'] = weight;
    data['date'] = date;
    data['ibw'] = ibw;
    data['weightAs'] = weightAs;
    data['ha'] = ha;
    data['heightAs'] = heightAs;
    return data;
  }

  factory CalculateBodyInfoModel.fromJson(Map<String, dynamic> json) {
    return CalculateBodyInfoModel(
      nickName: json['nickName'],
      address: json['address'],
      phone: json['mobile'],
      ageCurrent: json['ageCurrent'],
      ageDate: json['ageDate'],
      ageCurrentMonth: json['ageCurrentMonth'],
      ageDateMonth: json['ageDateMonth'],
      gender: json['gender'],
      birth: json['birth'],
      height: json['height'],
      weight: json['weight'],
      date: json['date'],
      ibw: json['ibw'],
      weightAs: json['weightAs'],
      ha: json['ha'],
      heightAs: json['heightAs'],
    );
  }
}
