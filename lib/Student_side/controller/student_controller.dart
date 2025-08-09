import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:klik_kart/Student_side/models/student_model.dart.dart'; 

class StudentDashboardController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var studentData = Rxn<StudentModel>();

 Future<void> fetchStudentData() async {
  final studentId = FirebaseAuth.instance.currentUser?.uid ?? '';

  if (studentId.isEmpty) {
    print("❌ studentId is empty");
    return;
  }

  try {
    // Main student docs
    final userdataSnap = await _firestore.collection('userdata').doc(studentId).get();
    final studentsSnap = await _firestore.collection('students').doc(studentId).get();

    // 🔹 Assignments subcollection
    final assignmentsSnap = await _firestore
        .collection('students')
        .doc(studentId)
        .collection('assignments')
        .get();

    final assignments = assignmentsSnap.docs
        .map((doc) => AssignmentModel.fromMap(doc.data(), doc.id))
        .toList();

    print("📄 Assignments found: ${assignments.length}");

    if (userdataSnap.exists || studentsSnap.exists) {
      final Map<String, dynamic> combinedData = {};

      if (userdataSnap.exists) {
        combinedData.addAll(userdataSnap.data()!);
      }

      if (studentsSnap.exists) {
        combinedData.addAll(studentsSnap.data()!);
      }

      studentData.value = StudentModel.fromMap(
        combinedData,
        studentId,
        assignments: assignments, // ✅ pass list here
      );

      print("✅ Student data + assignments loaded.");
    } else {
      print("⚠️ No student data found.");
    }
  } catch (e) {
    print("❌ Error fetching student data: $e");
  }
}

}