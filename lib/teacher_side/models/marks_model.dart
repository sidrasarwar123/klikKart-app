class MarksModel {
  final int assignment;
  final int sentinel;
  final int finalMarks;
  final int totalAssignment;
  final int totalSentinel;
  final int totalFinal;
  final String grade;
  final int percentage;
  final String status;

  MarksModel({
    required this.assignment,
    required this.sentinel,
    required this.finalMarks,
    required this.totalAssignment,
    required this.totalSentinel,
    required this.totalFinal,
    required this.grade,
    required this.percentage,
    required this.status,
  });

  factory MarksModel.fromMap(Map<String, dynamic> map) {
    return MarksModel(
      assignment: map['assignment'],
      sentinel: map['sentinel'],
      finalMarks: map['final'],
      totalAssignment: map['totalAssignment'],
      totalSentinel: map['totalSentinel'],
      totalFinal: map['totalFinal'],
      grade: map['grade'],
      percentage: map['percentage'],
      status: map['status'],
    );
  }
}
