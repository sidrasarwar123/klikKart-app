import 'package:flutter/material.dart';
import 'package:klik_kart/constants/app_colors.dart';
import '../models/course.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
  final horizontalPadding = screenWidth * 0.02; 
  final containerWidth =  screenWidth * 0.6;

    return 
       Container(
        width: containerWidth,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child:Image.network(
  course.imageUrl,
  height: 120,
  width: double.infinity,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      height: 120,
      width: double.infinity,
      color: Colors.grey[200],
      child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
    );
  },
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Container(
      height: 120,
      width: double.infinity,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  },
),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          course.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text('${course.rating}'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${course.lesson} Lesson',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.buttoncolor),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'RS: ${course.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.buttoncolor,
                            fontSize: 18),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.buttoncolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                     
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Enroll Now",
                                style: TextStyle(
                                    color: AppColors.textcolor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_circle_right_sharp, color: Colors.white),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
