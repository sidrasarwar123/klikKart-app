import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/models/course.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';


import 'package:readmore/readmore.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
 late final CourseModel course;
  final RxBool isLoading = false.obs;

@override
void initState() {
  super.initState();
  course = Get.arguments as CourseModel;

  
  for (var lesson in course.lessons) {
   
  }
}



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
            Center(child: Image.network(course.imageUrl),),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.01, right: screenWidth * 0.3),
              child: Text(
                course.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.2),
              child: Row(
                children: [
                  Text(
                     "${course.title}",
                  
                    style: TextStyle(color: AppColors.buttoncolor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.1),
                    child: Text(
                     "Rs: ${course.price}",
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
              padding: EdgeInsets.only(left: screenWidth * 0.2),
              child: Row(
                children: [
                  Text(
                    "${course.rating}",
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
  padding: EdgeInsets.only(
    top: screenHeight * 0.01,
    left: screenWidth * 0.05,
  ),
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: course.lessons.asMap().entries.map((entry) {
      final index = entry.key +1;
      final lesson = entry.value;
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$index. ${lesson.title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.buttoncolor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              lesson.lesson,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ],
        ),
      );
    }).toList(),
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
                   
             
                      child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(course.instructor.imageUrl),
                    radius: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(course.instructor.name,
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(course.instructor.role,
                            style: TextStyle(color: Colors.white, fontSize: 12)),
                           
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
  padding: EdgeInsets.only(right: screenWidth * 0.6,top: screenHeight*0.04),
  child: Text(
    "Lessons",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.buttoncolor,
    ),
  ),
),

//
Padding(
  padding: EdgeInsets.only(
    top: screenHeight * 0.03,
    left: screenWidth * 0.05,
  ),
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: course.lessons.asMap().entries.map((entry) {
      final index = entry.key + 1;
      final lesson = entry.value;
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$index. ${lesson.title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.buttoncolor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              lesson.lesson,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ],
        ),
      );
    }).toList(),
  ),
),
           
          ]
     );
    } else {
 return Padding(
  padding: EdgeInsets.all(screenWidth * 0.04),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: course.reviews.asMap().entries.map((entry) {
      final index = entry.key + 1;
      final review = entry.value;

      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(review.imageUrl),
                  radius: 22,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${review.name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${review.date}",
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 12),
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
            SizedBox(height: 8),
            Text(
              review.message,
              style: TextStyle(fontSize: 15),
            ),
            Divider(thickness: 1),
          ],
        ),
      );
    }).toList(),
  ),
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
        child: Obx(() => 
  ElevatedButton(
     onPressed: isLoading.value
      ? null
      : () async {
          isLoading.value = true;

          final uid = FirebaseAuth.instance.currentUser!.uid;
          final doc = await FirebaseFirestore.instance.collection('reservations').doc(uid).get();

          if (doc.exists && doc['isApproved'] == true) {
            Get.offAllNamed('/bottombar', arguments: {
              'initialIndex': 0,
              'isApproved': true,
            });
          } else {
            Get.toNamed('/reservationform')!.then((_) {
              isLoading.value = false;
            });
          }
      },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttoncolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 2,
    ),
    child: isLoading.value
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: AppColors.buttoncolor,
              strokeWidth: 2,
            ),
          )
        : Text(
            "Enroll Now",
            style: TextStyle(color: AppColors.textcolor),
          ),
  ),
)
                
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