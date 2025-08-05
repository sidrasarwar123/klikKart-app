import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/result_model.dart.dart';

class ResultController extends GetxController {
  Rx<ResultModel?> result = Rx<ResultModel?>(null);
  RxBool isLoading = false.obs;

  Future<void> fetchResult(String classId, String studentId) async {
    try {
      isLoading.value = true;

      final doc = await FirebaseFirestore.instance
          .collection('results')
          .doc(classId)
          .collection('students')
          .doc(studentId)
          .get();

      if (doc.exists) {
        result.value = ResultModel.fromMap(doc.data()!);
      } else {
        result.value = null;
        print("❌ No result found for $studentId in $classId");
      }
    } catch (e) {
      print("❌ Error fetching result: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
