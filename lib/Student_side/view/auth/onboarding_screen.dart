import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Apply for courses and find jobs to grow your career",
      "body": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "image": AppImages.onboardingimage1,
    },
    {
      "title": "Check Your Kids Attendance With Us",
      "body": "Consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
      "image": AppImages.onboardingimage2,
    },
    {
      "title": "Track All Activity And Daily Test",
      "body": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "image": AppImages.onboardingimage3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(color: Colors.white),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(40, 150, 20, 20),
                          child: Column(
                            children: [
                              Text(
                                onboardingData[index]["title"] ?? '',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                onboardingData[index]["body"] ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: screenHeight * 0.09),
                              SmoothPageIndicator(
                                controller: controller,
                                count: onboardingData.length,
                                effect: const WormEffect(
                                  activeDotColor: Colors.white,
                                  dotColor: Colors.white60,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                ),
                              ),
                           Spacer(),
                             SizedBox(
  width: double.infinity,
  height: screenHeight*0.07,
  child: ElevatedButton(
    onPressed: () {
      if (index < onboardingData.length - 1) {
        controller.nextPage(
          duration:  Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        Get.offNamed('/login');
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 2,
    ),
    child: Text(
      index == onboardingData.length - 1 ? "Get Started" : "Next",
      style: TextStyle(
        color: AppColors.buttoncolor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
)
 ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        onboardingData[index]["image"] ?? '',
                        height: 280,
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
             Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: TextButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
