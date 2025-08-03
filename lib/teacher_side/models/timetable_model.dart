class TimetableModel {
  final String? courseName;
  final String? time;
  final String? courseImage;
  final String? mentorName;
  final String? mentorRole;
  final String? mentorImage;

  TimetableModel({
    this.courseName,
    this.time,
    this.courseImage,
    this.mentorName,
    this.mentorRole,
    this.mentorImage,
  });

  factory TimetableModel.fromMap(Map<String, dynamic> map) {
    return TimetableModel(
      courseName: map['courseName'] ?? '',
      time: map['time'] ?? '',
      courseImage: map['courseImage'] ?? '',
      mentorName: map['mentorName'] ?? '',
      mentorRole: map['mentorRole'] ?? '',
      mentorImage: map['mentorImage'] ?? '',
    );
  }
}
