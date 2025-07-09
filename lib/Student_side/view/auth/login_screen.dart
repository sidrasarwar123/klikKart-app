import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
    final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  CustomTextField(
                    hintText: "Password",
                    prefixIcon: AppIcons.passwordicon,
                    isPassword: true,
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
                  CustomButton(text: "Sign in", onPressed: (){
                    Get.offNamed('/bottombar');
                  }
              ),
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
