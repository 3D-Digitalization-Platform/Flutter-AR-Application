class PostModel {
  final String id;
  final String title;
  final String image;
  final String likes;
  final String comments;

  PostModel({
    required this.id,
    required this.title,
    required this.image,
    required this.likes,
    required this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      likes: json['likes'],
      comments: json['comments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'likes': likes,
      'comments': comments,
    };
  }
}
