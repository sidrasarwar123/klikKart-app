
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/controller/event_controller.dart';
import 'package:klik_kart/Student_side/widgets/event_widget.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/controller/profile_controller.dart';
import 'package:klik_kart/teacher_side/controller/teacherDashboard_controller.dart.dart';
import 'package:klik_kart/teacher_side/models/teacher_Dashboard.dart.dart';

import 'package:klik_kart/teacher_side/widgets/card_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class homescreen03 extends StatefulWidget {
  const homescreen03({super.key});

  @override
  State<homescreen03> createState() => _homescreen03State();
}

class _homescreen03State extends State<homescreen03> {
    final EventController eventController = Get.put(EventController());
     final ProfileController profileController = Get.find<ProfileController>();
     final TeacherDashboardController teacherDashboardController = Get.put(TeacherDashboardController());

   final PageController attendanceController = PageController();
final PageController assignmentController = PageController();

int _currentAttendancePage = 0;
int _currentAssignmentPage = 0;

@override
void initState() {
  super.initState();

  print("initState called");

  try {
    eventController.fetchEvents();
    print("eventController.fetchEvents() called");

      teacherDashboardController.fetchDashboardData();
    print("TeacherDashboardController initialized");

    teacherDashboardController.fetchDashboardData();
    print("fetchDashboardData called");
  } catch (e) {
    print("Error during initState: $e");
  }


  attendanceController.addListener(() {
    final page = attendanceController.page;
    if (page != null) {
      setState(() {
        _currentAttendancePage = page.round();
      });
    }
  });

  assignmentController.addListener(() {
    final page = assignmentController.page;
    if (page != null) {
      setState(() {
        _currentAssignmentPage = page.round();
      });
    }
  });
}

@override
void dispose() {
  attendanceController.dispose();
  assignmentController.dispose();
  super.dispose();
}

  List<List<teacherDashboardControllerModel>> getAttendancePages(List<teacherDashboardControllerModel> data) {
  List<List<teacherDashboardControllerModel>> result = [];
  for (int i = 0; i < data.length; i += 2) {
    result.add(data.sublist(i, i + 2 > data.length ? data.length : i + 2));
  }
  return result;
}
    final bool hasUnreadNotifications = true;
      
       
@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
      
          Container(
            height: screenHeight * 0.25,
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
                      top: screenHeight * 0.070, right: screenWidth * 0.06),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed('/notification');
                          },
                          icon: Icon(
                            AppIcons.Notificationicon,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        if (hasUnreadNotifications)
                          Positioned(
                            top: 10,
                            right: 14,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                   Obx(() {
  final user = profileController.userModel.value;
    print("Image URL: ${user?.imageUrl}"); 

  ImageProvider profileImage;

  if (user?.imageUrl != null && user!.imageUrl!.isNotEmpty) {
    profileImage = NetworkImage(user.imageUrl!);
  } else {
    profileImage = AssetImage(AppImages.teacherimage);
  }

  return Padding(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.03),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/profilescreen');
          },
          child: CircleAvatar(
            backgroundImage: profileImage,
            radius: 40,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '${user?.name ?? ''}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ],
    ),
  );
}),
                 
                ],
              ),
            ),
    
          Padding(
            padding:  EdgeInsets.all(12.0),
            child: Row(
              children: [
  
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                  
                        Container(
                          height: screenHeight*0.05,
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child:  Center(
                            child: Icon(Icons.person, color: Colors.blue),
                          ),
                        ),
                         SizedBox(height: screenHeight*0.02),
                         Text("Classes",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                     Text("2",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                     SizedBox(height: screenHeight*0.02),
                      ],
                    ),
                  ),
                ),

               SizedBox(width: screenWidth*0.02),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255, 55, 206, 191),
                      borderRadius: BorderRadius.circular(15),
                    ),
                   child: Column(
                      children: [
                        Container(
                          height: screenHeight*0.05,
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child:  Center(
                            child: Icon(Icons.groups, color:  Color.fromARGB(255, 55, 206, 191),),
                          ),
                        ),
                         SizedBox(height: screenHeight*0.02),
                         Text("Students",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                     Text("25",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                     SizedBox(height: screenHeight*0.02),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight*0.02,),

 Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Attendance', style: TextStyle(fontSize: 18, )),
                ),
              ),SizedBox(height: screenHeight*0.01,),
          
      
   Column(
            children: [
              GestureDetector(onTap:() {
               Get.toNamed('/attendencescreen');
              },
      
                child: Container
                (
                  height: screenHeight*0.4,
                  width: screenWidth*0.9,
                  decoration: BoxDecoration(color: Colors.white
                  ,  borderRadius: BorderRadius.circular(12),
                  
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4),]
                  ),
                  child:     Column(
                    children: [
                      Container(
                      height: screenHeight*0.06,
                      decoration:  BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1686E0), Color(0xFF0F2C63)],
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.1),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(width: screenWidth*0.1,),
                          Text("Present", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        
                          Text("Absent", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        ],
                      ),
                                    ),
                             SizedBox(
                  height: screenHeight*0.32,
//              
child: Obx(() {
  final pages = getAttendancePages(teacherDashboardController.attendanceList);
  if (pages.isEmpty) {
  return Center(child: Text("No data found"));
}
  return Column(
    children: [
      SizedBox(
        height: screenHeight*0.29,
        child: PageView.builder(
          controller: attendanceController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Column(
              children: pages[index]
                  .map((model) => attendencecaed(model: model))
                  .toList(),
            );
          },
        ),
      ),
      SizedBox(height: screenHeight * 0.01),
      SmoothPageIndicator(
        controller: attendanceController,
        count: pages.length,
        effect: WormEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey.shade300,
        ),
      ),
    ],
  );
}),

                          ),
                
                            ],
                          ), 
                ),
              )
   
                                  
                  ],
                ),
           Padding(
                padding:  EdgeInsets.only(top: screenHeight*0.02,left: screenWidth*0.04),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Assignment', style: TextStyle(fontSize: 18, )),
                    SizedBox(width: screenWidth*0.3,),
                          Text('Date : 22-2-2024', style: TextStyle(fontSize: 15,color: Colors.grey )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: screenHeight*0.02,),
          
      
   Column(
            children: [  GestureDetector(onTap: () {
                    Get.toNamed('/studentAssignment', parameters: {'classId': 'A12G', 'studentId': 'STU001'});
                      },

              child: Container
                (
                  height: screenHeight*0.4,
                  width: screenWidth*0.9,
                  decoration: BoxDecoration(color: Colors.white
                  ,  borderRadius: BorderRadius.circular(12),
                  
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4),]
                  ),
                  child:     Column(
                    children: [
                     
                       Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF1686E0), Color(0xFF0F2C63)],
                          ),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.1),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              SizedBox(width: screenWidth*0.09,),
                            Text("Submitted", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 13)),
                          
                            Text("Not submitted", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 12),),
                          ],
                        ),
                                      ),
                    
                                  SizedBox(
                height: screenHeight*0.32,
                child: Obx(() {
  final pages = getAttendancePages(teacherDashboardController.assignmentList);
  if (pages.isEmpty) {
  return Center(child: Text("No data found"));
}
  return Column(
    children: [
      SizedBox(
        height: screenHeight*0.29,
        child: PageView.builder(
          controller: assignmentController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Column( children: pages[index]
                  .map((model) => attendencecaed(model: model))
                  .toList(),
            );
          },
        ),
      ),
      SizedBox(height: screenHeight * 0.01),
      SmoothPageIndicator(
        controller: assignmentController,
        count: pages.length,
        effect: WormEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey.shade300,
        ),
      ),
    ],
  );
}),
                                  )
                
              ],
                        ), 
                ),
            )]),
               SizedBox(height: screenHeight*0.04,),
       Padding(
  padding: EdgeInsets.only(top: screenHeight * 0.03, left: screenWidth * 0.01),
  child: Row(
    
    children: [
      Text("Upcoming Events", style: TextStyle(fontSize: 20)),
      GestureDetector(
        onTap: () => Get.toNamed('/eventscreen'),
        child: Padding(
          padding:  EdgeInsets.only(left: screenWidth*0.3),
          child: Text("View All",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.buttoncolor)),
        ),
      ),
    ],
  ),
),
Obx(() {
  if (eventController.isLoading.value) {
    return Center(child: CircularProgressIndicator());
  } else if (eventController.eventList.isEmpty) {
    return Text("No events found");
  } else {
    return SizedBox(
      height: screenWidth * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2, // Only 2 events
        itemBuilder: (context, index) {
          final event = eventController.eventList[index];
          return EventCard(event: event);
        },
      ),
    );
  }
}),   SizedBox(height: screenHeight*0.1,)
                ],
              ),
 
          
          ),
      
  
  );
}

      
        
        
  

}



