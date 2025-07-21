import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klik_kart/Student_side/models/course.dart';
import 'package:klik_kart/Student_side/models/job_model.dart';


class CourseController extends GetxController {
  RxList<CourseModel> courseList = <CourseModel>[].obs;
  RxBool isLoading = false.obs;
    final RxList<JobModel> jobs = <JobModel>[].obs;
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
 void fetchJobs() async {
  try {
    print("Fetching jobs from Firestore...");
    final snapshot = await FirebaseFirestore.instance.collection('jobs').get();
    if (snapshot.docs.isEmpty) {
      print("No documents found.");
    }

    final loadedJobs = snapshot.docs.map((doc) {
      print("Found job: ${doc.data()}");
      return JobModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();

    jobs.assignAll(loadedJobs);
  } catch (e) {
    print("Error fetching jobs: $e");
  }
}
}

