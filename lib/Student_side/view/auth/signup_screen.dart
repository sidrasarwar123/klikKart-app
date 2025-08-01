import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/controller/auth_controller.dart';
import 'package:klik_kart/controller/profile_controller.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ProfileController profileController = Get.put(ProfileController());
  final AuthController authController = Get.put(AuthController());

  bool isTeacher = false; // default: student

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.10),
            Image.asset(AppImages.icon2image),
            const Text(
              "Sign up for a new account",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHeight * 0.05),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    textEditingController: usernameController,
                    hintText: "User name",
                    prefixIcon: AppIcons.profileicon,
                    validate: (value) =>
                        value == '' ? "Please enter username" : null,
                  ),
                  CustomTextField(
                    textEditingController: emailController,
                    hintText: "Email",
                    prefixIcon: AppIcons.emailicon,
                    validate: (value) =>
                        value == '' ? "Please enter email" : null,
                  ),
                  CustomTextField(
                    textEditingController: passwordController,
                    hintText: "Password",
                    isPassword: true,
                    prefixIcon: AppIcons.passwordicon,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be 6 characters";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("I'm a: "),
                        Radio(
                          value: true,
                          groupValue: isTeacher,
                          onChanged: (val) {
                            setState(() {
                              isTeacher = val!;
                            });
                          },
                        ),
                        const Text("Teacher"),
                        Radio(
                          value: false,
                          groupValue: isTeacher,
                          onChanged: (val) {
                            setState(() {
                              isTeacher = val!;
                            });
                          },
                        ),
                        const Text("Student"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => CustomButton(
                text: "Sign Up",
                isloading: authController.isloading.value,
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  await authController.signUp(
                    _formKey,
                    usernameController,
                    emailController,
                    passwordController,
                    isTeacher,
                  );

                  final user = FirebaseAuth.instance.currentUser;

                  if (user != null) {
                    final uid = user.uid;

                    // Save user type to Firestore
                    await FirebaseFirestore.instance
                        .collection('userdata')
                        .doc(uid)
                        .set({
                      'name': usernameController.text.trim(),
                      'email': emailController.text.trim(),
                      'isTeacher': isTeacher,
                      'createdAt': FieldValue.serverTimestamp(),
                    });

                    //  Show welcome notification
                    profileController.addNotificationAndShow(
                      title: "Welcome!",
                      description:
                          "Your account has been created successfully.",
                      icon: "person_add",
                      color: "#4CAF50",
                    );

                    if (!isTeacher) {
                      //  Student: Create reservation with isApproved: false
                      await FirebaseFirestore.instance
                          .collection('reservations')
                          .doc(uid)
                          .set({
                        'name': usernameController.text.trim(),
                        'email': emailController.text.trim(),
                        'submittedAt': FieldValue.serverTimestamp(),
                        'isApproved': false,
                      });

                      //  Fetch approval status safely
                      final doc = await FirebaseFirestore.instance
                          .collection('reservations')
                          .doc(uid)
                          .get();
                      final data = doc.data();
                      final isApproved = data?['isApproved'] == true;

                      //  Student screen with approval check
                      Get.offAllNamed('/bottombar',
                          arguments: {'isApproved': isApproved});
                    } else {
                      //  Teacher screen
                      Get.offAllNamed('/bottombarscreen');
                    }
                  }
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have an account?"),
                TextButton(
                  onPressed: () => Get.offNamed('/login'),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: AppColors.buttoncolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
