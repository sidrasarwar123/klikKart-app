import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/Student_side/view/auth/onboarding_screen.dart'; // Optional if using GetX for navigation

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
    
      Get.offAll(() => HomeScreen()); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color:AppColors.buttoncolor,

        ),
        child: Column(
          children: [
            SizedBox(height:230 ),
            
             Image(image: AssetImage(AppImages.iconimage)),
             SizedBox(height: 230,),
             Text("powerd by",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
             Text("Dev Soft Tech Solution",style: TextStyle(color: Colors.white,),)
             
             ],
        ),


      ),
   
    );
  }
}

 // body: 
      //       Column(
      //           children: [
      //             Center(
      //             child: Padding(
      //               padding: const EdgeInsets.only(top: 80),
      //               child: Image(image: AssetImage(AppImages.icon2image),
      //                   ),
      //             ),
      //               ),
      //                    Text("Sign in to your account"),
                         
      //                    ],
      //         ),
          