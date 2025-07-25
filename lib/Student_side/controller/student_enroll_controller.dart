import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:klik_kart/Student_side/models/courseProgress_model.dart';
import 'package:klik_kart/Student_side/models/fee_model.dart';

class StudentEnrollController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rxn<FeeModel> feelist = Rxn<FeeModel>();
Rxn<CourseProgressModel> courseProgress = Rxn<CourseProgressModel>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeeData();
    fetchCourseProgress();
  }

  void fetchFeeData() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return;

      final doc = await _firestore.collection('fees').doc(uid).get();
      if (doc.exists) {
        feelist.value = FeeModel.fromMap(doc.data()!);
        print(" Fee data fetched: ${feelist.value}");
      } else {
        print(" No fee document found for user.");
      }
    } catch (e) {
      print(" Fee fetch error: $e");
    }
  }

 void fetchCourseProgress() async {
  final uid = _auth.currentUser?.uid;
  if (uid != null) {
    final doc = await _firestore.collection('coursesProgress').doc(uid).get();
    if (doc.exists) {
      courseProgress.value = CourseProgressModel.fromMap(doc.data()!);
      print("Course data fetched: ${courseProgress.value}");
    } else {
      print("No course progress found for user");
    }
  }
}}
