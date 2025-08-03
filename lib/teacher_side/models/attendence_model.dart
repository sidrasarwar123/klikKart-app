class teacherDashboardControllerModel {
  final String className;
  final String subject;
  final double presentPercent;
  final double absentPercent;
  final String type; // 👈 REQUIRED FIELD

  teacherDashboardControllerModel({
    required this.className,
    required this.subject,
    required this.presentPercent,
    required this.absentPercent,
    required this.type,
  });

  factory teacherDashboardControllerModel.fromMap(Map<String, dynamic> map) {
    return teacherDashboardControllerModel(
      className: map['className'] ?? '',
      subject: map['subject'] ?? '',
      presentPercent: (map['presentPercent'] ?? 0).toDouble(),
      absentPercent: (map['absentPercent'] ?? 0).toDouble(),
      type: map['type'] ?? '', // 👈 THIS LINE IS CRUCIAL
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'subject': subject,
      'presentPercent': presentPercent,
      'absentPercent': absentPercent,
      'type': type,
    };
  }
}
