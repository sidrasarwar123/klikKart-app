class EmployeeAttendanceModel {
  final String date;
  final String day;
  final String clockIn;
  final String clockOut;
  final String totalHours;
  final String status;
  final String type;

EmployeeAttendanceModel({
    required this.date,
    required this.day,
    required this.clockIn,
    required this.clockOut,
    required this.totalHours,
    required this.status,
    required this.type,
  });
}
