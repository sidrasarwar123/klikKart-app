import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klik_kart/teacher_side/models/attendence_model.dart';
import 'package:klik_kart/teacher_side/models/student_model.dart';
import 'package:klik_kart/teacher_side/models/teacher_Dashboard.dart.dart';


class TeacherDashboardController extends GetxController {
  var attendanceList = <teacherDashboardControllerModel>[].obs;
  var assignmentList = <teacherDashboardControllerModel>[].obs;
  var isLoading = false.obs;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   RxList<Student> students = <Student>[].obs;


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
  


 
  Future<void> loadStudents(String classId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('attendance')
        .doc(classId)
        .collection('students')
        .get();

   students.value = snapshot.docs.map((doc) {
  final data = doc.data();
  return Student(
    name: data['name'] ?? '',
    rollNo: data['rollNo'].toString(),  
    ispresent: false,
  );
}).toList();
  }

  // Save Attendance
  Future<void> saveAttendance({
    required String classId,
    required String date,
    required List<AttendanceModel> students,
  }) async {
    final attendanceRef = FirebaseFirestore.instance
        .collection('attendance')
        .doc(classId)
        .collection('dates')
        .doc(date);

    await attendanceRef.set({
      'date': date,
      'students': students.map((e) => e.toMap()).toList(),
    });
  }

  // Load Attendance (optional if you want to load previous date)
  Future<void> loadAttendance(String classId, String date) async {
    final doc = await FirebaseFirestore.instance
        .collection('attendance')
        .doc(classId)
        .collection('dates')
        .doc(date)
        .get();

    if (doc.exists) {
      final data = doc.data();
      final List studentList = data?['students'] ?? [];

      students.value = studentList.map((s) => Student.fromMap(s)).toList();
    }
  }
}
