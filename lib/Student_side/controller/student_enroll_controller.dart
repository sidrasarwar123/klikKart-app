import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klik_kart/Student_side/models/courseProgress_model.dart';
import 'package:klik_kart/Student_side/models/fee_model.dart';

class StudentController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  var feeModel = Rxn<StudentFeeModel>();
  var enrolledCourses = <EnrollCourseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 300), () {
      fetchStudentData();
    });
  }

  void fetchStudentData() async {
    final user = _auth.currentUser;

    if (user == null) {
      print("❌ No user logged in yet. Cannot fetch student data.");
      return;
    }

    final uid = user.uid;
    print("🔍 Fetching studentData for UID: $uid");

    try {
      // ✅ Fetch studentData main document
      final snapshot = await _firestore.collection('studentData').doc(uid).get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        feeModel.value = StudentFeeModel.fromMap(data);
        print("✅ Fee Data Fetched");

        // ✅ Fetch enrolledCourses subcollection
        final coursesSnap = await _firestore
            .collection('studentData')
            .doc(uid)
            .collection('enrollcourses')
            .get();

        enrolledCourses.assignAll(
          coursesSnap.docs.map((doc) => EnrollCourseModel.fromMap(doc.data())).toList(),
        );

        print("📚 Enrolled Courses Loaded: ${enrolledCourses.length}");
      } else {
        print("⚠️ No studentData document found for UID: $uid");
      }
    } catch (e) {
      print("🔥 Error fetching student data: $e");
    }
  }
}
