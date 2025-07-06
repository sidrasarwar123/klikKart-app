import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendenceScreen01 extends StatefulWidget {
  const AttendenceScreen01 ({super.key});

  @override
  State<AttendenceScreen01> createState() => _AttendenceScreen01State();
}

class _AttendenceScreen01State extends State<AttendenceScreen01> {
    DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
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
            )),
      ),
       body:Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight*0.04, horizontal: screenWidth*0.06),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
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
                    titleTextStyle:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18,color: AppColors.buttoncolor),
                    leftChevronIcon:  Icon(Icons.chevron_left, color: Colors.blue),
                    rightChevronIcon: Icon(Icons.chevron_right, color: Colors.blue),
                  ),
                  daysOfWeekStyle:  DaysOfWeekStyle(
                    weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                    weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: Colors.blue.shade100, shape: BoxShape.circle),
                    selectedDecoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  ),
                ),
              ),
              SizedBox(height: screenHeight*0.2,),
              CustomButton(text: "Next", onPressed: (){
                Get.toNamed('/course');
              })
            ]
          )))
          
    );
  }
}