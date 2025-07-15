import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:klik_kart/Student_side/view/auth/login_screen.dart';
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
    await Future.delayed(Duration(seconds: 3));

    bool isFirstTime = box.read("isFirstTime") ?? true;
    User? user = FirebaseAuth.instance.currentUser;

    if (isFirstTime) {
      box.write("isFirstTime", false);
      Get.toNamed('/onboarding');
    } else if (user == null) {
      Get.offNamed('/signup');
    } else {
      if (user != null) {
        final ProfileController getUserDataController =
            Get.put(ProfileController());
        var userData = await getUserDataController.getUserData(user!.uid);

        if (userData[0]['isTeacher'] == true) {
               Get.offNamed('/bottombarscreen');
          //navigate to teacher panel
        } else {
            Get.offNamed('/bottombar');
          //navigate to student panel
        }
      } else {
        Get.off(() => LoginScreen());
      }
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
            SizedBox(height: screenHeight * 0.25),
            Image.asset(AppImages.iconimage, height: screenHeight * 0.25),
            SizedBox(height: screenHeight * 0.30),
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


















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:klik_kart/constants/app_images.dart';
// import 'package:klik_kart/utils/snakebar_util.dart';


// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
 
// class _SplashScreenState extends State<SplashScreen> {
//  final box = GetStorage();

//  @override
//   void initState() {
//     super.initState();
//     checkUserStatus();

//   }

//  void checkUserStatus() async {
//   await Future.delayed(Duration(seconds: 3));

//   bool isFirstTime = box.read("isFirstTime") ?? false;
//   User? user = FirebaseAuth.instance.currentUser;

//   if (isFirstTime) {
//     box.write("isFirstTime", true);
//     Get.toNamed('/onboarding');
//   } else if (user == null) {
//     Get.offNamed('/signup'); 
//   } else {
//     // User login hai, check role
//     final uid = user.uid;
//     final doc = await FirebaseFirestore.instance
//         .collection('userdata')
//         .doc(uid)
//         .get();

//     if (doc.exists) {
//       final isTeacher = doc['isTeacher'] ?? false;

//       // Step 2: Redirect based on role
//       if (isTeacher) {
//         Get.offNamed('/bottombarscreen'); // teacher
//       } else {
//         Get.offNamed('/bottombar'); // student
//       }
//     } else {
//       SnackbarUtil.showError("User data not found in Firestore");
//       Get.offNamed('/signup');
//     }
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//        final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.blue,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           SizedBox(height: screenHeight*0.25),
//             Image.asset(AppImages.iconimage, height: screenHeight*0.25),
//        SizedBox(height: screenHeight*0.30),
//          Text(
//               "Powered by",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             const Text(
//               "Dev Soft Tech Solution",
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }