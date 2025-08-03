import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:klik_kart/teacher_side/models/course_model.dart.dart';


class StudentcourseController extends GetxController {
  var courseList = <studentcourseModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  void fetchCourses() async {
    isLoading.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('studentcourse').get();

      courseList.value = snapshot.docs
          .map((doc) => studentcourseModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      print("Error fetching courses: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
