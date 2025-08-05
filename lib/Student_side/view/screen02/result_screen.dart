import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/controller/result_controller.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final ResultController resultController = Get.put(ResultController());

  @override
  void initState() {
    super.initState();

    final classId = Get.arguments['classId'];
    final studentId = Get.arguments['studentId'];

    resultController.fetchResult(classId, studentId);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        if (resultController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final result = resultController.result.value;

        if (result == null) {
          return Center(child: Text("No result found."));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: screenHeight * 0.25,
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
                        SizedBox(height: screenHeight * 0.1),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                AppIcons.arrowicon,
                                color: AppColors.textcolor,
                                size: 36,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Result",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(flex: 2),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -25,
                    left: screenWidth * 0.20,
                    right: screenWidth * 0.20,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Final Marks",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.08),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 5)),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Progress", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Obtain", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Divider(),
                         Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Assignment"),
                             Text("${result.assignmentMarks}%"),
                                 Text("${result.assignmentTotal}%"),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sentinal"),
                              Text("${result.sentinelMarks}%"),
                              Text("${result.sentinelTotal}%"),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Final term"),
                              Text("${result.finalTermMarks}%"),
                              Text("${result.finalTermTotal}%"),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text("Grade"),
                                  Text(result.grade, style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(height: 6),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Percentage"),
                                  Text("${result.percentage}%", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.01),
                            decoration: BoxDecoration(
                              color: result.status == "Passed" ? Colors.green : Colors.green,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(result.status, style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
