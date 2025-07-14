class MentorModel {
  final String name;
  final String role;
  final String imageUrl;
  final String color;

  MentorModel({
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.color,
  });

  factory MentorModel.fromMap(Map<String, dynamic> data) {
    return MentorModel(
      name: data['name'] ?? '',
      role: data['role'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      color: data['color'] ?? '#000000',
    );
  }
}
