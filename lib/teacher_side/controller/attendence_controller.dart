import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klik_kart/teacher_side/models/attendence_model.dart';

class TeacherDashboardController extends GetxController {
  var attendanceList = <teacherDashboardControllerModel>[].obs;
  var assignmentList = <teacherDashboardControllerModel>[].obs;
  var isLoading = false.obs;


  void fetchDashboardData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('teacher_dashboard_data')
          .get();

      print("Total documents fetched: ${snapshot.docs.length}");

      List<teacherDashboardControllerModel> allItems = snapshot.docs.map((doc) {
       final data = doc.data();
  print("Document map: $data");
  print("Extracted type from map: ${data['type']}");

  final model = teacherDashboardControllerModel.fromMap(data);
  print("Parsed item type from model: ${model.type}");
  return model;
}).toList();

       
      for (var item in allItems) {
     
        print("Parsed item type: ${item.type}");
      }

      attendanceList.value =
          allItems.where((item) => item.type == 'attendance').toList();

      assignmentList.value =
          allItems.where((item) => item.type == 'assignment').toList();

      print("Attendance items: ${attendanceList.length}");
      print("Assignment items: ${assignmentList.length}");
    } catch (e) {
      print("Error fetching dashboard data: $e");
    }
  }
}
