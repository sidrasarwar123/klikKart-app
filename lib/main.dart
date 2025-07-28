import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:klik_kart/Student_side/controller/course_controller.dart';
import 'package:klik_kart/Student_side/controller/event_controller.dart';
import 'package:klik_kart/Student_side/controller/mentor_controller.dart';
import 'package:klik_kart/Student_side/controller/stories_controller.dart';
import 'package:klik_kart/Student_side/controller/student_enroll_controller.dart';
import 'package:klik_kart/controller/auth_controller.dart';
import 'package:klik_kart/controller/profile_controller.dart';

import 'package:klik_kart/firebase_options.dart';
import 'package:klik_kart/routes/app_routes.dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
   Get.put(AuthController());
  Get.put(ProfileController(),);

  Get.put(SuccessStoryModelController());
  Get.put(CourseController());
   Get.put(MentorController()); 
  Get.put(EventController());
  Get.put(StudentController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splashscreen',
          getPages: AppRoutes.routes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
