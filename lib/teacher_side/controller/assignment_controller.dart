import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/assignment_model.dart';

class AssignmentController extends GetxController {
  RxList<AssignmentModel> assignments = <AssignmentModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  Future<void> fetchAssignments({
    required String classId,
    required String studentId,
  }) async {
    if (classId.isEmpty || studentId.isEmpty) {
      print(" classId or studentId is empty");
      return;
    }

    Future.delayed(Duration.zero, () {
        isLoading.value = false;
        print(" isLoading = false");
      });
 

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('assignments')
          .doc(classId)
          .collection('students')
          .doc(studentId)
          .collection('data')
          .get();

      assignments.value = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Attach Firestore doc ID
        return AssignmentModel.fromMap(data);
      }).toList();
    } catch (e) {
      print("❌ Error fetching assignments: $e");
    } finally {
      // Ensure this runs *after* UI build completes
      Future.delayed(Duration.zero, () {
        isLoading.value = false;
        print("✅ isLoading = false");
      });
    }
  }

  Future<void> addAssignment({
    required String classId,
    required String studentId,
    required String title,
    required int totalMarks,
    required int obtainedMarks,
    required DateTime date,
  }) async {
    isSubmitting.value = true;

    try {
      await FirebaseFirestore.instance
          .collection('assignments')
          .doc(classId)
          .collection('students')
          .doc(studentId)
          .collection('data')
          .add({
        'assignmentTitle': title,
        'totalMarks': totalMarks,
        'obtainedMarks': obtainedMarks,
        'date': Timestamp.fromDate(date),
      });

      Get.snackbar("✅ Success", "Assignment Added");
    } catch (e) {
      Get.snackbar("❌ Error", "Failed to add assignment: $e");
    } finally {
      Future.delayed(Duration.zero, () {
        isSubmitting.value = false;
      });
    }
  }

  Future<void> updateAssignment({
    required String classId,
    required String studentId,
    required String assignmentId,
    required int totalMarks,
    required int obtainedMarks,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('assignments')
          .doc(classId)
          .collection('students')
          .doc(studentId)
          .collection('data')
          .doc(assignmentId)
          .update({
        'totalMarks': totalMarks,
        'obtainedMarks': obtainedMarks,
      });
    } catch (e) {
      print("❌ Failed to update: $e");
    }
  }
}
