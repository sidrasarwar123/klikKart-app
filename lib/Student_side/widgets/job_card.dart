import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';

class JobCard extends StatelessWidget {
  final String companyLogoUrl;
  final String title;
  final String company;
  final String location;
  final String? match;
  final String? daysAgo;

  final bool showMatchInfo;
  final bool showTime;
  final bool showApplyButton;

  final VoidCallback? onTap;

  const JobCard({
    super.key,
    required this.companyLogoUrl,
    required this.title,
    required this.company,
    required this.location,
    this.match,
     this.daysAgo,
    this.showMatchInfo = true,
    this.showTime = true,
    this.showApplyButton = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap, 
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 231, 244, 250),
          border: Border.all(color: Color.fromARGB(255, 178, 226, 248)),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.1,
              width: screenWidth * 0.2,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AppImages.iconimage,
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: screenHeight * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(company, style: TextStyle(fontSize: 14, color: AppColors.buttoncolor)),
                  SizedBox(height: 2),
                  Text(location, style: TextStyle(fontSize: 16, color: Colors.black)),

                  if (showMatchInfo)
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.01, right: screenWidth * 0.01),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(companyLogoUrl),
                            radius: 13,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child:  Text(
  match ?? 'No match info',
  style: TextStyle(fontSize: 12),
  overflow: TextOverflow.ellipsis,
),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 8),

                  if (showTime || showApplyButton)
                    Row(
                      children: [
                        if (showTime) ...[
                          Icon(Icons.access_time, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
  daysAgo ?? '',
  style: TextStyle(fontSize: 17, color: Colors.grey),
),
                            
                        ],
                        if (showApplyButton)
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                              onPressed: onTap,
                              // onPressed: () {
                              // Get.toNamed('/jobtitle',);
                              // },
                              child: Text("Easy Apply",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
