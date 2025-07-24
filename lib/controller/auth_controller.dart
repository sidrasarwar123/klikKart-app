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

      String userId = userCred.user!.uid;

      // 🔐 Save user info in Firestore
      await FirebaseFirestore.instance.collection('userdata').doc(userId).set({
        'uid': userId,
        'email': emailController.text.trim(),
        'name': usernameController.text.trim(),
        'isTeacher': isTeacher,
      });

      SnackbarUtil.showSuccess('Account created successfully');

      // 👨‍🏫 For teachers, navigate directly
      if (isTeacher) {
        Get.offAllNamed('/bottombarscreen'); // Home for Teacher
      } else {
        final reservationRef = FirebaseFirestore.instance.collection('reservations').doc(userId);

        // 👇 Only create if not already exists
        final snapshot = await reservationRef.get();
        if (!snapshot.exists) {
          await reservationRef.set({
            'name': usernameController.text.trim(),
            'email': emailController.text.trim(),
            'submittedAt': FieldValue.serverTimestamp(),
            'isApproved': false, // 👈 initially false
          });
        }

        // ✅ Check if already approved
        final updatedSnapshot = await reservationRef.get();
        bool isApproved = updatedSnapshot['isApproved'] == true;

        // ✅ Navigate with isApproved argument
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

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
//        

      Get.offAllNamed('/bottombar');

   isloading.value = false;
      } catch (e) {
        SnackbarUtil.showError(e.toString());
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
