import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/Student_side/models/event.dart';
import 'package:klik_kart/Student_side/widgets/event_widget.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/teacher_side/models/attendence_model.dart';

import 'package:klik_kart/teacher_side/widgets/card_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homescreen03 extends StatefulWidget {
  const homescreen03({super.key});

  @override
  State<homescreen03> createState() => _homescreen03State();
}

class _homescreen03State extends State<homescreen03> {
  final List<AttendanceModel> allData = [
    AttendanceModel(
        subject: 'UI/UX',
        className: 'AI2',
        presentPercent: 0.7,
        absentPercent: 0.3),
    AttendanceModel(
        subject: 'UI/UX',
        className: 'A10',
        presentPercent: 0.9,
        absentPercent: 0.1),
    AttendanceModel(
        subject: 'Flutter',
        className: 'C1',
        presentPercent: 0.6,
        absentPercent: 0.4),
    AttendanceModel(
        subject: 'Graphics',
        className: 'B2',
        presentPercent: 0.85,
        absentPercent: 0.15),
    AttendanceModel(
        subject: 'Freelancing',
        className: 'D1',
        presentPercent: 0.6,
        absentPercent: 0.4),
    AttendanceModel(
        subject: 'Graphics',
        className: 'E2',
        presentPercent: 0.85,
        absentPercent: 0.15),
  ];
  int currentIndex = 0;
  final List<Event> events = [
    Event(
      title: "Mango Festival",
      date: "19 May,2024",
      imageUrl: AppImages.event1image,
    ),
    Event(
      title: "14 August",
      date: "14 Aug,2024",
      imageUrl: AppImages.event2image,
    ),
  ];
  final PageController attendanceController = PageController();
  final PageController assignmentController = PageController();

  int _currentAttendancePage = 0;
  int _currentAssignmentPage = 0;

  @override
  void initState() {
    super.initState();

    attendanceController.addListener(() {
      final page = attendanceController.page;
      if (page != null) {
        setState(() {
          _currentAttendancePage = page.round();
        });
      }
    });

    assignmentController.addListener(() {
      final page = assignmentController.page;
      if (page != null) {
        setState(() {
          _currentAssignmentPage = page.round();
        });
      }
    });
  }

  @override
  void dispose() {
    attendanceController.dispose();
    assignmentController.dispose();
    super.dispose();
  }

  List<List<AttendanceModel>> get pages {
    List<List<AttendanceModel>> result = [];
    for (int i = 0; i < allData.length; i += 2) {
      result.add(
          allData.sublist(i, i + 2 > allData.length ? allData.length : i + 2));
    }
    return result;
  }

  final bool hasUnreadNotifications = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.buttoncolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.070, right: screenWidth * 0.06),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Stack(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.toNamed('/notification');
                            },
                            icon: Icon(
                              AppIcons.Notificationicon,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          if (hasUnreadNotifications)
                            Positioned(
                              top: 10,
                              right: 14,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(AppImages.teacherimage),
                          radius: 30,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              ' Mr.Hanzla',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: screenHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Icon(Icons.person, color: Colors.blue),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text("Classes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 55, 206, 191),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: screenHeight * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.groups,
                                color: Color.fromARGB(255, 55, 206, 191),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text("Students",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text("25",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Attendance',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/attendencescreen');
                  },
                  child: Container(
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF1686E0), Color(0xFF0F2C63)],
                            ),
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: screenWidth * 0.1,
                              ),
                              Text("Present",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)),
                              Text("Absent",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: PageView.builder(
                            itemCount: pages.length,
                            controller: attendanceController,
                            itemBuilder: (context, index) {
                              final List<AttendanceModel> pageData =
                                  pages[index];
                              return Column(
                                children: pageData
                                    .map(
                                        (model) => attendencecaed(model: model))
                                    .toList(),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01),
                          child: SmoothPageIndicator(
                            controller: attendanceController,
                            count: pages.length,
                            effect: WormEffect(
                              activeDotColor: Colors.blue,
                              dotColor: Colors.grey.shade300,
                              dotHeight: 10,
                              dotWidth: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.02, left: screenWidth * 0.04),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Assignment',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        SizedBox(
                          width: screenWidth * 0.3,
                        ),
                        Text('Date : 22-2-2024',
                            style: TextStyle(fontSize: 15, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Column(children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed("/studentassigment");
                },
                child: Container(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF1686E0), Color(0xFF0F2C63)],
                          ),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: screenWidth * 0.09,
                            ),
                            Text("Submitted",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),
                            Text(
                              "Not submitted",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: PageView.builder(
                          itemCount: pages.length,
                          controller: assignmentController,
                          itemBuilder: (context, index) {
                            final List<AttendanceModel> pageData = pages[index];
                            return Column(
                              children: pageData
                                  .map((model) => attendencecaed(model: model))
                                  .toList(),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      SmoothPageIndicator(
                        controller: assignmentController,
                        count: pages.length,
                        effect: WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          activeDotColor: Colors.blue,
                          dotColor: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.03,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04),
                        child: Text(
                          "Upcoming  Events",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.3),
                        child: InkWell(
                            onTap: () {
                              Get.toNamed('/eventscreen');
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.buttoncolor),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: events
                    .map((event) =>
                        InkWell(onTap: () {}, child: EventCard(event: event)))
                    .toList(),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
