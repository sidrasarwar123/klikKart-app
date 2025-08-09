import 'package:cloud_firestore/cloud_firestore.dart';

class Enrollment {
  final int totalMonths;
  final DateTime fromDate;
  final DateTime toDate;

  Enrollment({
    required this.totalMonths,
    required this.fromDate,
    required this.toDate,
  });

  factory Enrollment.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return Enrollment(
      totalMonths: data['totalMonths'] ?? 0,
      fromDate: (data['fromDate'] as Timestamp).toDate(),
      toDate: (data['toDate'] as Timestamp).toDate(),
    );
  }
}
