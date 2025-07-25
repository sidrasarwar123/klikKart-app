class CourseProgressModel {
  final String courseName;
  final int progress;
  final String status;
  final String imageUrl;

  CourseProgressModel({
    required this.courseName,
    required this.progress,
    required this.status,
    required this.imageUrl,
  });

  factory CourseProgressModel.fromMap(Map<String, dynamic> map) {
    return CourseProgressModel(
      courseName: map['courseName'] ?? '',
      progress: map['progress'] ?? 0,
      status: map['status'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
