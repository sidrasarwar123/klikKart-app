import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';
   final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
       appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Reservation Form"),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              AppIcons.arrowicon,
              color: AppColors.buttoncolor,
              size: 30,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(left: screenWidth*0.06,top: screenHeight*0.02),
            child: Text("Please Fill this form to complete your booking.",style: TextStyle(fontSize: 15),),
           ),
           Padding(
              padding:EdgeInsets.only(right: screenWidth*0.7,),
             child: Text("*required",style: TextStyle(color: Colors.red),),
           ),
           Padding(
          padding:EdgeInsets.only(right: screenWidth*0.6,top:screenHeight*0.03),
             child: Text("Personal Data",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
           ),
        CustomTextField(hintText: "Name", prefixIcon:AppIcons.profileicon),
        CustomTextField(hintText: "Number",),
        CustomTextField(hintText: "Address"),
          


          CustomButton(text: "Next", onPressed: (){})
        
        ],
      ),
      
    );
  }

  
  }

 