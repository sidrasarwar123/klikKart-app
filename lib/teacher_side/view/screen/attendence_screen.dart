import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/teacher_side/controller/teacherDashboard_controller.dart.dart';
import 'package:klik_kart/teacher_side/models/attendence_model.dart';

import 'package:klik_kart/teacher_side/widgets/student_tile.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class Attendence extends StatefulWidget {
  const Attendence({super.key});

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
final TeacherDashboardController teacherDashboardController=Get.put(TeacherDashboardController());

@override
void initState() {
  super.initState();
  teacherDashboardController.loadStudents("A12G");
}
 

  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  bool showCalendar = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Attendance"),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            AppIcons.arrowicon,
            color: AppColors.buttoncolor,
            size: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, top: screenHeight * 0.03),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showCalendar = !showCalendar;
                });
              },
              child: Row(
                children: [
                 Icon(Icons.calendar_month, color: Colors.blue, size: 30),
                  SizedBox(width: 10),
                  Text(
                    selectedDay != null
                        ? "${selectedDay!.day}-${selectedDay!.month}-${selectedDay!.year}"
                        : "Select Date",
                    style:  TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),

        
          if (showCalendar)
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02, horizontal: screenWidth * 0.06),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade300, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: focusedDay,
                  selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                  onDaySelected: (selected, focused) {
                    setState(() {
                      selectedDay = selected;
                      focusedDay = focused;
                    });
                  },
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.buttoncolor),
                    leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.blue),
                    rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.blue),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                    weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: Colors.blue.shade100, shape: BoxShape.circle),
                    selectedDecoration:
                        const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),

         SizedBox(height: screenHeight*0.02),

          
          Expanded(
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Name",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      Text("Present",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 14)),
                      Text("Absent",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 14)),
                    ],
                  ),
                ),
            Expanded(
  child: Obx(() {
    return ListView.builder(
      itemCount: teacherDashboardController.students.length,
      itemBuilder: (_, index) {
        final student = teacherDashboardController.students[index];
        return StudentTile(
          student: student,
          onStatusChange: (isPresent) {
            student.ispresent = isPresent;
            teacherDashboardController.students[index] = student; 
          },
        );
      },
    );
  }),
),
              ],
            ),
          ),

          
          Padding(
            padding: EdgeInsets.only(
                bottom: screenHeight * 0.03, top: screenHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    side:  BorderSide(color: Colors.blue, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:  EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: screenWidth * 0.1),
               ElevatedButton(
  onPressed: () async {
    if (selectedDay == null) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Please select a date before saving attendance.',
        confirmBtnText: 'OK',
        confirmBtnColor: Colors.red,
      );
      return;
    }

    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: 'Are you sure you want to save the attendance?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: () async {
        Navigator.of(context).pop(); // Close the dialog

        // ✅ Prepare data
        String classId = "A12G";
        String date = "${selectedDay!.year}-${selectedDay!.month.toString().padLeft(2, '0')}-${selectedDay!.day.toString().padLeft(2, '0')}";

        await teacherDashboardController.saveAttendance(
          classId: classId,
          date: date,
         students: teacherDashboardController.students.map((s) => AttendanceModel(
            name: s.name,
            rollNo: s.rollNo,
            isPresent: s.ispresent ?? false,
          )).toList(),
        );

        // ✅ Show success alert
        Future.delayed(Duration(milliseconds: 200), () {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Attendance saved successfully!',
            confirmBtnText: 'OK',
            confirmBtnColor: Colors.blue,
          );
        });
      },
      onCancelBtnTap: () {
        Navigator.of(context).pop(); // Close the dialog
      },
    );
  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
