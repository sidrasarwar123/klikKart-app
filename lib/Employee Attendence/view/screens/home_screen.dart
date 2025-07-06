import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Employee%20Attendence/widgets/line_printer.dart';
import 'package:klik_kart/Student_side/models/event.dart';
import 'package:klik_kart/Student_side/widgets/event_widget.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';

class homescreen04 extends StatefulWidget {
  const homescreen04 ({super.key});

  @override
  State<homescreen04> createState() => _homescreen04State();
}

class _homescreen04State extends State<homescreen04> {
   final List<String> imageUrls = [
    'assets/image (10).png',
    'assets/image (11).png',
    'assets/image (13).png',
    'assets/image (12).png',
    'assets/image (14).png',
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
                 Padding(
                  padding: EdgeInsets.only(left: screenHeight * 0.03),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImages.teacherimage),
                        radius: 30,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "Mr.Hanzla",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Mark Your Attendance!',
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
          ),SizedBox(height: screenHeight*0.02,),
          Text("09:10 AM",style: TextStyle(fontSize: 22,color: Colors.blue,fontWeight: FontWeight.bold),),
           Text("March 19,2024-Friday",style: TextStyle(fontSize: 15),),
           SizedBox(height: screenHeight*0.02,),
            Container(
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:  Color.fromARGB(255, 200, 235, 252), width: 9),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon(Icons.touch_app_outlined, size: 50, color: Colors.blue),
                        SizedBox(height: 10),
                        Text(
                          "CLOCK IN",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
               SizedBox(height: screenHeight*0.04,), 
          CustomPaint(
            size: Size(double.infinity, 1),
            painter: DashedLinePainter(),
          ), SizedBox(height: screenHeight*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    Column(
                      children: [
                        Icon(Icons.schedule, color: Colors.grey,size: 30,),
                        Text("Clock In", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.schedule, color: Colors.grey,size: 30,),
                        Text("Clock Out", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green,size: 30,),
                        Text("Total Hrs", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),  SizedBox(height: screenHeight*0.04,),
                 CustomPaint(
            size: Size(double.infinity, 1),
            painter: DashedLinePainter(),
          ),
                 SizedBox(height: screenHeight*0.04),
                Column(
                    children: [
                      Container(
                        height: screenHeight*0.4,
                        width: screenWidth*0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color:  Color.fromARGB(255, 231, 227, 227)),borderRadius: BorderRadius.circular(20)
                        ),child: Padding(
                          padding:  EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Attendence", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, ),),
                                Text("Current Month", style: TextStyle(
                                fontSize: 13),),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: screenHeight*0.02,left: screenWidth*0.02),
                                      child: Row(
                                        children: [
                                            _buildStatCard("06", "Early Leave", Colors.blue),
                                            SizedBox(width: screenWidth*0.07,),
                                             _buildStatCard("01", "Absent", Colors.lightBlueAccent),
                                        ],
                                      ),
                                    ),Padding(
                                        padding: EdgeInsets.only(top: screenHeight*0.02,left: screenWidth*0.02),
                                      child: Row(
                                        children: [

                                             _buildStatCard("02", "Late in",Colors.red),
                                                SizedBox(width: screenWidth*0.07,),
                                               _buildStatCard("01", "Total Leave", Colors.orange)
                   
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight*0.02,),
                       Container(
                        height: screenHeight*0.25,
                        width: screenWidth*0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color:  Color.fromARGB(255, 231, 227, 227)),borderRadius: BorderRadius.circular(20)
                        ),child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: screenHeight*0.03),
                              child: Row(
                                children: [
                                   Padding(
                                   padding:  EdgeInsets.only(left: screenWidth*0.04),
                                                      child: Text("My Team Member",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                                    ),
                                                    Padding(
                                                      padding:  EdgeInsets.only(left:screenWidth*0.2 ),
                                                      child: InkWell(onTap: (){
                                                   Get.toNamed('/memberscreen');
                                                      },
                                                        child: Text("View All",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.buttoncolor),)),
                                                    ),
                                ],
                              ),
                            ),Padding(
                              padding:  EdgeInsets.only(right: screenWidth*0.6,top: screenHeight*0.01),
                              child: Text("Attendence",style: TextStyle(color: Colors.grey),),
                            ),
                          
           Padding(
            padding:  EdgeInsets.only(top: screenHeight*0.01),
             child: Row(
          
               children: [
                 Padding(
                   padding:  EdgeInsets.only(left: screenWidth*0.02),
                   child: DashedCircle(
                    child: Padding(padding: EdgeInsets.all(6.0),
                      child: Container(
                      height: screenHeight*0.1,
                      width: screenWidth*0.2,
                      decoration: BoxDecoration(color:  Color.fromARGB(255, 217, 238, 248),borderRadius: BorderRadius.circular(35)
                      ),child:  Padding(
                        padding:  EdgeInsets.only(top: screenHeight*0.02),
                        child: Column(
                          children: [
                            Center(child: Text("19/31",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),)),
                            Text("Clock In",style: TextStyle(color: Colors.green,fontSize: 13,fontWeight: FontWeight.bold),), 
                          ],
                        
                                      
                        ),
                      ),
                     
                      ),
                    ),
                    color: Colors.blue,
                             
                                 ),
                 ),SizedBox(width: screenWidth*0.1,),         
                  SizedBox(
  width: screenWidth * 0.5,
  height: screenHeight*0.09,
  child: Stack(
    children: List.generate(imageUrls.length, (index) {
      return Positioned(
        left: index * 30.0,
        child: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imageUrls[index]),
        ),
      );
    }),
  ),
)
               ],
             ),
           ),

                          ],
                        ),
                        ),
                        
          Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.03,),
              child:  Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: screenWidth*0.04),
                        child: Text("Upcoming  Events",style: TextStyle(fontSize: 20),),
                      ),
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
      ),   SizedBox(height: screenHeight*0.1,)
                ],
              ),
 
          
          
                    ],
                  ) ,
            
    )


    );
  }
}

 Widget _buildStatCard(String value, String label, Color color) {
  
    return Container(
      width: 120,
      height: 90,
      padding:  EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(12),
        color: color.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.buttoncolor))),
           SizedBox(height: 5),
          Center(child: Text(label, style: TextStyle(fontSize: 15, color: Colors.black))),
        ],
      ),
    );
  }
