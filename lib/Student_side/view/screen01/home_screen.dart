
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/Student_side/controller/course_controller.dart';
import 'package:klik_kart/Student_side/controller/event_controller.dart';
import 'package:klik_kart/Student_side/controller/mentor_controller.dart';

import 'package:klik_kart/Student_side/controller/stories_controller.dart';
import 'package:klik_kart/Student_side/models/course.dart';



import 'package:klik_kart/Student_side/widgets/course_widget.dart';
import 'package:klik_kart/Student_side/widgets/event_widget.dart';
import 'package:klik_kart/Student_side/widgets/success_stories.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';

import 'package:klik_kart/controller/profile_controller.dart';
import 'package:klik_kart/utils/color_util.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  final SuccessStoryModelController successStoryModelController =Get.put(SuccessStoryModelController());
  final CourseController courseController=Get.put(CourseController());
  final MentorController mentorController = Get.put(MentorController());
  final EventController eventController = Get.put(EventController());
  final ProfileController profileController = Get.find<ProfileController>();
  @override
void initState() {
  super.initState();
  profileController.fetchUserData();
  successStoryModelController.fetchSuccessStories();
  eventController.fetchEvents();
  mentorController.fetchMentors();
  

}

  @override
  Widget build(BuildContext context) {
   final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  final user = profileController.userModel.value;

    final bool hasUnreadNotifications = true;
     return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
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
                        top: screenHeight * 0.070,
                        right: screenWidth * 0.06),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Stack(
                        children: [
                          IconButton(onPressed: (){
                            Get.toNamed('/notification');
                          },icon: Icon(
                            AppIcons.Notificationicon,
                            color: Colors.white,
                            size: 28,
                          ),),
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
    profileImage = AssetImage(AppImages.personimage);
  }

  return Padding(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.03),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/studentprofile');
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
              padding: EdgeInsets.only(top: screenHeight * 0.04),
              child: Container(
                height: screenHeight * 0.16,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.buttoncolor,
                  borderRadius: BorderRadius.circular(20),
                ),
               
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(AppImages.boyimage),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: screenHeight*0.01),
                        child: Column(
                          children: [
                            Text("Explore Your \n New Skill Today",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                           
                               SizedBox(height: screenHeight*0.05,width: screenWidth*0.4,
                                 child: ElevatedButton(
                                                  onPressed: () {
                                                    },
                                                 child: Text("Get Started",),
                                                     ),
                               ),
                          
                           ],
                        ),
                      )
                    ],
                  ),
              
              
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.02,right: screenWidth*0.4),
              child: Text("Success Stories",style: TextStyle(fontSize: 20),),
            ),
           
              Obx((){
                if (successStoryModelController.isLoading.value) {
                  return CircularProgressIndicator();
                }
                else if (successStoryModelController.storiesList.isEmpty) {
                return Text('No success_stories available');
              }
              else{
                  final successstory = successStoryModelController.storiesList.first;
                return 
                   
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child: Row(
      
                              children: successStoryModelController.storiesList.map((story) => SuccessStoryCard(
                                     imageUrl: story.imageUrl,
                                      name: story.name,
                                      courseType: story.courseType,
                                      courseColor: hexToColor(story.courseColor),
                                      description: story.description,
                              )).toList(),
                        )),
                );
              }
              }
              ),
                
                     Padding(
                padding:  EdgeInsets.only(right: screenWidth*0.7,),
                child: Text("Course",style: TextStyle(fontSize: 20),),
                            ),
                       Obx(() {
  if (courseController.isLoading.value) {
    return CircularProgressIndicator();
  } else if (courseController.courseList.isEmpty) {
    return Text('No course available');
  } else {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(courseController.courseList.length, (index) {
          final course = courseController.courseList[index];

          return Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.02),
            child: GestureDetector(
              onTap: () => Get.toNamed("/coursedetail", arguments: course),
              child: CourseCard(course: course),
            ),
          );
        }),
      ),
    );
  }
}),
                           Padding(
                padding:  EdgeInsets.only(top: screenHeight*0.01,right: screenWidth*0.5),
                child: Text("Course by Mentor",style: TextStyle(fontSize: 20),),),
      
Obx(() {
  if (mentorController.isLoading.value) {
    return const Center(child: CircularProgressIndicator());
  }

  if (mentorController.mentorList.isEmpty) {
    return const Text("No mentors found");
  }

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: mentorController.mentorList.map((mentor) {
        return Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03, top: screenHeight * 0.01),
          child: Container(
            height: screenHeight * 0.08,
            width: screenWidth * 0.7,
            decoration: BoxDecoration(
              color: Color(int.parse("0xFF${mentor.color.replaceAll("#", "")}")),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(mentor.imageUrl),
                  radius: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(mentor.name,
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(mentor.role,
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}),

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
    return const Center(child: CircularProgressIndicator());
  } else if (eventController.eventList.isEmpty) {
    return const Text("No events found");
  } else {
    return SizedBox(
      height: screenWidth * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eventController.eventList.length.clamp(0, 2), // 👈 safe limit
        itemBuilder: (context, index) {
          final event = eventController.eventList[index];
          return EventCard(event: event);
        },
      ),
    );
  }
}),
              SizedBox(height: screenHeight*0.1,)
          

        
          ]
        )
    
      )
    );
  }
}
