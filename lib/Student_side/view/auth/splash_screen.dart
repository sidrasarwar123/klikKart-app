import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/controller/profile_controller.dart';

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
    await Future.delayed(const Duration(seconds: 3));

    final isFirstTime = box.read("isFirstTime") ?? true;
    final user = FirebaseAuth.instance.currentUser;

    if (isFirstTime) {
      box.write("isFirstTime", false);
      Get.toNamed('/onboarding');
      return;
    }

    if (user == null) {
      Get.offNamed('/signup');
      return;
    }

    final profileController = Get.put(ProfileController());
    final userData = await profileController.getSingleUserData(user.uid);

    if (userData == null) {
      Get.offNamed('/signup');
      return;
    }

    final bool isTeacher = userData['isTeacher'] == true;

    if (isTeacher) {
      Get.offAllNamed('/bottombarscreen'); // ✅ Teacher home
      return;
    }

    // 👨‍🎓 Student logic
    final resDoc = await FirebaseFirestore.instance
        .collection('reservations')
        .doc(user.uid)
        .get();

    final resData = resDoc.data();
    final isApproved = resData != null && resData['isApproved'] == true;

    Get.offAllNamed('/bottombar', arguments: {
      'isApproved': isApproved,
      'initialIndex': 0,
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.25),
            Image.asset(AppImages.iconimage, height: screenHeight * 0.25),
            SizedBox(height: screenHeight * 0.30),
            const Text(
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
