import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:klik_kart/Student_side/widgets/job_card.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class JobReservation extends StatefulWidget {
  const JobReservation({super.key});

  @override
  State<JobReservation> createState() => _JobReservationState();
}

class _JobReservationState extends State<JobReservation> {
  final TextEditingController firstusernameController=TextEditingController();
  final TextEditingController lastusernameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
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
                                          
                         ),SizedBox(height: screenHeight*0.04,),
                          CustomTextField(textEditingController:firstusernameController,
                            hintText: " First Name"),
                   CustomTextField(textEditingController:lastusernameController ,
                    hintText: "Last Name"),
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.01,right: screenWidth*0.05),
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                          hintText: ' 000 0000',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey.shade100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey.shade100),
                          ),
                        ),
                        initialCountryCode: 'PK',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
 CustomTextField(textEditingController: emailController,
  hintText: "Email Adress"),
 SizedBox(height: screenHeight*0.05,),
  GestureDetector(
          onTap: () {
        
            print("Upload resume tapped");
          },
          child: Container(
            width: screenWidth * 0.7,
            height: screenHeight*0.1,
            decoration: BoxDecoration(
              color:  Color(0xFFE9F4FC),
              border: Border.all(color: Colors.blue, width: 1.5),
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.upload, size: 30, color: Colors.blue),
                SizedBox(height: 8),
                Text(
                  "Upload Resume",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
// CustomButton(
//   text: "Submit",
//   onPressed: () {
//     QuickAlert.show(
//       context: context,
//       type: QuickAlertType.success,
//       text: 'Your form has been successfully submitted!',
//     );
//   },
// ),

          ]),
          

          
         )
       )
    
      
    );
  }
}