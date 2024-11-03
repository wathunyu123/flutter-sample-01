class WeightByAgeResponseModel {
  final double medianWt;
  final double sdWtM;
  final double sd2WtM;
  final double sd15WtM;
  final double sd15Wt;
  final double sd2Wt;
  final WeightByAge weightByAge;

  WeightByAgeResponseModel({
    required this.medianWt,
    required this.sdWtM,
    required this.sd2WtM,
    required this.sd15WtM,
    required this.sd15Wt,
    required this.sd2Wt,
    required this.weightByAge,
  });

  WeightByAgeResponseModel copyWith({
    double? medianWt,
    double? sdWtM,
    double? sd2WtM,
    double? sd15WtM,
    double? sd15Wt,
    double? sd2Wt,
    WeightByAge? weightByAge,
  }) =>
      WeightByAgeResponseModel(
        medianWt: medianWt ?? this.medianWt,
        sdWtM: sdWtM ?? this.sdWtM,
        sd2WtM: sd2WtM ?? this.sd2WtM,
        sd15WtM: sd15WtM ?? this.sd15WtM,
        sd15Wt: sd15Wt ?? this.sd15Wt,
        sd2Wt: sd2Wt ?? this.sd2Wt,
        weightByAge: weightByAge ?? this.weightByAge,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['median_wt'] = medianWt;
    data['sd_wt'] = sdWtM;
    data['sd_2_wt'] = sd2WtM;
    data['sd_15_wt'] = sd15WtM;
    data['sd15_wt'] = sd15Wt;
    data['sd2_wt'] = sd2Wt;
    data['weight_by_age'] = weightByAge.toJson();
    return data;
  }

  factory WeightByAgeResponseModel.fromJson(Map<String, dynamic> json) {
    return WeightByAgeResponseModel(
      medianWt: double.tryParse(json['median_wt'].toString()) ?? .0,
      sdWtM: double.tryParse(json['sd_wt'].toString()) ?? .0,
      sd2WtM: double.tryParse(json['sd_2_wt'].toString()) ?? .0,
      sd15WtM: double.tryParse(json['sd_15_wt'].toString()) ?? .0,
      sd15Wt: double.tryParse(json['sd15_wt'].toString()) ?? .0,
      sd2Wt: double.tryParse(json['sd2_wt'].toString()) ?? .0,
      weightByAge: WeightByAge.fromJson(json['weight_by_age']),
    );
  }
}

class WeightByAge {
  final int level;
  final String describe;

  WeightByAge({
    required this.level,
    required this.describe,
  });

  WeightByAge copyWith({
    int? level,
    String? describe,
  }) =>
      WeightByAge(
        level: level ?? this.level,
        describe: describe ?? this.describe,
      );

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'describe': describe,
    };
  }

  factory WeightByAge.fromJson(Map<String, dynamic> json) {
    return WeightByAge(
      level: int.tryParse(json['level'].toString()) ?? 0,
      describe: json['describe'].toString(),
    );
  }
}
