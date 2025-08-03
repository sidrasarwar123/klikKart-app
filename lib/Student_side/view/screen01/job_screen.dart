import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/controller/course_controller.dart';
import 'package:klik_kart/Student_side/widgets/job_card.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/controller/profile_controller.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class JobScreen extends StatefulWidget {
  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final CourseController controller = Get.put(CourseController());
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
            textEditingController: searchController, hintText: "search"),
        leading: IconButton(
          onPressed: () async {
            final uid = FirebaseAuth.instance.currentUser?.uid ?? "";
            if (uid.isEmpty) {
              Get.snackbar("Error", "User not logged in");
              return;
            }

            try {
              final profileController = Get.find<ProfileController>();
              final userData = await profileController.getSingleUserData(uid);

              if (userData == null) {
                Get.snackbar("Error", "User data not found");
                return;
              }

              final bool isTeacher = userData['isTeacher'] == true;

              if (isTeacher) {
                Get.offAllNamed('/bottombarscreen');
              } else {
                final resDoc = await FirebaseFirestore.instance
                    .collection('reservations')
                    .doc(uid)
                    .get();

                final resData = resDoc.data();
                final isApproved =
                    resData != null && resData['isApproved'] == true;

                Get.offAllNamed('/bottombar', arguments: {
                  'isApproved': isApproved,
                  'initialIndex': 0,
                });
              }
            } catch (e) {
              print("🔥 Error: $e");
              Get.snackbar("Error", "Something went wrong");
            }
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
