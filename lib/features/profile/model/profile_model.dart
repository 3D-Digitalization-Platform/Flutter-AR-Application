class ProfileModel {
  final String id;
  final String name;
  final String bio;
  final String profileImage;
  final String coverImage;
  final String points;
  final int following;
  final List<String> gallery;

  ProfileModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImage,
    required this.coverImage,
    required this.points,
    required this.following,
    required this.gallery,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      profileImage: json['profileImage'],
      coverImage: json['coverImage'],
      points: json['points'],
      following: json['following'],
      gallery: List<String>.from(json['gallery']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
      'profileImage': profileImage,
      'coverImage': coverImage,
      'points': points,
      'following': following,
      'gallery': gallery,
    };
  }
}
