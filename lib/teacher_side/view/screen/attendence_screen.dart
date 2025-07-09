import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/teacher_side/models/student_model.dart';
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
  List<Student> students = [
    Student(name: 'Ali Hassan', rollNo: "1", ispresent: true),
    Student(name: 'Usman', rollNo: "2", ispresent: false),
    Student(name: 'Junaid', rollNo: "3"),
    Student(name: 'Haider', rollNo: "4"),
    Student(name: 'Umer', rollNo: "5"),
    Student(name: 'Ali', rollNo: "6"),
    Student(name: 'Hammad', rollNo: "7"),
  ];

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

          const SizedBox(height: 10),

          
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
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (_, index) {
                      return StudentTile(
                        student: students[index],
                        onStatusChange: (isPresent) {
                          setState(() {
                            students[index].ispresent = isPresent;
                          });
                        },
                      );
                    },
                  ),
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
                onPressed: () {
  
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: 'Are you sure you want to save the data?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        Future.delayed(Duration(milliseconds: 200), () {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Your Attendance has been saved Successfully',
            confirmBtnText: 'OK',
            confirmBtnColor: Colors.blue,
          );
        });
      },
      onCancelBtnTap: () {
        Navigator.of(context).pop(); 
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
