class EnrollCourseModel {
  final String title;
  final String image;
  final double progress;

  EnrollCourseModel({
    required this.title,
    required this.image,
    required this.progress,
  });

  factory EnrollCourseModel.fromMap(Map<String, dynamic> map) {
    return EnrollCourseModel(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      progress: (map['progress'] ?? 0).toDouble(),
    );
  }
}
