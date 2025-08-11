import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/teacher_side/controller/assignment_controller.dart';


class StudentAssignment extends StatefulWidget {
  final String classId;
  final String studentId;

  const StudentAssignment({
    required this.classId,
    required this.studentId,
    Key? key,
  }) : super(key: key);

  @override
  State<StudentAssignment> createState() => _StudentAssignmentScreenState();
}

class _StudentAssignmentScreenState extends State<StudentAssignment> {
  final AssignmentController controller = Get.put(AssignmentController());
  

  @override
  void initState() {
    super.initState();
    controller.fetchAssignments(
      classId: widget.classId,
      studentId: widget.studentId,
    );
  }

  @override
  Widget build(BuildContext context) {
    
     final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Assignments")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.assignments.isEmpty) {
          return const Center(child: Text("No assignments found."));
        }

        return ListView.builder(
          padding:EdgeInsets.only(left: screenWidth*0.03,top: screenHeight*0.01),
          itemCount: controller.assignments.length,
          itemBuilder: (context, index) {
            final assignment = controller.assignments[index];
            final formattedDate = DateFormat('dd MMM yyyy').format(assignment.date);
            final percentage = assignment.totalMarks == 0
                ? 0.0
                : assignment.obtainedMarks / assignment.totalMarks;

            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              margin:  EdgeInsets.only(bottom: screenHeight*0.02),
              child: Padding(
                padding:  EdgeInsets.all(screenHeight*0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Chip(
                            label: Text(assignment.title,
                                style: const TextStyle(color: Colors.white)),
                            backgroundColor: AppColors.buttoncolor,
                          ),
                           SizedBox(height: screenHeight*0.01),
                          Row(
                            children: [
                              Chip(
                                label: Text("Total: ${assignment.totalMarks}",
                                    style: const TextStyle(fontSize: 10)),
                                backgroundColor: Colors.green.shade100,
                              ),
                             SizedBox(width: 6),
                              Chip(
                                label: Text("Obtained: ${assignment.obtainedMarks}",
                                    style: const TextStyle(fontSize: 10)),
                                backgroundColor: Colors.orange.shade100,
                              ),
                            ],
                          ),
                        
                        ],
                      ),
                    ),
                    Column(
                      children: [
                         
                          Text("Date: $formattedDate", style:  TextStyle(fontSize: 12)),
                        Padding(
                          padding:  EdgeInsets.only(top: screenHeight*0.02),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              
                              CircularProgressIndicator(
                                value: percentage,
                                strokeWidth: 6,
                                backgroundColor: Colors.grey[300],
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                              ),
                              Text("${(percentage * 100).toInt()}%",
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                       SizedBox(height: screenHeight*0.01),
                        Text("Marks", style: TextStyle(color: AppColors.buttoncolor)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
          floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/student02assigment");
        },
        backgroundColor: AppColors.buttoncolor,
        child:  Icon(Icons.add, color: Colors.white),
        shape:  CircleBorder(),
        tooltip: "Add Assignment",
      ),
    );
  }
}



  // onPressed: () async {
  //                 if (topicController.text.isEmpty || selectedDay == null) {
  //                   Get.snackbar("Error", "Please enter the topic and select a date");
  //                   return;
  //                 }

                  // String classId = getClassIdFromName(selectedClass);
                  // String studentId = "STU001"; 

                  // await controller.addAssignment(
                  //   classId: classId,
                  //   studentId: studentId,
                  //   title: topicController.text.trim(),
                  //   totalMarks: 100,
                  //   obtainedMarks: 80,
                  //   date: selectedDay!,
                  // );

                  // Get.snackbar("Success", "Assignment published");
                    // Get.toNamed(
//   "/studentmarks",
//   parameters: {
//     "classId": "A12G", 
//     "studentId": "STU001",
//   },
// );