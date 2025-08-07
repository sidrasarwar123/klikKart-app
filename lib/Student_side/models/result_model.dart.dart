class ResultModel {
  final int assignmentMarks;
  final int assignmentTotal;
  final int sentinelMarks;
  final int sentinelTotal;
  final int finalTermMarks;
  final int finalTermTotal;
  final String grade;
  final double percentage; 
  final String status;

  ResultModel({
    required this.assignmentMarks,
    required this.assignmentTotal,
    required this.sentinelMarks,
    required this.sentinelTotal,
    required this.finalTermMarks,
    required this.finalTermTotal,
    required this.grade,
    required this.percentage,
    required this.status,
  });

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    final assignment = map['assignmentMarks'] ?? {};
    final sentinal = map['sentinalMarks'] ?? {};
    final finalTerm = map['finalTermMarks'] ?? {};

    return ResultModel(
      assignmentMarks: (assignment['obtained'] ?? 0).toInt(),
      assignmentTotal: (assignment['total'] ?? 0).toInt(),
      sentinelMarks: (sentinal['obtained'] ?? 0).toInt(),
      sentinelTotal: (sentinal['total'] ?? 0).toInt(),
      finalTermMarks: (finalTerm['obtained'] ?? 0).toInt(),
      finalTermTotal: (finalTerm['total'] ?? 0).toInt(),
      grade: map['grade'] ?? '',
      percentage: (map['percentage'] ?? 0).toDouble(),
      status: map['status'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'assignmentMarks': {
        'obtained': assignmentMarks,
        'total': assignmentTotal,
      },
      'sentinalMarks': {
        'obtained': sentinelMarks,
        'total': sentinelTotal,
      },
      'finalTermMarks': {
        'obtained': finalTermMarks,
        'total': finalTermTotal,
      },
      'grade': grade,
      'percentage': percentage,
      'status': status,
    };
  }
}
