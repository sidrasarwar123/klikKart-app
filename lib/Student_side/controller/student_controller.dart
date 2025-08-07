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
    print(" studentId is empty");
    return;
  }

  try {
    // Fetch from `userdata`
    final userdataSnap = await _firestore.collection('userdata').doc(studentId).get();

    // Fetch from `students`
    final studentsSnap = await _firestore.collection('students').doc(studentId).get();

    if (userdataSnap.exists || studentsSnap.exists) {
      final Map<String, dynamic> combinedData = {};

      if (userdataSnap.exists) {
        combinedData.addAll(userdataSnap.data()!);
      }

      if (studentsSnap.exists) {
        combinedData.addAll(studentsSnap.data()!);
      }

      print(" totalFee from map: ${combinedData['totalFee']}");
      print(" courseProgress from map: ${combinedData['courseProgress']}");

      studentData.value = StudentModel.fromMap(combinedData, studentId);
      print(" Student data fetched and parsed.");
    } else {
      print(" No document found in both collections.");
    }
  } catch (e) {
    print(" Error fetching student data: $e");
  }
}
}