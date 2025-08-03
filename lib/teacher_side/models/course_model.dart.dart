class studentcourseModel {
  final String title;
  final String subtitle;
  final String? id;

  studentcourseModel({
    required this.title,
    required this.subtitle,
    this.id,
  });

  factory studentcourseModel.fromMap(Map<String, dynamic> map, String id) {
    return studentcourseModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      id: id,
    );
  }
}
