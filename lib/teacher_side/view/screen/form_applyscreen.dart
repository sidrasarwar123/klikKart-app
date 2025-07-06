import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';

class FormApplyscreen  extends StatefulWidget {
  const FormApplyscreen ({super.key});

  @override
  State<FormApplyscreen> createState() => _FormApplyscreenState();
}

class _FormApplyscreenState extends State<FormApplyscreen> {
   String selectedClass = "A12 G";
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child:  Text("Time Table"),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            AppIcons.arrowicon,
            color: AppColors.buttoncolor,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.04),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text("Select your Class", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.06, top: screenHeight * 0.01),
                child: Container(
                  width: screenWidth * 0.85,
                  padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color.fromARGB(255, 245, 240, 240)),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
  isExpanded: true,
  underline:  SizedBox(),
  value: selectedClass,
  items: ["A12 G", "A11 G",]
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
           
            ),
          ))
      .toList(),
  onChanged: (value) {
    setState(() {
      selectedClass = value!;
    });
  },
),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
Container(
  height: screenHeight * 0.15,
  width: screenWidth * 0.96,
  decoration: BoxDecoration(
    color: Color(0xffe3f2fd),
    border: Border.all(color: Colors.lightBlueAccent),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Center(
    child: Container(
      height: screenHeight * 0.12,
      width: screenWidth * 0.92,   
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding:  EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
           height: screenHeight * 0.06,
            width: screenHeight * 0.08,
            child: Image.asset(
              AppImages.UIimage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: screenWidth * 0.01),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text("UI/UX Designing", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightBlue)),
                  SizedBox(height: screenHeight*0.01,),
                  Text("6:00 e-clock", style: TextStyle(fontWeight: FontWeight.bold,)),
                 
                ],
              ),
               Padding(
                 padding:  EdgeInsets.only(),
                 child: Column(
                   children: [
                     Text("Mentor", style: TextStyle(color: Colors.blue)),
                      Container(
                height: 36,
                width: 122,
                decoration: BoxDecoration(
                  color: AppColors.buttoncolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImages.course1image),
                      radius: 12,
                    ),
                    SizedBox(width: 6),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "M.Hanzla",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "UI/UX Designer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        )
                               ],
                            ),
                          
                          
                        ],
                      ),
                  
                  ),
                 
                   ],
                 ),
               ),
                
            ],
          ),
        ],
      ),
    ),
  ),
),
SizedBox(height: screenHeight * 0.03),
Container(
  height: screenHeight * 0.15,
  width: screenWidth * 0.96,
  decoration: BoxDecoration(
    color: Color(0xffe3f2fd),
    border: Border.all(color: Colors.lightBlueAccent),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Center(
    child: Container(
      height: screenHeight * 0.12,
      width: screenWidth * 0.92,   
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding:  EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
           height: screenHeight * 0.06,
            width: screenHeight * 0.08,
            child: Image.asset(
              AppImages.UIimage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: screenWidth * 0.01),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text("UI/UX Designing", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightBlue)),
                  SizedBox(height: screenHeight*0.01,),
                  Text("6:00 e-clock", style: TextStyle(fontWeight: FontWeight.bold,)),
                 
                ],
              ),
               Padding(
                 padding:  EdgeInsets.only(),
                 child: Column(
                   children: [
                     Text("Mentor", style: TextStyle(color: Colors.blue)),
                      Container(
                height: 36,
                width: 122,
                decoration: BoxDecoration(
                  color: AppColors.buttoncolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImages.course1image),
                      radius: 12,
                    ),
                    SizedBox(width: 6),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "M.Hanzla",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "UI/UX Designer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        )
                               ],
                            ),
                          
                          
                        ],
                      ),
                  
                  ),
                 
                   ],
                 ),
               ),
                
            ],
          ),
        ],
      ),
    ),
  ),
),




              ]
        )))

    );
  }
}