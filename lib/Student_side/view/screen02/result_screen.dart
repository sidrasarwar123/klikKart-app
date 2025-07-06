import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
         
              // Top container with background
             // Top container with background + "Final Marks" floating
Stack(
  clipBehavior: Clip.none,
  children: [
    Container(
      height: screenHeight * 0.32,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.buttoncolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.05,
              left: screenWidth * 0.03,
              right: screenWidth * 0.03,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.05),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      AppIcons.arrowicon,
                      color: AppColors.textcolor,
                      size: 36,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Result",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    ),

    
    Positioned(
      bottom: -25, 
      left: screenWidth * 0.20,
      right: screenWidth * 0.20,
      child: Container(
        padding: EdgeInsets.symmetric(vertical:screenHeight*0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          "Final Marks",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ],
),


            
Stack(
  clipBehavior: Clip.none,
  alignment: Alignment.topCenter,
  children: [
    Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: screenHeight * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Progress", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Obtain", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
             Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Assignment"),
                Text("15%     "),
                Text("20%"),
              ],
            ),
             SizedBox(height: 6),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sentinal"),
                Text("15%"),
                Text("20%"),
              ],
            ),
             SizedBox(height: 6),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Final term"),
                Text("50%   "),
                Text("60%"),
              ],
            ),
             SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("Grade"),
                     Text("B+", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                   
                  ],
                ),
                Column(
                  children: const [
                    Text("Percentage"),
                    Text("80%", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                
              ],
            ), Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.1),
              child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical:screenHeight*0.01),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Passed", style: TextStyle(color: Colors.white)),
                      ),
            )
          ],
        ),
      ),
    ),

    
   
  ],
),
        ]
      )
    ),


      
      
      
    
  );
}

  }
