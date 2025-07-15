import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/controller/auth_controller.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final _formKay = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
     final TextEditingController passwordController = TextEditingController();
   
     final AuthController authController=Get.put(AuthController());
    

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
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
                    "Sign in to your account",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.090,
                  ),
                  SingleChildScrollView(scrollDirection: Axis.vertical,
                    child: Form(key: _formKay,
                      child: Column(
                           children: [
                          CustomTextField(
                            textEditingController: emailController, hintText: "Email",
                            prefixIcon: AppIcons.profileicon,
                            validate: (value){
                              if (value==''||value==null) {
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
                      validate: (value){
                        if (value == '' || value == null) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be 6 char long';
                            }
                            return null;
                      },
                                        ),
                        ],
                      ),
                    )
                    
                   ),
                 
                  Padding(
                    padding: EdgeInsets.only(left: 150),
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed('/forgetpassword');
                        },
                        child: Text(
                          "Forgot your password ?",
                          style: TextStyle(color: AppColors.buttoncolor),
                        )),
                  ), SizedBox(
                    height: screenHeight * 0.070,
                  ),
                Obx(() => CustomButton(
  text: "Sign in",
  isloading: authController.isloading.value, 
  onPressed: () async {
   await authController.login(_formKay, emailController, passwordController);
  },
)),


              Column(
                children: [
                  SizedBox(height: screenHeight * 0.2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Don’t have an account?"),
                     TextButton(onPressed: (){
                Get.offNamed('/signup');
                }, child: 
                       Text("Sign Up",style: TextStyle(color: AppColors.buttoncolor,fontWeight: FontWeight.bold),)
                   ) ],),
                  )
                ],
              )
          
                ],
              ),
            ),
          ),
                ],
              ),
        ));
  }
}