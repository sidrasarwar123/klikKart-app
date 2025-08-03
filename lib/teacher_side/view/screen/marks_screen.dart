import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/teacher_side/controller/marks_controller.dart';
import 'package:quickalert/quickalert.dart';

class MarksScreen extends StatefulWidget {
  const MarksScreen({super.key});

  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {
  final MarksController marksController = Get.put(MarksController());

  final List<String> classes = ["Senior 163 G", "Junior A1", ];
  final List<String> students = ["Khuzaima", "M.Hamza", ];

  @override
  void initState() {
    super.initState();
    // Initial fetch
    marksController.updateSelection(
      className: classes[0],
      studentName: students[0],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        final marks = marksController.marks.value;

        return Column(
          children: [
            Container(
              height: screenHeight * 0.40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.buttoncolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.07),
                  Text(
                    "Final Marks",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.6,
                        top: screenHeight * 0.03),
                    child: Text(
                      "Select your Class",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.85,
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: SizedBox(),
                      value: marksController.selectedClass.value,
                      items: classes
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          marksController.updateSelection(
                            className: value,
                            studentName:
                                marksController.selectedStudent.value,
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.6,
                        top: screenHeight * 0.01),
                    child: Text(
                      "Select your Student",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.85,
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: SizedBox(),
                      value: marksController.selectedStudent.value,
                      items: students
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          marksController.updateSelection(
                            className:
                                marksController.selectedClass.value,
                            studentName: value,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

          
            if (marks != null) ...[
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.03,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: screenHeight * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Progress",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.buttoncolor)),
                              Text("Obtain",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.buttoncolor)),
                              Text("Total",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.buttoncolor)),
                            ],
                          ),
                          Divider(color: AppColors.buttoncolor),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Assignment",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                              Text("${marks.assignment}%",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                              Text("${marks.totalAssignment}%",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sentinal",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                              Text("${marks.sentinel}%",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                              Text("${marks.totalSentinel}%",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Final term",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                              Text("${marks.finalMarks}%",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                              Text("${marks.totalFinal}%",
                                  style: TextStyle(
                                      color: AppColors.buttoncolor)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text("Grade"),
                                  Text(marks.grade,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.buttoncolor)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Percentage"),
                                  Text("${marks.percentage}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.buttoncolor)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05,
                                vertical: screenHeight * 0.01),
                            decoration: BoxDecoration(
                              color: marks.status.toLowerCase() == "passed"
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              marks.status,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ] else if (marksController.isLoading.value) ...[
              SizedBox(height: 30),
              CircularProgressIndicator(),
            ] else ...[
              SizedBox(height: 30),
              Text("No data available.",
                  style: TextStyle(color: Colors.grey)),
            ],

            Spacer(),

            /// 🔘 BUTTONS
            Padding(
              padding: EdgeInsets.only(
                  bottom: screenHeight * 0.09,
                  top: screenHeight * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      side: BorderSide(color: Colors.blue, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.1),
                  ElevatedButton(
                    onPressed: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Marks published successfully!',
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
                    child: Text(
                      "Publish",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
