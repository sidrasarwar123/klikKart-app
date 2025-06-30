import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/widgets/job_card.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class JobTitle extends StatelessWidget {
  const JobTitle({super.key});

  @override
  Widget build(BuildContext context) {
       final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
     body: Padding(
       padding:  EdgeInsets.only(top: screenHeight*0.07 ),
       child: SingleChildScrollView(scrollDirection: Axis.vertical,
         child: Column(
          children: [
            Padding(
               padding:  EdgeInsets.only(right: screenWidth*0.7),
              child: Text("Job Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            
                      
                         Padding(
                           padding: EdgeInsets.only(top: screenHeight*0.02),
                           child: JobCard(companyLogoUrl: AppImages.iconimage , 
                           title:"UI/UX DESIGNING", company:"Dev SoftTech IT SOLUTION" , 
                           location: "Job location (Onsite)", match: "", daysAgo:"",
                            showMatchInfo: false,
                             showTime: false,
                            showApplyButton: false,
                           ),
                                          
                         ),Padding(
                           padding:  EdgeInsets.only(left: screenWidth*0.06,top: screenHeight*0.04),
                           child: Row(children: [
                             Icon(Icons.work, color: AppColors.buttoncolor),
                               SizedBox(width: 20),
                             Text(
                        'Full-time Mid-Senior level',
                        style: TextStyle(fontSize: 16),
                      ),
                           ],),
                         ),
                         Padding(
                           padding:  EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.01),
                           child: Row(children: [
                             Icon(Icons.business, color: AppColors.buttoncolor),
                               SizedBox(width: 20),
                             Text(
                       '1,000+ employees • IT SOLUTION',
                        style: TextStyle(fontSize: 16),
                      ),
                           ],),
                         ),
                            Padding(
                           padding:  EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.01),
                           child: Row(children: [
                             Icon(Icons.checklist, color: AppColors.buttoncolor),
                               SizedBox(width: 20),
                             Text(
                       'Skills: Communication, Consultative\n Selling, +8 more',
                        style: TextStyle(fontSize: 16),
                      ),
                           ],),
                         ),
                        
                 Padding(
                   padding:  EdgeInsets.only(right: screenWidth*0.5,top: screenHeight*0.03),
                   child: Text(
                    'Job description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                 ),
                 ),  
                 Padding(
                   padding:  EdgeInsets.only(left: screenWidth*0.04,top: screenHeight*0.01),
                   child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyle(fontSize: 12, height: 1.5),
                                 ),
                 ),
                  Padding(
                   padding:  EdgeInsets.only(right: screenWidth*0.5,top: screenHeight*0.03),
                   child: Text(
                    'Responsibilities',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                 ),
                 ),  
                 Padding(
                   padding:  EdgeInsets.only(left: screenWidth*0.04,top: screenHeight*0.01),
                   child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyle(fontSize: 12, height: 1.5),
                                 ),
                 ),SizedBox(height: screenHeight*0.04,),
                 CustomButton(text: "Apply", onPressed: (){
                  Get.toNamed('/jobreservation');
                 }),
                
                      
          ],
         ),
       ),
     ),
    );
  }
}