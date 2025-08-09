import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:klik_kart/utils/loading.dart';
import 'package:klik_kart/utils/snakebar_util.dart';

class AuthController extends GetxController {
 RxBool isloading = false.obs;
  final box = GetStorage(); 
  


 Future signUp(
  GlobalKey<FormState> _formKey,
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController passwordController,
  bool isTeacher,
) async {
  if (_formKey.currentState!.validate()) {
    try {
      isloading.value = true;

      UserCredential userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
    .collection('students')
    .doc(uid)  //  Yahan UID document ID ban gaya
    .set({
      'name': 'Sidra',
      'email': 'sidra@gmail.com',
      'totalFee': 1000,
      'submittedFee': 500,
      'pendingFee': 500,
      'attendance': {
      'present': 22,
      'absent': 6,
     
    },
       'courseProgress': {
         'uiux': {
        'image': 'https://www.softflame.in/images/services/sub-nav/ui-ux-banner.jpg',
        'imageUrl':'https://www.creativeitinstitute.com/images/course/course_1663052056.jpg',
        'progress': 80,
        'title': 'UI/UX DESIGNING',
        'status': 'Completed',
      },
      'flutter': {
        'image': 'assets/images/flutter.png',
        'progress': 40,
        'title': 'Flutter Development',
        'status': 'In Progress',
      },
    
  
    },
    }
      , SetOptions(merge: true));
      await FirebaseFirestore.instance
    .collection('students')
    .doc(uid)
    .collection('assignments')
    .add({
  'title': 'UI/UX Assignment 1',
  'totalMarks': 100,
  'obtainedMarks':70,
  'date': '21 AGU 2019',
  'progress': 80,
});
await FirebaseFirestore.instance
    .collection('students')
    .doc(uid)
    .collection('assignments')
    .add({
  'title': 'Web Dev Assignment 2',
  'totalMarks': 100,
  'obtainedMarks':90,
  'date': '21 AGU 2019',
  'progress': 90,
});
await FirebaseFirestore.instance
    .collection('students')
    .doc(uid)
    .collection('assignments')
    .add({
  'title': 'Photography Assignment 3',
  'totalMarks': 100,
  'obtainedMarks':50,
  'date': '21 AGU 2019',
  'progress': 50,
});

      SnackbarUtil.showSuccess('Account created successfully');

      if (isTeacher) {
        Get.offAllNamed('/bottombarscreen'); 
      } else {
        final reservationRef = FirebaseFirestore.instance.collection('reservations').doc(uid);

        final snapshot = await reservationRef.get();
        if (!snapshot.exists) {
          await reservationRef.set({
            'name': usernameController.text.trim(),
            'email': emailController.text.trim(),
            'submittedAt': FieldValue.serverTimestamp(),
            'isApproved': false,
          });
        }

        final updatedSnapshot = await reservationRef.get();
        bool isApproved = updatedSnapshot['isApproved'] == true;

        Get.offAllNamed('/bottombar', arguments: {
          'isApproved': isApproved,
          'initialIndex': 0,
        });
      }
    } catch (e) {
      SnackbarUtil.showError(e.toString());
    } finally {
      isloading.value = false;
    }
  }
}

Future<void> login(
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController passwordController,
) async {
  if (formKey.currentState!.validate()) {
    try {
      isloading.value = true;

      // Login
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Step 2: Fetch fee data from Firestore
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final docSnapshot = await FirebaseFirestore.instance
          .collection('userdata')
          .doc(uid)
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        print("📥 totalFee from map: ${data['totalFee']}");
        print("📥 pendingFee from map: ${data['pendingFee']}");
        print("📥 submittedFee from map: ${data['submittedFee']}");

        // ✅ OPTIONAL: Agar aap UI mein show karna chahein to ek controller bna ke in values ko wahan save kar sakte hain
      }

      // Step 3: Navigate to home screen
      Get.offAllNamed('/bottombar');
    } catch (e) {
      SnackbarUtil.showError(e.toString());
    } finally {
      isloading.value = false;
    }
  }
}


  
  Future forget(GlobalKey<FormState> _formKey, TextEditingController emailController) async {
    if (_formKey.currentState!.validate()) {
      try {
        isloading.value = true;

        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
          
        SnackbarUtil.showSuccess('Reset link sent to your email');
        Get.toNamed('/login');
      } catch (e) {
        SnackbarUtil.showError(e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }

  /// Logout
  Future logOut() async {
    try {
      isloading.value = true;
      LoadingUtil.showLoadingDialog();

      await FirebaseAuth.instance.signOut();

      // Clear GetStorage
      box.erase();

      Get.offAllNamed('/login');
    } catch (e) {
      SnackbarUtil.showError(e.toString());
    } finally {
      LoadingUtil.hideLoadingDialog();
      isloading.value = false;
    }
  }
}
