import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/widgets/course_widget.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';

import 'package:klik_kart/teacher_side/models/course_model.dart.dart';
import 'package:klik_kart/teacher_side/widgets/course_card.dart'; 

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final List<CourseModel> courseList = [
    
    CourseModel(title: "UI/UX Designing", subtitle: "Senior 163 G"),
    CourseModel(title: "UI/UX Designing", subtitle: "Senior 956 G"),
    CourseModel(title: "UI/UX Designing", subtitle: "Senior 158 G"),
    CourseModel(title: "UI/UX Designing", subtitle: "Senior 123 G"),
    CourseModel(title: "UI/UX Designing", subtitle: "Senior 158 G"),
    CourseModel(title: "UI/UX Designing", subtitle: "Senior 123 G"),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child:  Text("Attendance"),
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
        padding:  EdgeInsets.only(top: screenHeight*0.05,left: screenWidth*0.02),
        child: GridView.builder(
          itemCount: courseList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(onTap: (){
              Get.toNamed('/studentattendencescreen');
            },
              child: coursecardModel(course: courseList[index]));
          },
        ),
      ),
    );
  }
}
