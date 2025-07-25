import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:klik_kart/Employee_side/view/screens/apply_screen.dart';
import 'package:klik_kart/Employee_side/view/screens/team_member.dart';
import 'package:klik_kart/Employee_side/widgets/bottom_bar.dart';

import 'package:klik_kart/Student_side/view/auth/forgetpassword_screen.dart';
import 'package:klik_kart/Student_side/view/auth/login_screen.dart';
import 'package:klik_kart/Student_side/view/auth/onboarding_screen.dart';


import 'package:klik_kart/Student_side/view/auth/signup_screen.dart';
import 'package:klik_kart/Student_side/view/auth/splash_screen.dart';
import 'package:klik_kart/Student_side/view/screen01/course_screen.dart';


import 'package:klik_kart/Student_side/view/screen01/event_screen.dart';
import 'package:klik_kart/Student_side/view/screen01/home_screen.dart';

import 'package:klik_kart/Student_side/view/screen01/job_reservation.dart';

import 'package:klik_kart/Student_side/view/screen01/job_title.dart';
import 'package:klik_kart/Student_side/view/screen01/notification_screen.dart';
import 'package:klik_kart/Student_side/view/screen01/reservation_form.dart';
import 'package:klik_kart/Student_side/view/screen02/assigment_screen.dart';
import 'package:klik_kart/Student_side/view/screen02/attendence_screen.dart';
import 'package:klik_kart/Student_side/view/screen02/course_detail.dart';
import 'package:klik_kart/Student_side/view/screen02/home_screen02.dart';
import 'package:klik_kart/Student_side/view/screen02/result_screen.dart';
import 'package:klik_kart/Student_side/widgets/bottom_bar.dart';
import 'package:klik_kart/teacher_side/view/screen/assi_marks.dart';
import 'package:klik_kart/teacher_side/view/screen/attendence_screen.dart';
import 'package:klik_kart/teacher_side/view/screen/calendar_screen.dart.dart';
import 'package:klik_kart/teacher_side/view/screen/course_screen.dart';
import 'package:klik_kart/teacher_side/view/screen/publish_assi.dart.dart';
import 'package:klik_kart/teacher_side/view/screen/stu_assigment.dart.dart';
import 'package:klik_kart/teacher_side/widgets/bottombar/bottombar_screen.dart';






class AppRoutes {
  static final routes=[
      GetPage(name: '/splashscreen', page: ()=>SplashScreen()),
      GetPage(name: '/onboarding', page: ()=>OnboardingScreen()),
      GetPage(name: '/login', page: () => LoginScreen()),
      GetPage(name: '/signup', page: () => SignupScreen()),
      GetPage(name: '/forgetpassword', page: () => ForgetpasswordScreen()),
      GetPage(name: '/homescreen', page: () =>  HomeMainScreen()),
      GetPage(name: '/bottombar', page: ()=>BottomNavScreen()),
      GetPage(name: '/coursedetail', page: ()=>CourseDetails()),
     GetPage(name: '/notification', page: ()=>NotificationScreen()),
     GetPage(name: '/eventscreen', page: ()=>EventScreen()),
     GetPage(name: '/reservationform', page: ()=>ReservationForm()),
     GetPage(name: '/jobtitle', page: ()=>JobTitle()),
     GetPage(name: '/jobreservation', page: ()=>JobReservation()),





    // GetPage(name: '/homescreen02', page:()=>HomeScreen02()),
    // GetPage(name: '/coursescreen', page:()=>StudentEnrollcoursedetail()),
    // GetPage(name: '/attendence', page:()=>AttendenceScreen()),
    // GetPage(name: '/assigment', page:()=>AssigmentScreen()),
    // GetPage(name: '/resultscreen', page:()=>ResultScreen()),






   GetPage(name: "/bottombarscreen", page: ()=>BottombarScreen()),
      GetPage(name: "/attendencescreen", page: ()=>AttendenceScreen01()),
      GetPage(name: "/course", page: ()=>CourseScreen()),
      GetPage(name: "/studentattendencescreen", page: ()=>Attendence()),
      GetPage(name: "/studentassigment", page: ()=>StudentAssigment()),
       GetPage(name: "/student02assigment", page: ()=>Stu2Assigment()),
        GetPage(name: "/studentmarks", page: ()=>MarksEntry()),








  GetPage(name: "/bottombar03", page: ()=>bottombar03()),
  GetPage(name: "/memberscreen", page: ()=>TeamMember()), 
    GetPage(name: "/applyscreen", page: ()=>ApplyScreen()),
        



    
   

 
     
      
  
      
  ];
}




