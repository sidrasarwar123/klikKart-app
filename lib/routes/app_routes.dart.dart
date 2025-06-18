import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:klik_kart/Student_side/view/auth/onboarding_screen.dart';
import 'package:klik_kart/Student_side/view/auth/splash_screen.dart';


class AppRoutes {
  static final routes=[
      GetPage(name: '/splashscreen', page: ()=>SplashScreen()),
      GetPage(name: '/onboarding', page: ()=>HomeScreen()),
      
  ];
}