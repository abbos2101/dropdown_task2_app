class SimpleModel {
  final int id;
  final String title;

  const SimpleModel({required this.id, required this.title});

  factory SimpleModel.empty() => SimpleModel.fromJson({});

  factory SimpleModel.fromJson(Map<String, dynamic> json) {
    return SimpleModel(id: json["id"] ?? -1, title: json["title"] ?? "");
  }

  @override
  String toString() {
    return '{"id": $id, "title": "$title"}';
  }
}
