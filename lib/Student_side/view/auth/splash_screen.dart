import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:klik_kart/constants/app_images.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
 
class _SplashScreenState extends State<SplashScreen> {
 final box = GetStorage();

 @override
  void initState() {
    super.initState();
    checkUserStatus();

  }

  void checkUserStatus() async {
    await Future.delayed(Duration(seconds: 3));
    bool isFirstTime = box.read("isFirstTime") ?? true; 
    User? user =FirebaseAuth.instance.currentUser;
     
     if (isFirstTime ) {
      box.write("isFirstTime", true); 
      Get.toNamed('/onboarding'); 
    }else if(user == null){
Get.offNamed('/signup');
    }
    
    
     else {
      Get.offNamed('/homescreen'); 
    }
  }

  @override
  Widget build(BuildContext context) {
       final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(height: screenHeight*0.25),
            Image.asset(AppImages.iconimage, height: screenHeight*0.25),
       SizedBox(height: screenHeight*0.30),
         Text(
              "Powered by",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              "Dev Soft Tech Solution",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}