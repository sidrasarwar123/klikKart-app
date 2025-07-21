import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/controller/course_controller.dart';
import 'package:klik_kart/Student_side/widgets/job_card.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class JobScreen extends StatelessWidget {
  final CourseController controller = Get.put(CourseController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(textEditingController: searchController, hintText: "search"),
        leading: IconButton(
  onPressed: () {
    Get.offAllNamed('/bottombar'); 
  },
  icon: Icon(
    AppIcons.arrowicon,
    color: AppColors.buttoncolor,
    size: 30,
  ),
),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.02),
        child: Obx(() {
          if (controller.jobs.isEmpty) {
            return Center(child: Text("No jobs available"));
          }
          return ListView.builder(
            itemCount: controller.jobs.length,
            itemBuilder: (context, index) {
              final job = controller.jobs[index];
              return JobCard(
                title: job.title,
                company: job.company,
                location: job.location,
                match: job.matchInfo,
                daysAgo: job.daysAgo,
                companyLogoUrl: job.companyLogoUrl,
                onTap: () {
                  Get.toNamed('/jobtitle', arguments: job);
                },
              );
            },
          );
        }),
      ),
    );
  }
}
