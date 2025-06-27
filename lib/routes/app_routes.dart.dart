import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:klik_kart/Student_side/view/auth/forgetpassword_screen.dart';
import 'package:klik_kart/Student_side/view/auth/login_screen.dart';
import 'package:klik_kart/Student_side/view/auth/onboarding_screen.dart';

import 'package:klik_kart/Student_side/view/auth/signup_screen.dart';
import 'package:klik_kart/Student_side/view/auth/splash_screen.dart';

import 'package:klik_kart/Student_side/view/screens/course_screen.dart';
import 'package:klik_kart/Student_side/view/screens/event_screen.dart';
import 'package:klik_kart/Student_side/view/screens/home_screen.dart';
import 'package:klik_kart/Student_side/view/screens/job_screen.dart';
import 'package:klik_kart/Student_side/view/screens/notification_screen.dart';
import 'package:klik_kart/Student_side/view/screens/reservation_form.dart';
import 'package:klik_kart/widgets/bottombar/bottom_bar.dart';


class AppRoutes {
  static final routes=[
      GetPage(name: '/splashscreen', page: ()=>SplashScreen()),
      GetPage(name: '/onboarding', page: ()=>OnboardingScreen()),
      GetPage(name: '/login', page: () => LoginScreen()),
      GetPage(name: '/signup', page: () => SignupScreen()),
      GetPage(name: '/forgetpassword', page: () => ForgetpasswordScreen()),
      GetPage(name: '/homescreen', page: () => const HomeMainScreen()),
      GetPage(name: '/bottombar', page: ()=>BottomNavScreen()),
      GetPage(name: '/coursedetail', page: ()=>CourseDetails()),
     GetPage(name: '/notification', page: ()=>NotificationScreen()),
     GetPage(name: '/eventscreen', page: ()=>EventScreen()),
     GetPage(name: '/reservationform', page: ()=>ReservationForm()),
 
     
      
  
      
  ];
}