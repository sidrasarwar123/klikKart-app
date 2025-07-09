import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:klik_kart/Student_side/models/course.dart';
import 'package:klik_kart/Student_side/models/event.dart';
import 'package:klik_kart/Student_side/models/succes_stories.dart';
import 'package:klik_kart/Student_side/widgets/course_widget.dart';
import 'package:klik_kart/Student_side/widgets/event_widget.dart';
import 'package:klik_kart/Student_side/widgets/success_stories.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';



class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool hasUnreadNotifications = true;
     List<SuccessStory> stories = [
      SuccessStory(
        imageUrl:AppImages.successstories1,
        name: 'Ali Haider',
        courseType: '(UI/UX DESIGNER)',
        courseColor: AppColors.buttoncolor,
        description: 'This course changed my career path.\nI landed a job at UI/UX Designer within 3 months of completion.',
      ),
      SuccessStory(
        imageUrl:AppImages.successstories2,
        name: 'Umer Zahid',
        courseType: '(WEB DEVELOPMENT)',
        courseColor: AppColors.buttoncolor,
        description: 'This course changed my career path. I landed a job at Web Development within 3 months of completion.',
      ),
    ];
  

     final List<Course> dummyCourses = [
  Course(
    title: 'UI/UX DESIGNING',
    imageUrl:AppImages.UIimage,
    rating: 4.5,
    lessons: 30,
    price: 10000,
  ),
  Course(
    title: 'WEB DEVELOPMENT',
    imageUrl:AppImages.webimage,
    rating: 4.5,
    lessons: 30,
    price: 20000,
  ),
];
  final List<Event> events = [
    Event(
      title: "Mango Festival",
      date: "19 May,2024",
      imageUrl: AppImages.event1image,
    ),
    Event(
      title: "14 August",
      date: "14 Aug,2024",
      imageUrl: AppImages.event2image,
    ),
  ];

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
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(AppImages.personimage),
                          radius: 40,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '“Khuzaima”',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
           
              Column(
                children: [
                 
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                         Wrap(
                        
                            children: stories.map((story) => SuccessStoryCard(
                                    imageUrl: story.imageUrl,
                                    name: story.name,
                                    courseType: story.courseType,
                                    courseColor: story.courseColor,
                                    description: story.description,
                            )).toList(),
                          ),
                                
                        ],
                      )
                    ),
                  ),
                   Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.7),
              child: Text("Course",style: TextStyle(fontSize: 20),),
            ),SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: dummyCourses.asMap().entries.map((entry) {
      int index = entry.key;
      Course course = entry.value;

      Widget card = CourseCard(course: course);

      return Padding(
        padding:  EdgeInsets.only(right:screenWidth*0.01),
        child: index == 0
            ? GestureDetector(
                onTap: () => Get.toNamed("/coursedetail"),
                child: card,
              )
            : card,
      );
    }).toList(),
  ),
),
            Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.01,right: screenWidth*0.5),
              child: Text("Course by Mentor",style: TextStyle(fontSize: 20),),),
              SingleChildScrollView (scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01,left: screenWidth*0.03),
                child: Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    color: AppColors.buttoncolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                 
                    child: Row(
                      children: [
                        CircleAvatar(backgroundImage: AssetImage(AppImages.course1image),radius: 25,
                         
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: screenHeight*0.01,),
                          child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: screenWidth*0.2),
                                child: Text("M.Hanzla",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                              ),
                                Text("UI/UX Designer | Mentor",style: TextStyle(color: Colors.white,fontSize: 14,),),
                            
                             ],
                          ),
                        ),
                        
                      ],
                    ),
                
                ),
                            ),
                             Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01,left: screenWidth*0.03),
                child: Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                 
                    child: Row(
                      children: [
                        CircleAvatar(backgroundImage: AssetImage(AppImages.course2image),radius: 25,
                         
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: screenHeight*0.01,),
                          child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: screenWidth*0.2),
                                child: Text("M.Haris",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                              ),
                                Text("Frontend Developer | Mentor",style: TextStyle(color: Colors.white,fontSize: 12,),),
                         
                             ],
                          ),
                        ),
                        
                      ],
                    ),
               
                ),
                            ),
                 
                ],),
              ),
           Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.03,),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Upcoming  Events",style: TextStyle(fontSize: 20),),
                      Padding(
                        padding:  EdgeInsets.only(left:screenWidth*0.3 ),
                        child: InkWell(onTap: (){
                          Get.toNamed('/eventscreen');
                        },
                          child: Text("View All",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.buttoncolor),)),
                      ),
                    ],
                  ),
                ],
              ),),
          SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: events.map((event) => InkWell(onTap: (){
           
          },
            child: EventCard(event: event))).toList(),
        ),
      ),
                ],
              ),
              SizedBox(height: screenHeight*0.1,)
          

        
          ]
      ),
      )
    );
  }
}
