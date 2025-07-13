import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class StudentProfilescreen extends StatelessWidget {
  const StudentProfilescreen({super.key});

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
          children: [
            
            Container(
              height: screenHeight * 0.27,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.buttoncolor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.09),
                child: Column(
                  children: [
                     Text(
                      "Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.teacherimage),
                        radius: 35,
                      ),
                    ),
                   Text(
                      "Mr.Hanzla",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                   
                  ],
                ),
              ),
            ), Column(
                  children: [
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:  EdgeInsets.only(left: screenWidth*0.04,top: screenHeight*0.02),
                        child: Row(
                          children: [
                            Text(
                              "Teacher Details",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                     SizedBox(height: 10),
                     Container(
                      height: screenHeight*0.5,
                      width: screenWidth*0.9,
                      decoration: BoxDecoration(
                        border: Border.all(color:  Color.fromARGB(255, 205, 229, 248)),
                        color:  Color.fromARGB(255, 241, 244, 247),borderRadius: 
                        BorderRadius.circular(20)
                      ),child: Column(children: [
                        Padding(
                          padding:  EdgeInsets.only(left: screenWidth*0.06,top: screenHeight*0.03),
                          child: Row(children: [
                            Text("Name",style: TextStyle(fontSize: 16),),
                            SizedBox(width: screenWidth*0.4,),
                              Text("Mr.Hanzla",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ), SizedBox(height: screenHeight*0.01),
                        Divider(color: Color.fromARGB(255, 205, 229, 248)),
                        Padding(
                       padding:  EdgeInsets.only(left: screenWidth*0.06,),
                          child: Row(
                          children: [
                             Text("Email",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.3,),
                                Text("hanzla@gmail.com",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ), SizedBox(height: screenHeight*0.01),
                        Divider(color: Color.fromARGB(255, 205, 229, 248)),
                        Padding(
                       padding:  EdgeInsets.only(left: screenWidth*0.06,),
                          child: Row(
                          children: [
                             Text("Gender",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.4,),
                                Text("Male",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ), SizedBox(height: screenHeight*0.01),
                        Divider(color: Color.fromARGB(255, 205, 229, 248)),
                        Padding(
                       padding:  EdgeInsets.only(left: screenWidth*0.06,),
                          child: Row(
                          children: [
                             Text("phone Number",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.1),
                                Text("+92 00 111 2222",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ), SizedBox(height: screenHeight*0.01),
                        Divider(color: Color.fromARGB(255, 205, 229, 248)),
                        Padding(
                       padding:  EdgeInsets.only(left: screenWidth*0.06,),
                          child: Row(
                          children: [
                             Text("CNIC",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.3,),
                                Text("111222-33333-4444",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ), SizedBox(height: screenHeight*0.01),
                        Divider(color: Color.fromARGB(255, 205, 229, 248)),
                        Padding(
                       padding:  EdgeInsets.only(left: screenWidth*0.06,),
                          child: Row(
                          children: [
                             Text("Address",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.2),
                                Text("  A Block Street 4",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ), SizedBox(height: screenHeight*0.01),
                        Divider(color: Color.fromARGB(255, 205, 229, 248)),
                        Padding(
                       padding:  EdgeInsets.only(left: screenWidth*0.06,),
                          child: Row(
                          children: [
                             Text("Disigination",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.2),
                                Text("UI/UX Designer",style: TextStyle(fontSize: 15,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ),
                      ],),
                     )
                //      ,  Padding(
                //       padding: EdgeInsets.only(top: screenHeight * 0.03),
                //       child:CustomButton(
                // text: "Log Out",
                // onPressed: () {
                //   QuickAlert.show(
                //     context: context,
                //     type: QuickAlertType.confirm,
                //     text: 'Do you want to logout?',
                //     confirmBtnText: 'Yes',
                //     cancelBtnText: 'No',
                //     confirmBtnColor: Colors.red,
                //   //   onConfirmBtnTap: () {
                //   //     Get.back(); 
                //   //     Get.offAllNamed('/login'); 
                //   //   },
                //   );
                //     SizedBox(height: screenHeight*0.1,);
                // }
                //       )
                //      )      
                  
          
                                 ]
          ),
          ]
        )),
      
    );
  }
}