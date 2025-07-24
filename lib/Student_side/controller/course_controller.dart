import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klik_kart/Student_side/models/course.dart';
import 'package:klik_kart/Student_side/models/job_model.dart';

class CourseController extends GetxController {
  RxList<CourseModel> courseList = <CourseModel>[].obs;
  RxList<JobModel> jobs = <JobModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
    fetchJobs();
  }

  Future<void> fetchCourses() async {
  print(" Fetching courses...");
  isLoading.value = true;
  try {
    final snapshot = await FirebaseFirestore.instance.collection('courses').get();

    print("Documents fetched: ${snapshot.docs.length}");

    courseList.value = snapshot.docs.map((doc) {
      print(" Course: ${doc.data()}");
      return CourseModel.fromJson(doc.data(), doc.id);
    }).toList();

    print(" Course list loaded: ${courseList.length}");
  } catch (e) {
    print(' Error fetching courses: $e');
  } finally {
    isLoading.value = false;
  }
}

  Future<void> fetchJobs() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('jobs').get();
      final loadedJobs = snapshot.docs.map((doc) {
        return JobModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      jobs.assignAll(loadedJobs);
    } catch (e) {
      print("❌ Error fetching jobs: $e");
    }
  }
}
