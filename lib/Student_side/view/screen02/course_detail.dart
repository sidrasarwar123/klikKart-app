import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/Student_side/controller/enroll_controller.dart';
import 'package:klik_kart/Student_side/models/student_model.dart.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';


class StudentEnrollcoursedetail extends StatefulWidget {
  const StudentEnrollcoursedetail({super.key});

  @override
  State<StudentEnrollcoursedetail> createState() => _StudentEnrollcoursedetailState();
}

class _StudentEnrollcoursedetailState extends State<StudentEnrollcoursedetail> {
   final EnrollmentController controller = Get.put(EnrollmentController());
late CourseProgress course;

@override
void initState() {
  super.initState();

  if (Get.arguments != null && Get.arguments is CourseProgress) {
    course = Get.arguments as CourseProgress;
  } else {
    print(" Get.arguments is null or not CourseProgress");
  }
}

    int selectedIndex = 0;
     final List<String> tabs = ['Ongoing', 'Completed',];
  @override
  Widget build(BuildContext context) {
       controller.fetchEnrollment('A123');
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Course Detail"),
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
      body:  
            Padding(
                padding: EdgeInsets.only(top: screenHeight*0.02,left: screenWidth*0.03),
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
                                        horizontal:screenWidth*0.15, vertical: screenWidth*0.03),
                                    decoration: BoxDecoration(
                                      color: isSelected ? Colors.blue : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected ? Colors.blue:Colors.white
                                      
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
                        Padding(
  padding:  EdgeInsets.all(16),
  child: () {
     if (selectedIndex == 0) {
      return
       
       Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.7),
              ), Center(child: Image.network(course.image),
             ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.01, right: screenWidth * 0.3),
              child: Text(
                "Introudction to Figma",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Row(
                children: [
                 Text(course.title,

                    style: TextStyle(color: AppColors.buttoncolor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.1),
                    child:  Row(
                      children: [
                        Text(
                        "4.5",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                      ],
                    ),
                 
                  )
                ],
              ),
            ),
             Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.04,right: screenWidth*0.5),
              child: Container(
                height:screenHeight*0.06, 
                width: screenWidth*0.5,
                decoration: BoxDecoration(color:AppColors.buttoncolor,
                borderRadius: BorderRadius.circular(20)
                ),child: Center(child: Text("Course Duration",style: TextStyle(color: AppColors.textcolor,fontWeight: FontWeight.bold),
                )
                ),
              ),
            ),SizedBox(height: screenHeight*0.02,),
            Obx(() {
      final enrollment = controller.enrollment.value;

      if (enrollment == null) {
        return Center(child: CircularProgressIndicator());
      }

      // Format DateTime to string
      String formatDate(DateTime date) => "${date.day}-${date.month}-${date.year}";
      String formatTime(DateTime date) =>
          "${date.hour}:${date.minute.toString().padLeft(2, '0')} ${date.hour > 12 ? 'pm' : 'am'}";

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Icon(Icons.circle, size: 11, color: AppColors.buttoncolor),
                Text(" Total Months: ${enrollment.totalMonths} Months "),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02, top: screenHeight * 0.02),
              child: Row(
                children: [
                  Text("From Date and Time", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(width: screenWidth * 0.3),
                  Icon(Icons.punch_clock, size: 30, color: AppColors.buttoncolor),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: Row(
                children: [
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.textcolor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromARGB(255, 241, 228, 228)),
                    ),
                    child: Center(
                      child: Text(
                        formatDate(enrollment.fromDate),
                        style: TextStyle(color: AppColors.buttoncolor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.textcolor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromARGB(255, 241, 228, 228)),
                    ),
                    child: Center(
                      child: Text(
                        formatTime(enrollment.fromDate),
                        style: TextStyle(color: AppColors.buttoncolor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02, top: screenHeight * 0.02),
              child: Row(
                children: [
                  Text("To Date and Time", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(width: screenWidth * 0.3),
                  Icon(Icons.punch_clock, size: 30, color: AppColors.buttoncolor),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: Row(
                children: [
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.textcolor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromARGB(255, 241, 228, 228)),
                    ),
                    child: Center(
                      child: Text(
                        formatDate(enrollment.toDate),
                        style: TextStyle(color: AppColors.buttoncolor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.textcolor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromARGB(255, 241, 228, 228)),
                    ),
                    child: Center(
                      child: Text(
                        formatTime(enrollment.toDate),
                        style: TextStyle(color: AppColors.buttoncolor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
            }
                   ),
                   


          
           
          ]
       );
    }  else {
 return   Padding(
           padding:  EdgeInsets.only(top: screenHeight*0.04),
           child: Column(
             children: [
               SingleChildScrollView(scrollDirection: Axis.horizontal,
                 child: Padding(
                   padding:  EdgeInsets.only(),
                   child: Row(
                     children: [
                     Container(
                        
                             width: screenWidth*0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,border: Border.all(color:  Color.fromARGB(255, 174, 226, 250))
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius:  BorderRadius.vertical(top: Radius.circular(16)),
                                    child:
                                    SizedBox(
  height: 73, 
  width: double.infinity, 
  child: Image.network(
    course.image,
    fit: BoxFit.cover,
  ),
)
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(1),
                                    child: Column(
                                      children: [
                                         Divider(thickness: 1,color: AppColors.buttoncolor,),
                                        Text(course.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: AppColors.buttoncolor)),
                                        Divider(thickness: 1,color: AppColors.buttoncolor,),
                                      
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
                                           Text(course.progress.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                         Text(course.status, style: TextStyle(color: AppColors.buttoncolor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),SizedBox(width: screenWidth*0.06,),
                              Container(
                            //  height: screenHeight*0.3,
                             width: screenWidth*0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,border: Border.all(color:  Color.fromARGB(255, 174, 226, 250))
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius:  BorderRadius.vertical(top: Radius.circular(16)),
                                    child: 
                                    Image.network(course.imageUrl)
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(1),
                                    child: Column(
                                      children: [
                                         Divider(thickness: 1,color: AppColors.buttoncolor,),
                                        Text(course.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: AppColors.buttoncolor)),
                                        Divider(thickness: 1,color: AppColors.buttoncolor,),
                                      
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
                                           Text(course.progress.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                         Text(course.status, style: TextStyle(color: AppColors.buttoncolor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                       ]
                       ),
                 ),
                 ),Padding(
                   padding:  EdgeInsets.only(top: screenHeight*0.03,),
                   child: Row(
                    children: [
                    
                                Container(
                        
                               width: screenWidth*0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,border: Border.all(color:  Color.fromARGB(255, 174, 226, 250))
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius:  BorderRadius.vertical(top: Radius.circular(16)),
                                      child:
                                      Image.network(course.imageUrl)
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(1),
                                      child: Column(
                                        children: [
                                           Divider(thickness: 1,color: AppColors.buttoncolor,),
                                          Text(course.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: AppColors.buttoncolor)),
                                          Divider(thickness: 1,color: AppColors.buttoncolor,),
                                        
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
                                             Text(course.progress.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                           Text(course.status, style: TextStyle(color: AppColors.buttoncolor)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),SizedBox(width: screenWidth*0.06,),
                                Container(
                              
                               width: screenWidth*0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,border: Border.all(color:  Color.fromARGB(255, 174, 226, 250))
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius:  BorderRadius.vertical(top: Radius.circular(16)),
                                      child:
                                                                       SizedBox(
  height: 73, 
  width: double.infinity, 
  child: Image.network(
    course.image,
    fit: BoxFit.cover,
  ),
)
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(1),
                                      child: Column(
                                        children: [
                                           Divider(thickness: 1,color: AppColors.buttoncolor,),
                                          Text(course.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: AppColors.buttoncolor)),
                                          Divider(thickness: 1,color: AppColors.buttoncolor,),
                                        
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
                                             Text(course.progress.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                           Text(course.status, style: TextStyle(color: AppColors.buttoncolor)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                    ],
                   ),
                 )
                 ]
                     )
                     );
    
    }
  }(),
),

                      
                    ]
                  ),
                ),
              ),
              
          
    );
  }
}