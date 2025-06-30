import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';

import 'package:readmore/readmore.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
   final List<Map<String, String>> reviews = [
      {
        "name": "M.Hanzla",
        "date": "March, 27 2024",
        "image":AppImages.course1image,
      },
      {
        "name": "Ralph Edwards",
        "date": "March, 27 2024",
        "image": AppImages.course2image,
      },
      {
        "name": "Floyd Miles",
        "date": "March, 27 2024",
        "image": AppImages.course3image,
      },
     ];
  final String longText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 
eiusmod tempor incididunt ut labore  sit amet, consectetur 
adipiscing elit, sed do eiusmod tempor incididunt ut labore 
amet, consectetur adipiscing elit, sed do eiusmod tempor 
incididunt ut labore
''';
  int selectedIndex = 0;

  final List<String> tabs = ['About', 'lessons', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
       body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset(AppImages.UIimage)),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.01, right: screenWidth * 0.3),
              child: Text(
                "Introudction to Figma",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1),
              child: Row(
                children: [
                  Text(
                    "UI/UX Designer | Mentor",
                    style: TextStyle(color: AppColors.buttoncolor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.1),
                    child: Text(
                      "Rs: 10,000",
                      style: TextStyle(
                          color: AppColors.buttoncolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1),
              child: Row(
                children: [
                  Text(
                    "4.5",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                ],
              ),
            ),
           
           Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight*0.03),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(tabs.length, (index) {
                        bool isSelected = index == selectedIndex;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth*0.01),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:screenWidth*0.07, vertical: 10),
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
              ),
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
              child: Text('About' ,  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidth*0.1),
              child: ReadMoreText(
                        longText,
                        trimLines: 2,
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: 'Read Less',
                        style: TextStyle(fontSize: 16),
                      ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.02,right: screenWidth*0.6),
              child: Container(
                height:screenHeight*0.06, 
                width: screenWidth*0.3,
                decoration: BoxDecoration(color:AppColors.buttoncolor,
                borderRadius: BorderRadius.circular(20)
                ),child: Center(child: Text("30 lessons",style: TextStyle(color: AppColors.textcolor,fontWeight: FontWeight.bold),)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: screenWidth*0.2,top:screenHeight*0.02 ),
              child: Text("What we Learn in this course",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidth*0.07,top: screenHeight*0.01),
              child: Column(
                children: [
                  Row(
                    children: [
                          Icon(Icons.circle,size: 11, color: AppColors.buttoncolor),
                      Text(" Interface Familiarization")
                    ],
                  ),
                   Row(
                    children: [
                          Icon(Icons.circle,size: 11, color: AppColors.buttoncolor),
                      Text(" Basic Tools and Features ")
                    ],
                  ),
                   Row(
                    children: [
                          Icon(Icons.circle,size: 11, color: AppColors.buttoncolor),
                      Text(" Creating and Editing Designs")
                    ],
                  ),
                   Row(
                    children: [
                          Icon(Icons.circle,size: 11, color: AppColors.buttoncolor),
                      Text(" Collaboration and Sharing ")
                    ],
                  ),

                ],
              ),
            ),
            Padding(
          padding: EdgeInsets.only(right: screenWidth*0.6,top:screenHeight*0.01 ),
              child: Text("Instructor",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
             Padding(
                padding:  EdgeInsets.only(left: screenWidth*0.05),
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
                   
                      child: 
                       Row(
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
                    
                  )
                      )
                    ]
               ),
             ),
          ]
       );
    } else if (selectedIndex == 1) {
     return Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.3),
              
              child: Text('Chapter 1- Introduction' ,  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.buttoncolor),
              ),
            ),     Padding(
               padding:  EdgeInsets.only(top: screenHeight*0.01,right: screenWidth*0.3),
             
              child: Column(
                children: [
                  Text("1-Welcome to the Course"),
                  Text("2-What Is UI?                    "),
                 Text("3-What Is UX?,                  ")
                ],
              ),
               
            ),
             Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.02),
              child: Text('Chapter 2- Getting Started With Figma' ,  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.buttoncolor),
              ),
            ),     Padding(
               padding:  EdgeInsets.only(top: screenHeight*0.01,right: screenWidth*0.3),
             
              child: Padding(
                padding:  EdgeInsets.only(left:screenWidth*0.01),
                child: Column(
                  children: [
                    Text(" 1-Working With Projects  Pages"),
                    Text(" 2-Using the Figma Ul                  "),
                   Text("  3-Working With Frames, Shapes,  ")
                  ],
                ),
              ),
               
            ),
          ]
     );
    } else {
 return Padding(
    padding: EdgeInsets.all(screenWidth * 0.04),
    child: SizedBox(
      height: screenHeight * 0.6,  
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            separatorBuilder: (_, __) => Divider(thickness: 1),
            itemBuilder: (context, index) {
              final review = reviews[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(review["image"]!),
                        radius: 20,
                      ),
                       SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review["name"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            review["date"]!,
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: List.generate(
                          5,
                          (star) => Icon(Icons.star, color: Colors.amber, size: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore sit amet, consectetur adipiscing elit.",
                  ),
                  SizedBox(height: 8),
                ],
              );
            },
          ),
        ]
      )
    )
 );
    }
  }(),
),

          ],
        ),
       ),


        bottomNavigationBar:  Padding(
  padding: EdgeInsets.only(top: screenHeight * 0.03,left: screenWidth*0.06),
  child: Row(
    children: [
      SizedBox(
        width: screenWidth * 0.7, 
        height: screenHeight * 0.06, 
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/reservationform');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttoncolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 2,
          ),
          child: Text(
            "Enroll Now",
            style: TextStyle(color: AppColors.textcolor),
          ),
        ),      
                
              ),
               SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  Icon(Icons.shopping_cart_outlined,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}









      




//           


//