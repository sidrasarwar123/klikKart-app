import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                    child: CustomTextField(
                        hintText: "User name", prefixIcon: AppIcons.profileicon),
                  ),
                  CustomTextField(hintText: "Email", prefixIcon: AppIcons.emailicon,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    prefixIcon: AppIcons.passwordicon,
                    isPassword: true,
                  ),
                    SizedBox(
                    height: screenHeight * 0.070,
                  ),
                  CustomButton(text: "Sign Up", onPressed: (){
                    Get.toNamed('/login');
                  }
              ),
              Column(
                children: [
                  SizedBox(height: screenHeight * 0.2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(" Have an account?"),
                      TextButton(onPressed: (){
                        Get.offNamed('/login');
                      }, child: 
                       Text("Sign In",style: TextStyle(color: AppColors.buttoncolor,fontWeight: FontWeight.bold),)
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
        )
    );
  }
}