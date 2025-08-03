import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/marks_model.dart';

class MarksController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var selectedClass = ''.obs;
  var selectedStudent = ''.obs;
  var isLoading = false.obs;
  var marks = Rxn<MarksModel>();

  void updateSelection({required String className, required String studentName}) {
    selectedClass.value = className;
    selectedStudent.value = studentName;
    fetchMarks();
  }

  Future<void> fetchMarks() async {
    isLoading.value = true;
    try {
      final doc = await _firestore
          .collection("marks")
          .doc(selectedClass.value)
          .collection("students")
          .doc(selectedStudent.value)
          .get();

      if (doc.exists) {
        marks.value = MarksModel.fromMap(doc.data()!);
      } else {
        marks.value = null;
        print("🚫 Student record not found");
      }
    } catch (e) {
      print("❌ Error fetching marks: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
