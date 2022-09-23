class MensajeModel {
  String author;
  String category;
  String text;

  MensajeModel({required this.author, required this.category, required this.text});

  factory MensajeModel.fromJson(Map<String, dynamic> json) => MensajeModel(
    author: json["author"] ?? '',
    category: json["category"] ?? '',
    text: json["text"] ?? '',
  );
}