import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, right: 16),
          child: TextButton(
            onPressed: () {
              
            },
            child: Text("Skip", style: TextStyle(color: Colors.black)),
          ),
        ),
      ),

      showSkipButton: false,
      showDoneButton: false,
      pages: [
        PageViewModel(
          title: "Apply for courses and find jobs to grow your career",
          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
          
          image: Image(image: AssetImage(AppImages.onboardingimage1)),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Check Your Kids Attendance With Us",
          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
          image: Image(image: AssetImage(AppImages.onboardingimage2)),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "Track All Activity And Daily Test",
          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
          image: Image(image: AssetImage(AppImages.onboardingimage3)),
          decoration: getPageDecoration(),
        
        ),
      ],

      next: Text("Next", style: TextStyle(color: Colors.deepPurple)),

      dotsDecorator: getDotDecoration(),

      
      globalFooter: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: CustomButton(text: "Next", onPressed: (){

          }),
          // child: ElevatedButton(
          //   onPressed: () {
          //     // Navigate to login/home screen
          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.deepPurple,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //   ),
          //   child: Text("Get Started", style: TextStyle(fontSize: 16)),
          // ),
        ),
      ),
    );
  }

  Widget buildImage(String path) => Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 30),
        child: Image.asset(path, height: 250),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 14),
        imageAlignment: Alignment.bottomCenter,
        pageColor: Colors.white,
        // contentMargin: EdgeInsets.symmetric(horizontal: 16),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.grey,
        activeColor: AppColors.buttoncolor,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        // spacing: EdgeInsets.only(top: 16), // slight space above dots
      );
}
