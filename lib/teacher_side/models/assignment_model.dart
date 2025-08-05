import 'package:cloud_firestore/cloud_firestore.dart';

class AssignmentModel {
  final String id;
  final String title;
  final int totalMarks;
  final int obtainedMarks;
  final DateTime date;

  AssignmentModel({
    required this.id,
    required this.title,
    required this.totalMarks,
    required this.obtainedMarks,
    required this.date,
  });

 factory AssignmentModel.fromMap(Map<String, dynamic> map) {
  return AssignmentModel(
    id: map['id'] ?? '',
    title: map['assignmentTitle'] ?? '',
    totalMarks: map['totalMarks'] ?? 0,
    obtainedMarks: map['obtainedMarks'] ?? 0,
    date: (map['date'] as Timestamp).toDate(),
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
