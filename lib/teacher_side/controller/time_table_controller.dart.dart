import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/timetable_model.dart';

class TimetableController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var selectedClass = "A12 G".obs;
  var timetableList = <TimetableModel>[].obs;
  var isLoading = false.obs;
  
    void updateClass(String className) {
    selectedClass.value = className;
    fetchTimetable();
  }

 Future<void> fetchTimetable() async {
  isLoading.value = true;
  try {
    print(" Fetching timetable for class: ${selectedClass.value}");
    final snapshot = await _firestore
        .collection("timetables")
        .doc(selectedClass.value)
        .collection("courses")
        .get();

    print(" Documents found: ${snapshot.docs.length}");

    timetableList.value =
        snapshot.docs.map((doc) => TimetableModel.fromMap(doc.data())).toList();

  } catch (e) {
    print(" Error fetching timetable: $e");
  } finally {
    isLoading.value = false;
  }
}

}
