import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/controller/student_controller.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';


class AssigmentScreen extends StatefulWidget {
  const AssigmentScreen({super.key});

  @override
  State<AssigmentScreen> createState() => _AssigmentScreenState();
}

class _AssigmentScreenState extends State<AssigmentScreen> {
    final StudentDashboardController studentDashboardController=Get.put(StudentDashboardController());
      @override
void initState() {
  super.initState();
  studentDashboardController.fetchStudentData();

}

   int selectedIndex = 0;
     final List<String> tabs = ['Submitted', 'Not Submitted',];
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
      body: Padding(
                padding: EdgeInsets.only(top: screenHeight*0.02,),
                child: SizedBox(
                  child: Column(
                    children: [
                      Container(
                        
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 241, 235, 235)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(tabs.length, (index) {
                              bool isSelected = index == selectedIndex;
                              return Padding(
                                padding: EdgeInsets.symmetric(),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:screenWidth*0.12, vertical: screenWidth*0.03),
                                    decoration: BoxDecoration(
                                      color: isSelected ? Colors.green : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected ? Colors.green:Colors.white
                                      
                                      ),
                                    ),
                                    child: Text(
                                      tabs[index],
                                      style: TextStyle(
                                        color:
                                            isSelected ? Colors.white : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
      () {
     if (selectedIndex == 0) {
      return
       
       Column(
         children: [
           Padding(
             padding: EdgeInsets.only(left: screenWidth*0.03,top: screenHeight*0.03),
             child: Obx((){
            final student = studentDashboardController.studentData.value;
           
             if (student == null) {
               return Text("Loading...");
             }
           
             if (student.assignments.isEmpty) {
               return Text("No assignments found.");
             }
             return Column(
               children: student.assignments.map((a) {
                 return Container(
            height: screenHeight * 0.15,
            width: screenWidth * 0.96,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                // Left section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(
                        a.title,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      backgroundColor: AppColors.buttoncolor,
                    ),
                    SizedBox(height: screenHeight*0.02),
                    Row(
                      children: [
                        Chip(
                          label: Text("Total Marks: ${a.totalMarks}", style: TextStyle(fontSize: 10)),
                          backgroundColor: Colors.green[100],
                        ),
                        SizedBox(width: screenWidth*0.02),
                        Chip(
                          label: Text("Obtain Marks: ${a.obtainedMarks}", style: TextStyle(fontSize: 10)),
                          backgroundColor: Colors.orange[100],
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                // Right section
                Column(
                  children: [
                    SizedBox(height: screenHeight*0.02),
                    Text("Date: ${a.date}", style: TextStyle(fontSize: 10)),
                    SizedBox(height: 8),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                  width: screenWidth * 0.14,
                  height: screenHeight * 0.06,
                  child: CircularProgressIndicator(
                    value: a.progress / 100,
                    strokeWidth: 6,
                    backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                Text("${a.progress.toInt()}%",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
                    SizedBox(height: screenHeight*0.01),
                    Text("Marks", style: TextStyle(color: AppColors.buttoncolor)),
                  ],
                ),
              
              ],
            ),
                 );
                 
               }
               ).toList(),
             );
             }
              
               
             ),
 
           ),
           
         ],
       );
      
       
    }  else {
 return    Padding(
         padding: EdgeInsets.only(left: screenWidth*0.03,top: screenHeight*0.03),
         child: Column(
            children: [
            Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.6),
              child: Text("3 October 2024"),
            ),   SizedBox(height:screenHeight*0.02 ,),
                       
          Obx((){
              final student = studentDashboardController.studentData.value;
           
             if (student == null) {
               return Text("Loading...");
             }
           
             if (student.assignments.isEmpty) {
               return Text("No assignments found.");
             }
             return   Column(
               children: student.assignments.map((a) {
             
                 return Container(
            height: screenHeight * 0.15,
            width: screenWidth * 0.96,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                // Left section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(
                        a.title,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      backgroundColor: AppColors.buttoncolor,
                    ),
                    SizedBox(height: screenHeight*0.02),
                    Row(
                      children: [
                        Chip(
                          label: Text("Total Marks: ${a.totalMarks}", style: TextStyle(fontSize: 10)),
                          backgroundColor: Colors.green[100],
                        ),
                        SizedBox(width: screenHeight*0.02),
                        Chip(
                          label: Text("Obtain Marks: ${a.obtainedMarks}", style: TextStyle(fontSize: 10)),
                          backgroundColor: Colors.orange[100],
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
      
                Column(
                  children: [
                    SizedBox(height: screenHeight*0.02),
                    Text("Date: ${a.date}", style: TextStyle(fontSize: 10)),
                    SizedBox(height: screenHeight*0.01),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                         SizedBox(
                                            width: screenWidth*0.12,
                                            height: screenHeight*0.06,
                                            child: CircularProgressIndicator(
                                              value: 0,
                                              strokeWidth: 6,
                                              backgroundColor: Colors.grey[200],
                                              valueColor:  AlwaysStoppedAnimation<Color>(Colors.blue),
                                            ),
                                          ),
                                         Icon(Icons.lock_clock,color: Colors.orange,)
              ],
            ),
                    SizedBox(height: screenHeight*0.01),
                    Text("Marks", style: TextStyle(color: AppColors.buttoncolor)),
                  ],
                ),
              ],
            ),
                 );
               }).toList(),
             ); 
          }
           
          ),  
            ]
         )
 );
    
    }
  }(),

                      
                    ]
                  ),
                ),
              ),

        
    
    );
  }
}