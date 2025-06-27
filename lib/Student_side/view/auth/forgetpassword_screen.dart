import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

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
              padding: EdgeInsets.only(top: screenHeight * 0.15),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(AppImages.passwordicon),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: screenHeight*0.03),
                    child: Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,color: AppColors.buttoncolor
                      ),
                    ),
                  ),
                  
                      
                  
                   Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: screenHeight*0.03,top:screenHeight*0.03, ),
                          child: Text(
                            "Enter your Email associated with your account we will send you a link to resetyour password",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                  
                        Padding(
                          padding:  EdgeInsets.only(top:screenHeight*0.06 ),
                          child: Column(
                            children: [
                              CustomTextField(hintText: "Email", prefixIcon: AppIcons.emailicon),
                            ],
                          ),
                        ),
                     
                  Padding(
                    padding:  EdgeInsets.only(top: screenHeight*0.070,),
                    child: CustomButton(text: "continous", onPressed: (){
                       
                    }
                                  ),
                  ),
                      ],
                    ),
                

                ]
              )
            )
          )
                ]
          )
      )


    );
  }
}