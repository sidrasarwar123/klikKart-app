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
  final _formKay = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ProfileController profileController = Get.put(ProfileController());


  bool isTeacher = false; // Default Student

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.10),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(AppImages.icon2image),
                    ),
                    Text(
                      "Sign up for a new account",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.090),
                    Form(
                      key: _formKay,
                      child: Column(
                        children: [
                          CustomTextField(
                            textEditingController: usernameController,
                            hintText: "User name",
                            prefixIcon: AppIcons.profileicon,
                            validate: (value) {
                              if (value == '' || value == null) {
                                return "Please enter username";
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            textEditingController: emailController,
                            hintText: "Email",
                            prefixIcon: AppIcons.emailicon,
                            validate: (value) {
                              if (value == '' || value == null) {
                                return "Please enter email";
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            textEditingController: passwordController,
                            hintText: "Password",
                            prefixIcon: AppIcons.passwordicon,
                            isPassword: true,
                            validate: (value) {
                              if (value == '' || value == null) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be 6 characters long';
                              }
                              return null;
                            },
                          ),

                          // 👇 Radio Buttons
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("I'm a: "),
                                Radio(
                                  value: true,
                                  groupValue: isTeacher,
                                  onChanged: (val) {
                                    setState(() {
                                      isTeacher = val!;
                                    });
                                  },
                                ),
                                Text("Teacher"),
                                Radio(
                                  value: false,
                                  groupValue: isTeacher,
                                  onChanged: (val) {
                                    setState(() {
                                      isTeacher = val!;
                                    });
                                  },
                                ),
                                Text("Student"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.050),
                    Obx(
                      () => CustomButton(
                        text: "Sign Up",
                        isloading: authController.isloading.value,
                        onPressed: () async {
                          await authController.signUp(
                            _formKay,
                            usernameController,
                            emailController,
                            passwordController,
                            isTeacher,
                          );
                         if (FirebaseAuth.instance.currentUser != null) {
        profileController.addNotificationAndShow(
          title: "Welcome!",
          description: "Your account has been created successfully.",
          icon: "person_add",
          color: "#4CAF50", // Green
        );
                         }
                        },
                      )
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Have an account?"),
                              TextButton(
                                onPressed: () {
                                  Get.offNamed('/login');
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: AppColors.buttoncolor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
