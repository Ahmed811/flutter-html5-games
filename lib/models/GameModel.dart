class GameModel {
  final String id;
  final String title;
  final String description;
  final String instructions;
  final String url;
  final String category;
  final String tags;
  final String thumb;
  final String width;
  final String height;

  GameModel({
    required this.id,
    required this.title,
    required this.description,
    required this.instructions,
    required this.url,
    required this.category,
    required this.tags,
    required this.thumb,
    required this.width,
    required this.height,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        instructions: json['instructions'],
        url: json['url'],
        category: json['category'],
        tags: json['tags'],
        thumb: json['thumb'],
        width: json['width'],
        height: json['height']);
  }
}
