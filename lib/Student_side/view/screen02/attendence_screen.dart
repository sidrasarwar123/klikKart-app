import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/Student_side/controller/student_controller.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({super.key});

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  final StudentDashboardController studentDashboardController=Get.put(StudentDashboardController());
   DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  @override
  Widget build(BuildContext context) {
       final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold (
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Attendance",style: TextStyle(color: AppColors.buttoncolor),),
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
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth*0.03,top: screenHeight*0.03),
                    child: Obx((){
                      final student = studentDashboardController.studentData.value;
 if (student == null) {
    return const Center(child: CircularProgressIndicator());
  }
  else{
    return  Row(
                        children: [
                             Container(
                                                  padding:
                                                       EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenHeight*0.01),
                                                  decoration: BoxDecoration(color: Colors.green,
                                                   
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Row(
                                                    
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person, color: Colors.white),
                                   SizedBox(width: 6),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                         "Present=\n ${student.attendance.present}",
                                        style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.textcolor, fontSize: 14),
                                      ),
                                     
                                             
                                
                        ],
                      ),
                                      
                                      ],
                                    )
                                
                                ),SizedBox(width: screenWidth*0.1,),
                                 Container(
                                                  padding:
                                                       EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenHeight*0.01),
                                                  decoration: BoxDecoration(color: Colors.red,
                                                   
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person, color: Colors.white),
                                   SizedBox(width: screenWidth*0.06),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Absent=\n ${student.attendance.absent}",
                                        style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.textcolor, fontSize: 14),
                                      ),
                                     
                                             
                                
                        ],
                      ),
                                      
                                      ],
                                    )
                                
                                ),
                        ]
                      );

  }

                    }
                      
                    ),
                    
                  ),
                  Padding(
          padding:  EdgeInsets.all(20),
          child: Container(
            padding:  EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Attendance",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.chevron_left),
                        Text("Sept 2023"),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: LineChart(
                    LineChartData(
                      minY: 0,
                      maxY: 10,
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  days[value.toInt() % days.length],
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              );
                            },
                            interval: 1,
                            reservedSize: 28,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 5),
                            FlSpot(1, 4),
                            FlSpot(2, 5.5),
                            FlSpot(3, 4),
                            FlSpot(4, 9),
                            FlSpot(5, 2),
                          ],
                          isCurved: true,
                          color: Colors.blue,
                          barWidth: 3,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(0.4),
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              Color color = spot.y > 4.5 ? Colors.green : Colors.red;
                              return FlDotCirclePainter(
                                radius: 4,
                                color: color,
                                strokeColor: Colors.white,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),)
                ]     
                  )
                  ]
                  ),
        ))

    
    );
  }
}