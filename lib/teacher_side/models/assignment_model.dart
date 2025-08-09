import 'package:cloud_firestore/cloud_firestore.dart';

class AssignmentModel {
  final String id;
  final String title;
  final int totalMarks;
  final int obtainedMarks;
  final DateTime date;
    final double? progress;

  AssignmentModel({
    required this.id,
    required this.title,
    required this.totalMarks,
    required this.obtainedMarks,
    required this.date,
    this.progress,
  });

 factory AssignmentModel.fromMap(Map<String, dynamic> map) {
  return AssignmentModel(
    id: map['id'] ?? '',
    title: map['assignmentTitle'] ?? '',
    totalMarks: map['totalMarks'] ?? 0,
    obtainedMarks: map['obtainedMarks'] ?? 0,
    date: (map['date'] as Timestamp).toDate(),
       progress: (map['progress'] ?? 0).toDouble(),
  
  );
}


  Map<String, dynamic> toMap() {
    return {
      'assignmentTitle': title,
      'totalMarks': totalMarks,
      'obtainedMarks': obtainedMarks,
      'date': Timestamp.fromDate(date),
    };
  }
}
