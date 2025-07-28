import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/Student_side/controller/event_controller.dart';
import 'package:klik_kart/Student_side/controller/student_enroll_controller.dart';

import 'package:klik_kart/Student_side/widgets/event_widget.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';

class HomeScreen02 extends StatefulWidget {
  const HomeScreen02({super.key});

  @override
  State<HomeScreen02> createState() => _HomeScreen02State();
}

class _HomeScreen02State extends State<HomeScreen02> {
  final StudentController studentController = Get.put(StudentController());
  final EventController eventController = Get.put(EventController());
  final bool hasUnreadNotifications = true;
  String selectedDay = "Mon";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
                        backgroundImage: AssetImage(AppImages.personimage),
                        radius: 40,
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
                            '“Khuzaima”',
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
              padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Obx(() {
                    final fee = studentController.feeModel.value;

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Fee:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                'Rs:${fee?.totalFee ?? 0}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.12,
                          width: 1,
                          color: Colors.grey.shade400,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _feeCard(
                                title: 'Submit Fees',
                                amount: 'Rs\n${fee?.submittedFee ?? 0}',
                                color: Colors.green,
                                bgColor: Color(0xffeafaf1),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              _feeCard(
                                title: 'Pending Fees',
                                amount: 'Rs\n${fee?.pendingFee ?? 0}',
                                color: Colors.red,
                                bgColor: Color(0xfffce9e9),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }))),
          Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.02, left: screenWidth * 0.01),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Obx(() {
                          final controller =
                              Get.find<StudentEnrollController>();

                          if (controller.isLoading.value) {
                            return const CircularProgressIndicator();
                          }

                          final progress = controller.courseProgress.value;

                          if (progress == null) {
                            return const Text("No course available");
                          }

                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/coursescreen');
                            },
                            child: Container(
                              width: screenWidth * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 174, 226, 250)),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16)),
                                    child: SizedBox(
                                      height: 100,
                                      width: double.infinity,
                                      child: progress.imageUrl.isNotEmpty
                                          ? Image.network(
                                              progress.imageUrl,
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                // While loading, show loader
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            (loadingProgress
                                                                .expectedTotalBytes!)
                                                        : null,
                                                  ),
                                                );
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                    AppImages.UIimage,
                                                    fit: BoxFit.cover);
                                              },
                                            )
                                          : Image.asset(AppImages.UIimage,
                                              fit: BoxFit.cover),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Divider(
                                            thickness: 1,
                                            color: AppColors.buttoncolor),
                                        Text(
                                          progress.courseName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: AppColors.buttoncolor,
                                          ),
                                        ),
                                        Divider(
                                            thickness: 1,
                                            color: AppColors.buttoncolor),
                                        const SizedBox(height: 8),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.16,
                                              height: screenHeight * 0.08,
                                              child: CircularProgressIndicator(
                                                value: progress.progress / 100,
                                                strokeWidth: 6,
                                                backgroundColor:
                                                    Colors.grey[200],
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                        Color>(Colors.blue),
                                              ),
                                            ),
                                            Text("${progress.progress}%",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          progress.status,
                                          style: TextStyle(
                                              color: AppColors.buttoncolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/attendence');
                          },
                          child: Container(
                            height: screenHeight * 0.32,
                            width: screenWidth * 0.5,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Color.fromARGB(255, 174, 226, 250)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    AppImages.cicleimage,
                                    width: screenWidth * 0.4,
                                    height: screenHeight * 0.18,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Present:",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Color(0xffeafaf1),
                                            border: Border.all(
                                                color: Colors.green, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            "P = 22",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.04,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Absent:",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Color(0xfffce9e9),
                                            border: Border.all(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            "A = 6",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.6),
                    child: Text("Course Schedule",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        "Mon",
                        "Tue",
                        "Wed",
                        "Thu",
                        "Fri",
                        "Sat",
                        "Sun"
                      ]
                          .map((day) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDay = day;
                                    });
                                  },
                                  child: Chip(
                                    label: Text(day),
                                    backgroundColor: selectedDay == day
                                        ? Colors.blue
                                        : Colors.grey[200],
                                    labelStyle: TextStyle(
                                      color: selectedDay == day
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.96,
                    decoration: BoxDecoration(
                      color: Color(0xffe3f2fd),
                      border: Border.all(color: Colors.lightBlueAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Container(
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.92,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.06,
                              width: screenHeight * 0.08,
                              child: Image.asset(
                                AppImages.UIimage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("UI/UX Designing",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightBlue)),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    Text("6:00 e-clock",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Column(
                                    children: [
                                      Text("Mentor",
                                          style: TextStyle(color: Colors.blue)),
                                      Container(
                                        height: 36,
                                        width: 122,
                                        decoration: BoxDecoration(
                                          color: AppColors.buttoncolor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 6),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  AppImages.course1image),
                                              radius: 12,
                                            ),
                                            SizedBox(width: 6),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "M.Hanzla",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "UI/UX Designer",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: Text("Assignments",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      SizedBox(
                        width: screenWidth * 0.4,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed('/assigment');
                          },
                          child: Text("View More",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                      height: screenHeight * 0.15,
                      width: screenWidth * 0.96,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Chip(
                                  label: Text(
                                    "Wireframe & Prototyping",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  backgroundColor: AppColors.buttoncolor,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.01),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Chip(
                                        label: Text("Total Marks:100",
                                            style: TextStyle(fontSize: 10)),
                                        backgroundColor: Colors.green[100],
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 7),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      width: 120,
                                      child: Chip(
                                        label: Text("Obtain Marks:100",
                                            style: TextStyle(fontSize: 10)),
                                        backgroundColor: Colors.orange[100],
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Text("Date : 01-22-2023",
                                  style: TextStyle(fontSize: 10)),
                              SizedBox(height: 8),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.12,
                                    height: screenHeight * 0.06,
                                    child: CircularProgressIndicator(
                                      value: 0.4,
                                      strokeWidth: 6,
                                      backgroundColor: Colors.grey[200],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.blue),
                                    ),
                                  ),
                                  Text("100%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("Marks",
                                  style:
                                      TextStyle(color: AppColors.buttoncolor)),
                            ],
                          )
                        ],
                      ))
                ],
              )),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.03, left: screenWidth * 0.01),
            child: Row(
              children: [
                Text("Upcoming Events", style: TextStyle(fontSize: 20)),
                GestureDetector(
                  onTap: () => Get.toNamed('/eventscreen'),
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.3),
                    child: Text("View All",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.buttoncolor)),
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            if (eventController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (eventController.eventList.isEmpty) {
              return Text("No events found");
            } else {
              return SizedBox(
                height: screenWidth * 0.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2, // Only 2 events
                  itemBuilder: (context, index) {
                    final event = eventController.eventList[index];
                    return EventCard(event: event);
                  },
                ),
              );
            }
          }),
          SizedBox(
            height: screenHeight * 0.1,
          )
        ],
      ),
    ));
  }

  Widget _feeCard({
    required String title,
    required String amount,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6),
          Text(
            amount,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
