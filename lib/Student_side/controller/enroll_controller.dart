import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klik_kart/Student_side/models/enrollment_model.dart';

class EnrollmentController extends GetxController {
  var enrollment = Rxn<Enrollment>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void fetchEnrollment(String enrollmentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('enrollments').doc(enrollmentId).get();
      if (doc.exists) {
        enrollment.value = Enrollment.fromFirestore(doc);
      }
    } catch (e) {
      print('Error fetching enrollment data: $e');
    }
  }
}
