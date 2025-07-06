import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';

class StudentAssigment extends StatelessWidget {
  const StudentAssigment({super.key});

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Assigments"),
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
         padding: EdgeInsets.only(left: screenWidth*0.03,top: screenHeight*0.03),
         child: Column(
            children: [
            Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.6),
              child: Text("2 October 2024"),
            ),
                       
          Padding(
            padding:  EdgeInsets.only(top: screenHeight*0.01),
            child: Container(
              height: screenHeight * 0.15,
           
              decoration: BoxDecoration(
              
                border: Border.all(color: Color.fromARGB(255, 217, 228, 233)),
                borderRadius: BorderRadius.circular(20),
              ), child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Chip(
                            label: Text(
                              "Wireframe & Prototyping",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            backgroundColor: AppColors.buttoncolor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding:  EdgeInsets.only(left: screenWidth*0.01),
                          child: Row(
                            children: [
                              Container(
                                width: 120, 
                                child: Chip(
                    label: Text("Total Marks:100", style: TextStyle(fontSize: 10,color: AppColors.textcolor)),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 7),
                                ),
                              ),SizedBox(width: 2,),
                              Container(
                                width: 120,
                                child: Chip(
                    label: Text("Obtain Marks:100", style: TextStyle(fontSize: 10,color: AppColors.textcolor)),
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),Column(
                    
                      children: [
                        SizedBox(height: screenHeight*0.01,),
                        Text("Date : 01-22-2023", style: TextStyle(fontSize: 10)),
                         SizedBox(height: 8),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            width: screenWidth*0.12,
                                            height: screenHeight*0.06,
                                            child: CircularProgressIndicator(
                                              value: 0.4,
                                              strokeWidth: 6,
                                              backgroundColor: Colors.grey[200],
                                              valueColor:  AlwaysStoppedAnimation<Color>(Colors.blue),
                                            ),
                                          ),
                                         Text("100%", style: TextStyle(fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                       Text("Marks", style: TextStyle(color: AppColors.buttoncolor)),
                      ],
                    )
                  ],
                )
            ),
          ),  Padding(
            padding:  EdgeInsets.only(top: screenHeight*0.01),
            child: Container(
              height: screenHeight * 0.15,
           
              decoration: BoxDecoration(
              
                border: Border.all(color: const Color.fromARGB(255, 217, 228, 233)),
                borderRadius: BorderRadius.circular(20),
              ), child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Chip(
                            label: Text(
                              "Animation & Autolayout",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            backgroundColor: AppColors.buttoncolor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding:  EdgeInsets.only(left: screenWidth*0.01),
                          child: Row(
                            children: [
                              Container(
                                width: 120, 
                                child: Chip(
                    label: Text("Total Marks:100", style: TextStyle(fontSize: 10,color: AppColors.textcolor)),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 7),
                                ),
                              ),SizedBox(width: 2,),
                              Container(
                                width: 120,
                                child: Chip(
                    label: Text("Obtain Marks:100", style: TextStyle(fontSize: 10,color: AppColors.textcolor)),
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),Column(
                    
                      children: [
                        SizedBox(height: screenHeight*0.01,),
                        Text("Date : 01-22-2023", style: TextStyle(fontSize: 10)),
                         SizedBox(height: 8),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            width: screenWidth*0.12,
                                            height: screenHeight*0.06,
                                            child: CircularProgressIndicator(
                                              value: 0.8,
                                              strokeWidth: 6,
                                              backgroundColor: Colors.grey[200],
                                              valueColor:  AlwaysStoppedAnimation<Color>(Colors.blue),
                                            ),
                                          ),
                                         Text("80%", style: TextStyle(fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                       Text("Marks", style: TextStyle(color: AppColors.buttoncolor)),
                      ],
                    )
                  ],
                )
            ),
          ), Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.5,top: screenHeight*0.02),
              child: Text("5 september 2024"),
            ),
                       
          Padding(
            padding:  EdgeInsets.only(top: screenHeight*0.01),
            child: Container(
              height: screenHeight * 0.15,
           
              decoration: BoxDecoration(
              
                border: Border.all(color: const Color.fromARGB(255, 217, 228, 233)),
                borderRadius: BorderRadius.circular(20),
              ), child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Chip(
                            label: Text(
                              "FigJam & UI design",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            backgroundColor: AppColors.buttoncolor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding:  EdgeInsets.only(left: screenWidth*0.01),
                          child: Row(
                            children: [
                              Container(
                                width: 120, 
                                child: Chip(
                    label: Text("Total Marks:100", style: TextStyle(fontSize: 10,color: AppColors.textcolor)),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 7),
                                ),
                              ),SizedBox(width: 2,),
                              Container(
                                width: 120,
                                child: Chip(
                    label: Text("Obtain Marks:100", style: TextStyle(fontSize: 10,color: AppColors.textcolor)),
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),Column(
                    
                      children: [
                        SizedBox(height: screenHeight*0.01,),
                        Text("Date : 01-22-2023", style: TextStyle(fontSize: 10)),
                         SizedBox(height: 8),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            width: screenWidth*0.12,
                                            height: screenHeight*0.06,
                                            child: CircularProgressIndicator(
                                              value: 0.8,
                                              strokeWidth: 6,
                                              backgroundColor: Colors.grey[200],
                                              valueColor:  AlwaysStoppedAnimation<Color>(Colors.blue),
                                            ),
                                          ),
                                         Text("80%", style: TextStyle(fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                       Text("Marks", style: TextStyle(color: AppColors.buttoncolor)),
                      ],
                    )
                  ],
                )
            ),
          ),  Padding(
            padding:  EdgeInsets.only(top: screenHeight*0.01),
            child: Container(
              height: screenHeight * 0.15,
           
              decoration: BoxDecoration(
              
                border: Border.all(color: const Color.fromARGB(255, 217, 228, 233)),
                borderRadius: BorderRadius.circular(20),
              ), child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Chip(
                            label: Text(
                              "Animation & Autolayout",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            backgroundColor: AppColors.buttoncolor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding:  EdgeInsets.only(left: screenWidth*0.01),
                          child: Row(
                            children: [
                              Container(
                                width: 120, 
                                child: Chip(
                    label: Text("Total Marks:100", style: TextStyle(fontSize: 10,color: AppColors.textcolor)),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 7),
                                ),
                              ),SizedBox(width: 2,),
                              Container(
                                width: 120,
                                child: Chip(
                    label: Text("Obtain Marks:100", style: TextStyle(fontSize: 10,color: AppColors.textcolor)),
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),Column(
                    
                      children: [
                        SizedBox(height: screenHeight*0.01,),
                        Text("Date : 01-22-2023", style: TextStyle(fontSize: 10)),
                         SizedBox(height: 8),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            width: screenWidth*0.12,
                                            height: screenHeight*0.06,
                                            child: CircularProgressIndicator(
                                              value: 0.8,
                                              strokeWidth: 6,
                                              backgroundColor: Colors.grey[200],
                                              valueColor:  AlwaysStoppedAnimation<Color>(Colors.blue),
                                            ),
                                          ),
                                         Text("80%", style: TextStyle(fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                       Text("Marks", style: TextStyle(color: AppColors.buttoncolor)),
                      ],
                    )
                  ],
                )
            ),
          )
  
             
            ]
         ),
         
       ),
   
        ]
      
        
      ),
         floatingActionButton: FloatingActionButton(
    onPressed: () {
    Get.toNamed("/student02assigment");
    },
    backgroundColor: AppColors.buttoncolor,
    child: Icon(Icons.add, color: Colors.white), shape: CircleBorder(),
    tooltip: "Add Assignment",
  ),


       
  
    );
  }
}