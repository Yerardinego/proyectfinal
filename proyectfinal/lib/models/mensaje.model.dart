class MensajeModel {
  String content;
  String name;

  MensajeModel({required this.content, required this.name,});

  factory MensajeModel.fromJson(Map<String, dynamic> json) => MensajeModel(
    content: json["author"] ?? '',
    name: json["category"] ?? '',
  );
}