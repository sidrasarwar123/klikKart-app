import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/controller/course_controller.dart';

import 'package:klik_kart/Student_side/widgets/job_card.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final CourseController courseController=Get.put(CourseController());
  final TextEditingController searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
          textEditingController: searchController,
          hintText: "Search",
          prefixIcon: Icons.search,
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: Icon(
        //     AppIcons.arrowicon,
        //     color: AppColors.buttoncolor,
        //     size: 30,
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Recommended for you",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              
               SizedBox(height: 12),

             Expanded(
  child: Obx(() {
    if (courseController.jobList.isEmpty) {
      return Center(child: Text("No jobs available"));
    }

    return ListView.builder(
      itemCount: courseController.jobList.length,
      itemBuilder: (context, index) {
        final job = courseController.jobList[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.01),
          child: JobCard(
            daysAgo: "8d", 
            companyLogoUrl: job.companyLogoUrl,
            title: job.title,
            company: job.company,
            location: job.location,
            match: job.matchInfo,
          ),
        );
      },
    );
  }),
),
                    // SizedBox(height: screenHeight*0.02,),
                    // Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                    //   child: JobCard(
                    //     daysAgo: "8d",
                    //     companyLogoUrl: AppImages.iconimage,
                    //     title: "UI/UX DESIGNING",
                    //     company: "Dev SoftTech IT SOLUTION",
                    //     location: "Job location (Onsite)",
                    //     match: "Your profile matches this job",
                    //   ),
                    // ), SizedBox(height: screenHeight*0.02,),
                    // Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                    //   child: JobCard(
                    //     daysAgo: "8d",
                    //     companyLogoUrl: AppImages.iconimage,
                    //     title: "UI/UX DESIGNING",
                    //     company: "Dev SoftTech IT SOLUTION",
                    //     location: "Job location (Onsite)",
                    //     match: "Your profile matches this job",
                    //   ),
                    // ),
                  ],
                ),
              ),
          
          ),
        
    
    );
  }
}
