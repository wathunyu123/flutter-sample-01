class HeightByWeightResponseModel {
  final double medianHt;
  final double sd;
  final double sd2;
  final double sd15;
  final double sd15M;
  final double sd2M;
  final double sd3;
  final HeightByWeight heightByWeight;

  HeightByWeightResponseModel({
    required this.medianHt,
    required this.sd,
    required this.sd2,
    required this.sd15,
    required this.sd15M,
    required this.sd2M,
    required this.sd3,
    required this.heightByWeight,
  });

  HeightByWeightResponseModel copyWith({
    double? medianHt,
    double? sd,
    double? sd2,
    double? sd15,
    double? sd15M,
    double? sd2M,
    double? sd3,
    HeightByWeight? heightByWeight,
  }) =>
      HeightByWeightResponseModel(
        medianHt: medianHt ?? this.medianHt,
        sd: sd ?? this.sd,
        sd2: sd2 ?? this.sd2,
        sd15: sd15 ?? this.sd15,
        sd15M: sd15M ?? this.sd15M,
        sd2M: sd2M ?? this.sd2M,
        sd3: sd3 ?? this.sd3,
        heightByWeight: heightByWeight ?? this.heightByWeight,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['median_ht'] = medianHt;
    data['sd'] = sd;
    data['sd_2'] = sd2;
    data['sd_15'] = sd15;
    data['sd15'] = sd15M;
    data['sd2'] = sd2M;
    data['sd3'] = sd3;
    data['height_by_weight'] = heightByWeight.toJson();
    return data;
  }

  factory HeightByWeightResponseModel.fromJson(Map<String, dynamic> json) {
    return HeightByWeightResponseModel(
      medianHt: double.tryParse(json['median_ht'].toString()) ?? .0,
      sd: double.tryParse(json['sd'].toString()) ?? .0,
      sd2: double.tryParse(json['sd_2'].toString()) ?? .0,
      sd15: double.tryParse(json['sd_15'].toString()) ?? .0,
      sd15M: double.tryParse(json['sd15'].toString()) ?? .0,
      sd2M: double.tryParse(json['sd2'].toString()) ?? .0,
      sd3: double.tryParse(json['sd3'].toString()) ?? .0,
      heightByWeight: HeightByWeight.fromJson(json['height_by_weight']),
    );
  }
}

class HeightByWeight {
  final int level;
  final String describe;

  HeightByWeight({
    required this.level,
    required this.describe,
  });

  HeightByWeight copyWith({
    int? level,
    String? describe,
  }) =>
      HeightByWeight(
        level: level ?? this.level,
        describe: describe ?? this.describe,
      );

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'describe': describe,
    };
  }

  factory HeightByWeight.fromJson(Map<String, dynamic> json) {
    return HeightByWeight(
      level: int.tryParse(json['level'].toString()) ?? 0,
      describe: json['describe'].toString(),
    );
  }
}
