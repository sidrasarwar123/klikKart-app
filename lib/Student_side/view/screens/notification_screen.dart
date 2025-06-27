import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "section": "Today",
      "items": [
        {
          "icon": Icons.calendar_today,
          "title": "Holiday!",
          "description": "Institute will be closed for holidays from 6 to 7. Enjoy your break!",
          "time": "2 days ago",
          "color": Colors.green
        },
        {
          "icon": Icons.notifications_active,
          "title": "Fee Reminder",
          "description": "Your fee for 1 term is due by 27 Sept 2024. Please make the payment to avoid penalties.",
          "time": "2 days ago",
          "color": Colors.red
        },
      ]
    },
    {
      "section": "Yesterday",
      "items": [
        {
          "icon": Icons.book,
          "title": "Exam",
          "description": "Your upcoming test (Photocopying) is scheduled for 22 Sept 2024. Please ensure you are prepared.",
          "time": "1 day ago",
          "color": Colors.lightGreen
        },
        {
          "icon": Icons.sports_basketball,
          "title": "Sports",
          "description": "Conducting age talent for our Annual Basketball Championship.",
          "time": "1 day ago",
          "color": Colors.orange
        },
      ]
    },
    {
      "section": "Older",
      "items": [
        {
          "icon": Icons.book,
          "title": "Exam",
          "description": "Your final exam of Chemistry is scheduled for 15 Sept 2024. Make your notes in advance.",
          "time": "4 days ago",
          "color": Colors.green
        },
        {
          "icon": Icons.sports_basketball,
          "title": "Sports",
          "description": "Previous match schedule has been updated.",
          "time": "5 days ago",
          "color": Colors.orange
        },
      ]
    },
  ];
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
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          var section = notifications[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  section['section'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ...section['items'].map<Widget>((item) {
                return Card(
  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: item['color'],
          child: Icon(item['icon'], color: Colors.white),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['title'],
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(item['description']),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  item['time'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  ),
);
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}