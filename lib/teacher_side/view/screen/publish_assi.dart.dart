import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/teacher_side/controller/assignment_controller.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';
import 'package:table_calendar/table_calendar.dart';

class Stu2Assigment extends StatefulWidget {
  const Stu2Assigment({super.key});

  @override
  State<Stu2Assigment> createState() => _Stu2AssigmentState();
}

class _Stu2AssigmentState extends State<Stu2Assigment> {
  final AssignmentController controller = Get.put(AssignmentController());

  final TextEditingController topicController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  bool showCalendar = false;

  String selectedClass = "Senior 163 G";

  /// Map class name to Firestore classId
  String getClassIdFromName(String className) {
    switch (className) {
      case "Senior 163 G":
        return "A12G";
      case "Junior A1":
        return "B1";
      case "Prep B":
        return "C1";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: const Text("Assignments"),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(AppIcons.arrowicon, color: AppColors.buttoncolor, size: 30),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              const Text("Select your Class", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.01),
                child: Container(
                  width: screenWidth * 0.85,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color.fromARGB(255, 245, 240, 240)),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: selectedClass,
                    items: ["Senior 163 G", "Junior A1", "Prep B"]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: Colors.grey))))
                        .toList(),
                    onChanged: (value) {
                      setState(() => selectedClass = value!);
                    },
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

          
               Text("Write Topic:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              CustomTextField(textEditingController: topicController, hintText: "e.g. UI Assignment"),

              SizedBox(height: screenHeight * 0.02),

        
              Text("Date:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.01, top: screenHeight * 0.01),
                child: InkWell(
                  onTap: () => setState(() => showCalendar = !showCalendar),
                  child: Container(
                    width: screenWidth * 0.85,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDay != null
                              ? "${selectedDay!.day}-${selectedDay!.month}-${selectedDay!.year}"
                              : "Select Date",
                          style: const TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        const Icon(Icons.calendar_month, color: Colors.blue),
                      ],
                    ),
                  ),
                ),
              ),

              
              if (showCalendar)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.06),
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
                          color: AppColors.buttoncolor,
                        ),
                        leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.blue),
                        rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.blue),
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                        weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(color: Colors.blue.shade100, shape: BoxShape.circle),
                        selectedDecoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),

              SizedBox(height: screenHeight * 0.02),

             
               Text("Additional Notes:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
               SizedBox(height: 10),
              TextField(
                controller: notesController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Additional Notes",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.06),

            
              CustomButton(
                text: "Publish Now",
                onPressed: () async {
                  if (topicController.text.isEmpty || selectedDay == null) {
                    Get.snackbar("Error", "Please enter the topic and select a date");
                    return;
                  }

                  String classId = getClassIdFromName(selectedClass);
                  String studentId = "STU001"; 

                  await controller.addAssignment(
                    classId: classId,
                    studentId: studentId,
                    title: topicController.text.trim(),
                    totalMarks: 100,
                    obtainedMarks: 80,
                    date: selectedDay!,
                  );

                  Get.snackbar("Success", "Assignment published");
               Get.toNamed(
  "/studentmarks",
  parameters: {
    "classId": "A12G", 
    "studentId": "STU001",
  },
);
                },
              ),

              SizedBox(height: screenHeight * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
