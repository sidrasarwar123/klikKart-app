import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/controller/profile_controller.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ProfileController profileController=Get.put(ProfileController());
  void initState() {
  super.initState();
  profileController.fetchNotifications();
}
  final Map<String, IconData> IconsMap = {
    "calendar_today": Icons.calendar_today,
    "notifications_active": Icons.notifications_active,
    "book": Icons.book,
    "sports_basketball": Icons.sports_basketball,
  };

  @override
  Widget build(BuildContext context) {
       final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
     appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Notification"),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              AppIcons.arrowicon,
              color: AppColors.buttoncolor,
              size: 30,
            )),
      ),
      body:Obx(() {
        final notifications = profileController.notifications;
        if (notifications.isEmpty) {
          return Center(child: Text("No notifications available"));
        }

        return ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notif = notifications[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(int.parse("0xFF${notif.color.replaceAll("#", "")}")),
                  child: Icon(IconsMap[notif.icon] ?? Icons.notifications),
                ),
                title: Text(notif.title),
                subtitle: Text(notif.description),
                trailing: Text(
                  timeAgo(notif.time),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  String timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inDays >= 1) return "${diff.inDays} days ago";
    if (diff.inHours >= 1) return "${diff.inHours} hrs ago";
    return "${diff.inMinutes} mins ago";
  }
}
  