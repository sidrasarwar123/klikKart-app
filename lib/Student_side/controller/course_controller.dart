import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klik_kart/Student_side/models/course.dart';
import 'package:klik_kart/Student_side/models/job_model.dart';


class CourseController extends GetxController {
  RxList<CourseModel> courseList = <CourseModel>[].obs;
  RxBool isLoading = false.obs;
    RxList<JobModel> jobList = <JobModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
      fetchJobs();
  }

  void fetchCourses() async {
    try {
      isLoading.value = true;
      final snapshot = await FirebaseFirestore.instance.collection('courses').get();
      courseList.value = snapshot.docs.map((doc) => CourseModel.fromFirestore(doc)).toList();
    } catch (e) {
      print("Error fetching courses: $e");
    } finally {
      isLoading.value = false;
    }
  }
   void fetchJobs() {
    FirebaseFirestore.instance.collection('jobs').snapshots().listen((snapshot) {
      jobList.value = snapshot.docs.map((doc) {
        return JobModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}

