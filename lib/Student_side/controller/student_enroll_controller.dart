import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klik_kart/Student_side/models/courseProgress_model.dart';
import 'package:klik_kart/Student_side/models/fee_model.dart';

class StudentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var feeModel = Rxn<StudentFeeModel>();
  var courses = <CourseProgressModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudentData();
  }

  void fetchStudentData() async {
    final String uid = _auth.currentUser!.uid;
    print("🔍 Fetching student data for UID: $uid");

    try {
      final doc = await _firestore.collection('studentData').doc(uid).get();

      if (!doc.exists) {
        print("❌ No studentData document found for UID: $uid");
        return;
      }

      final data = doc.data() as Map<String, dynamic>;
      print("✅ Firestore Data Fetched: $data");

      // Fee data
      feeModel.value = StudentFeeModel.fromMap(data);
      print("📦 FeeModel: Total: ${feeModel.value?.totalFee}, Submitted: ${feeModel.value?.submittedFee}, Pending: ${feeModel.value?.pendingFee}");

      // Course progress
      final enrolledCourses = data['enrolledCourses'];
      if (enrolledCourses != null && enrolledCourses is List) {
        final List<CourseProgressModel> tempCourses = enrolledCourses
            .map((course) => CourseProgressModel.fromMap(course as Map<String, dynamic>))
            .toList();
        courses.assignAll(tempCourses);
        print("📚 Loaded ${courses.length} enrolled courses");
      } else {
        print("⚠️ No enrolledCourses found or invalid format.");
      }
    } catch (e, stack) {
      print("🔥 Error fetching student data: $e");
      print("🔍 StackTrace: $stack");
    }
  }
}
