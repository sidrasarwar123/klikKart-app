

import 'package:flutter/material.dart';

import 'package:klik_kart/Employee_side/model/emp_attend_model.dart';
import 'package:klik_kart/Employee_side/widgets/attend_card.dart.dart';

import 'package:klik_kart/constants/app_colors.dart';


class EmpAttendence extends StatefulWidget {
  const EmpAttendence({super.key});

  @override
  State<EmpAttendence> createState() => _EmpAttendenceState();
}

class _EmpAttendenceState extends State<EmpAttendence> {
    final List<EmployeeAttendanceModel> attendanceList = [
    EmployeeAttendanceModel(date: "19", day: "Fri", clockIn: "09:10 AM", clockOut: "06:10 AM", totalHours: "09:00", status: "Full Day", type: "Regular"),
  EmployeeAttendanceModel(date: "18", day: "Thu", clockIn: "09:10 AM", clockOut: "- - - - -", totalHours: "- - - - -", status: "Absent", type: "Regular"),
   EmployeeAttendanceModel(date: "17", day: "Wed", clockIn: "09:10 AM", clockOut: "04:10 AM", totalHours: "07:00", status: "Early Leave", type: "Regular"),
   EmployeeAttendanceModel(date: "16", day: "Tue", clockIn: "09:10 AM", clockOut: "06:10 AM", totalHours: "09:00", status: "Full Day", type: "Regular"),

    EmployeeAttendanceModel(date: "13", day: "Sun", clockIn: "09:10 AM", clockOut: "06:10 AM", totalHours: "09:00", status: "Full Day", type: "Regular"),
  EmployeeAttendanceModel(date: "12", day: "Mon", clockIn: "09:10 AM", clockOut: "- - - -", totalHours: "- - - -", status: "Absent", type: "Regular"),
   EmployeeAttendanceModel(date: "11", day: "Tue", clockIn: "09:10 AM", clockOut: "04:10 AM", totalHours: "07:00", status: "Early Leave", type: "Regular"),
   EmployeeAttendanceModel(date: "10", day: "Wed", clockIn: "09:10 AM", clockOut: "06:10 AM", totalHours: "09:00", status: "Full Day", type: "Regular"),
  ];
    

  
  DateTime _currentDate = DateTime.now();
  String _selectedChip = "All";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String monthText =
        "${_getMonthName(_currentDate.month)} ${_currentDate.year}";

    return Scaffold(
     body: ListView(
  padding: EdgeInsets.zero,
  children: [
    Container(
      height: screenHeight * 0.20,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.buttoncolor,
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child:  Center(
        child: Text(
          "Attendance",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),


    Container(
      width: double.infinity,
      height: screenHeight * 0.06,
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
      color:  Color.fromARGB(255, 131, 208, 243),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentDate =
                    DateTime(_currentDate.year, _currentDate.month - 1);
              });
            },
            icon:  Icon(Icons.arrow_back_ios,
                size: 20, color: Colors.white),
          ),
          Text(
            monthText,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _currentDate =
                    DateTime(_currentDate.year, _currentDate.month + 1);
              });
            },
            icon:
                 Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
          ),
        ],
      ),
    ),

        Padding(
          padding:  EdgeInsets.only(left: screenWidth*0.04),
          child: Row(
            children: [
              _buildChip("All"),
              _buildChip("Early Leave"),
              _buildChip("Late in"),
              _buildChip("Absents"),
            ],
          ),
        ),
 
    if (_selectedChip == "All") ...[
ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: attendanceList.length,
  itemBuilder: (context, index) {
    return AttendanceTile(data: attendanceList[index]);
  },
),
   Container(
            margin:  EdgeInsets.all(12),
            padding:  EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child:  Center(
              child: Text(
                "Weekend off: 15 Sunday & 14 Saturday",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: attendanceList.length,
  itemBuilder: (context, index) {
    return AttendanceTile(data: attendanceList[index]);
  },
),

  Container(
    margin: EdgeInsets.all(screenWidth * 0.04),
    padding: EdgeInsets.all(screenWidth * 0.03),
    decoration: BoxDecoration(
      color: Colors.red[100],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      "Weekend off: 15 Sunday & 14 Saturday",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
    ),
  ),
   SizedBox(
    height: screenHeight * 0.07, )

       
    ] else if (_selectedChip == "Early Leave") ...[
      _dataCard("Ahmed", "Left at 1:00 PM"),
    ] else if (_selectedChip == "Late in") ...[
      _dataCard("Ali", "Arrived at 10:15 AM"),
    ] else if (_selectedChip == "Absents") ...[
      _dataCard("Ayesha", "Absent on 29 June"),
    ],
  ],
),

    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return monthNames[month - 1];
  }


  Widget _buildChip(String label) {
    final bool isActive = _selectedChip == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedChip = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  Widget _dataCard(String name, String status) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Text(status),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
  
}








