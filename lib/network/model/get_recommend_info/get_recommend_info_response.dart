class GetRecommendInfoResponseModel {
  final Section baby;
  final Section mom;
  final Section modified;

  GetRecommendInfoResponseModel({
    required this.baby,
    required this.mom,
    required this.modified,
  });

  GetRecommendInfoResponseModel copyWith({
    Section? baby,
    Section? mom,
    Section? modified,
  }) =>
      GetRecommendInfoResponseModel(
        baby: baby ?? this.baby,
        mom: mom ?? this.mom,
        modified: modified ?? this.modified,
      );

  Map<String, dynamic> toJson() {
    return {
      'baby': baby.toJson(),
      'mom': mom.toJson(),
      'modified': modified.toJson(),
    };
  }

  factory GetRecommendInfoResponseModel.fromJson(Map<String, dynamic> json) {
    return GetRecommendInfoResponseModel(
      baby: Section.fromJson(json['baby']),
      mom: Section.fromJson(json['mom']),
      modified: Section.fromJson(json['modified']),
    );
  }
}

class Section {
  final Topic topic1;
  final Topic topic2;
  final Topic topic3;
  final Topic topic4;
  final Topic topic5;
  final Topic topic6;
  final Topic topic7;
  final Topic topic8;
  final Topic topic9;
  final Topic topic10;

  Section({
    required this.topic1,
    required this.topic2,
    required this.topic3,
    required this.topic4,
    required this.topic5,
    required this.topic6,
    required this.topic7,
    required this.topic8,
    required this.topic9,
    required this.topic10,
  });

  Section copyWith({
    Topic? topic1,
    Topic? topic2,
    Topic? topic3,
    Topic? topic4,
    Topic? topic5,
    Topic? topic6,
    Topic? topic7,
    Topic? topic8,
    Topic? topic9,
    Topic? topic10,
  }) =>
      Section(
        topic1: topic1 ?? this.topic1,
        topic2: topic2 ?? this.topic2,
        topic3: topic3 ?? this.topic3,
        topic4: topic4 ?? this.topic4,
        topic5: topic5 ?? this.topic5,
        topic6: topic6 ?? this.topic6,
        topic7: topic7 ?? this.topic7,
        topic8: topic8 ?? this.topic8,
        topic9: topic9 ?? this.topic9,
        topic10: topic10 ?? this.topic10,
      );

  Map<String, dynamic> toJson() {
    return {
      'topic1': topic1.toJson(),
      'topic2': topic2.toJson(),
      'topic3': topic3.toJson(),
      'topic4': topic4.toJson(),
      'topic5': topic5.toJson(),
      'topic6': topic6.toJson(),
      'topic7': topic7.toJson(),
      'topic8': topic8.toJson(),
      'topic9': topic9.toJson(),
      'topic10': topic10.toJson(),
    };
  }

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      topic1: Topic.fromJson(json['topic1']),
      topic2: Topic.fromJson(json['topic2']),
      topic3: Topic.fromJson(json['topic3']),
      topic4: Topic.fromJson(json['topic4']),
      topic5: Topic.fromJson(json['topic5']),
      topic6: Topic.fromJson(json['topic6']),
      topic7: Topic.fromJson(json['topic7']),
      topic8: Topic.fromJson(json['topic8']),
      topic9: Topic.fromJson(json['topic9']),
      topic10: Topic.fromJson(json['topic10']),
    );
  }
}

class Topic {
  final List<String> detail;
  final String header;

  Topic({
    required this.detail,
    required this.header,
  });

  Topic copyWith({
    List<String>? detail,
    String? header,
  }) =>
      Topic(
        detail: detail ?? this.detail,
        header: header ?? this.header,
      );

  Map<String, dynamic> toJson() {
    return {
      'detail': detail,
      'header': header,
    };
  }

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      detail: List<String>.from(json['detail']),
      header: json['header'],
    );
  }
}
