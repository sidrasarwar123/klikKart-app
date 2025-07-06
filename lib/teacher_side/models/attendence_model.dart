class AttendanceModel {
  final String subject;
  final String className;
  final double presentPercent;
  final double absentPercent;

  AttendanceModel({
    required this.subject,
    required this.className,
    required this.presentPercent,
    required this.absentPercent,
  });
}
