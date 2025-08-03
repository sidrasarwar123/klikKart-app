import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/Student_side/controller/course_controller.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/teacher_side/controller/course_controller.dart';
import 'package:klik_kart/teacher_side/widgets/course_card.dart';

import '../../../constants/app_colors.dart';

class CourseScreen extends StatelessWidget {
  CourseScreen({super.key});
final StudentcourseController studentcourseController=Get.put(StudentcourseController());

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
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.02),
        child: Obx(() {
          if (studentcourseController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            itemCount: studentcourseController.courseList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/studentattendencescreen');
                },
                 child: coursecardModel(course:studentcourseController.courseList[index]),
              );
            },
          );
        }),
      ),
    );
  }
}
