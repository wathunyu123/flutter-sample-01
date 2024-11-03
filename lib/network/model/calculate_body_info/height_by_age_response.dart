class HeightByAgeResponseModel {
  final double medianHt;
  final double sdHt;
  final double sd2Ht;
  final double sd15Ht;
  final double sd15HtM;
  final double sd2HtM;
  final HeightByAge heightByAge;

  HeightByAgeResponseModel({
    required this.medianHt,
    required this.sdHt,
    required this.sd2Ht,
    required this.sd15Ht,
    required this.sd15HtM,
    required this.sd2HtM,
    required this.heightByAge,
  });

  HeightByAgeResponseModel copyWith({
    double? medianHt,
    double? sdHt,
    double? sd2Ht,
    double? sd15Ht,
    double? sd15HtM,
    double? sd2HtM,
    HeightByAge? heightByAge,
  }) =>
      HeightByAgeResponseModel(
        medianHt: medianHt ?? this.medianHt,
        sdHt: sdHt ?? this.sdHt,
        sd2Ht: sd2Ht ?? this.sd2Ht,
        sd15Ht: sd15Ht ?? this.sd15Ht,
        sd15HtM: sd15HtM ?? this.sd15HtM,
        sd2HtM: sd2HtM ?? this.sd2HtM,
        heightByAge: heightByAge ?? this.heightByAge,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['median_ht'] = medianHt;
    data['sd_ht'] = sdHt;
    data['sd_2_ht'] = sd2Ht;
    data['sd_15_ht'] = sd15Ht;
    data['sd15_ht'] = sd15HtM;
    data['sd2_ht'] = sd2HtM;
    data['height_by_age'] = heightByAge.toJson();
    return data;
  }

  factory HeightByAgeResponseModel.fromJson(Map<String, dynamic> json) {
    return HeightByAgeResponseModel(
      medianHt: double.tryParse(json['median_ht'].toString()) ?? .0,
      sdHt: double.tryParse(json['sd_ht'].toString()) ?? .0,
      sd2Ht: double.tryParse(json['sd_2_ht'].toString()) ?? .0,
      sd15Ht: double.tryParse(json['sd_15_ht'].toString()) ?? .0,
      sd15HtM: double.tryParse(json['sd15_ht'].toString()) ?? .0,
      sd2HtM: double.tryParse(json['sd2_ht'].toString()) ?? .0,
      heightByAge: HeightByAge.fromJson(json['height_by_age']),
    );
  }
}

class HeightByAge {
  final int level;
  final String describe;

  HeightByAge({
    required this.level,
    required this.describe,
  });

  HeightByAge copyWith({
    int? level,
    String? describe,
  }) =>
      HeightByAge(
        level: level ?? this.level,
        describe: describe ?? this.describe,
      );

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'describe': describe,
    };
  }

  factory HeightByAge.fromJson(Map<String, dynamic> json) {
    return HeightByAge(
      level: int.tryParse(json['level'].toString()) ?? 0,
      describe: json['describe'].toString(),
    );
  }
}
