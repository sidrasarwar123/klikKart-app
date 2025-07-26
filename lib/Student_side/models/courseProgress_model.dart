class CourseProgressModel {
  final String title;
  final String image;
  final double progress;

  CourseProgressModel({
    required this.title,
    required this.image,
    required this.progress,
  });

  factory CourseProgressModel.fromMap(Map<String, dynamic> map) {
    return CourseProgressModel(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      progress: (map['progress'] ?? 0.0).toDouble(),
    );
  }
}
