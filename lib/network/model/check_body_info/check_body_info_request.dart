class CheckBodyInfoRequestModel {
  final int id;

  CheckBodyInfoRequestModel({
    required this.id,
  });

  CheckBodyInfoRequestModel copyWith({
    int? id,
  }) =>
      CheckBodyInfoRequestModel(
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }

  factory CheckBodyInfoRequestModel.fromJson(Map<String, dynamic> json) {
    return CheckBodyInfoRequestModel(
      id: json['id'],
    );
  }
}
