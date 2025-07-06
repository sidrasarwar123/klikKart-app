import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';

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
              height: screenHeight * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.buttoncolor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Column(
                  children: [
                     Text(
                      "Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.personimage),
                        radius: 35,
                      ),
                    ),
                   Text(
                      "Khuzaima",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(" Grade: C ID: S7689", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),)
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
                              "User Details",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),SizedBox(width: screenWidth*0.3,),
                            ElevatedButton(onPressed: (){
          Get.toNamed('/resultscreen');
                            }, child: Text("View Result",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.buttoncolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                ),)
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
                              Text("Khuzaima",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ), SizedBox(height: screenHeight*0.01),
                        Divider(color: Color.fromARGB(255, 205, 229, 248)),
                        Padding(
                       padding:  EdgeInsets.only(left: screenWidth*0.06,),
                          child: Row(
                          children: [
                             Text("Register Course",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.08,),
                                Text("UI/UX Designing",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
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
                             Text("Roll Number",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.3,),
                                Text("09",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ), SizedBox(height: screenHeight*0.01),
                        Divider(color: Color.fromARGB(255, 205, 229, 248)),
                        Padding(
                       padding:  EdgeInsets.only(left: screenWidth*0.06,),
                          child: Row(
                          children: [
                             Text("Learning Mode",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.08,),
                                Text("Physical Learning",style: TextStyle(fontSize: 16,color: AppColors.buttoncolor),),
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
                             Text("Institute Branch",style: TextStyle(fontSize: 16),),
                              SizedBox(width: screenWidth*0.02),
                                Text("Dev Soft Global Services",style: TextStyle(fontSize: 15,color: AppColors.buttoncolor),),
                          ],
                          ),
                        ),
                      ],),
                     )
                     ,  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.03),
                      child: CustomButton(
                        text: "Log Out",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              icon:  Icon(Icons.error, color: Colors.blue),
                              title:  Text('Are you sure you want to log out?'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child:  Text("Log Out"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),SizedBox(height: screenHeight*0.1,)
                          ]
                          ) 
                                 ]
          ),
        ),

    );
  }
}