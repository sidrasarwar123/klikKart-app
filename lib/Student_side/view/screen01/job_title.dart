import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/models/job_model.dart';
import 'package:klik_kart/Student_side/widgets/job_card.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';

class JobTitle extends StatefulWidget {
  const JobTitle({super.key});

  @override
  State<JobTitle> createState() => _JobTitleState();
}

class _JobTitleState extends State<JobTitle> {
    final RxBool isLoading = false.obs;
   final JobModel job = Get.arguments as JobModel;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (job == null) {
      return Scaffold(
        body: Center(
          child: Text('Job details not found.'),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.07),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.06),
                child: Text(
                  "Job Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: JobCard(
                  title: job!.title,
                  company: job!.company,
                  location: job!.location,
                  match: job!.matchInfo,
                  daysAgo: job!.daysAgo,
                  companyLogoUrl: job!.companyLogoUrl,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06, top: screenHeight * 0.04),
                child: Row(
                  children: [
                    Icon(Icons.work, color: AppColors.buttoncolor),
                    SizedBox(width: 20),
                    Text(
                      job!.jobType.isNotEmpty ? job!.jobType : 'N/A',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06, top: screenHeight * 0.015),
                child: Row(
                  children: [
                    Icon(Icons.business, color: AppColors.buttoncolor),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        job!.industry.isNotEmpty ? job!.industry : 'N/A',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06, top: screenHeight * 0.015),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.checklist, color: AppColors.buttoncolor),
                    SizedBox(width: screenWidth*0.02),
                    Expanded(
                      child: Text(
                        "Skills: ${job!.skills.isNotEmpty ? job!.skills.join(', ') : 'N/A'}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06, top: screenHeight * 0.03),
                child: Text(
                  'Job description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.01),
                child: Text(
                  job!.description,
                  style: TextStyle(fontSize: 13, height: 1.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06, top: screenHeight * 0.03),
                child: Text(
                  'Responsibilities',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.01),
                child: Text(
                  job!.responsibilities,
                  style: TextStyle(fontSize: 13, height: 1.5),
                ),
              ),
             
              SizedBox(height: screenHeight * 0.04),
              Center(
                child: Obx(()=>
                 CustomButton(isloading: isLoading.value,
                    text: "Apply",
                    onPressed: () {isLoading.value=true;
                      Get.toNamed('/jobreservation',arguments: job);
                    
                    },
                    
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}