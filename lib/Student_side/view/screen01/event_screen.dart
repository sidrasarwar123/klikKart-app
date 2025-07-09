import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/models/event.dart';
import 'package:klik_kart/Student_side/widgets/event_widget.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';

class EventScreen extends StatelessWidget {
   EventScreen({super.key});

    final List<Event> events = [
    Event(title: "Mango Festival", date: "19 May,2024", imageUrl: AppImages.event1image),
    Event(title: "14 August", date: "14 Aug,2024", imageUrl: AppImages.event2image),
    Event(title: "Annual Dinner", date: "22 june,2024", imageUrl: AppImages.event3image),
    Event(title: "14 August", date: "29 sept,2024", imageUrl: AppImages.event4image),
    Event(title: "Mango Festival", date: "19 May,2024", imageUrl: AppImages.event1image),
    Event(title: "14 August", date: "14 Aug,2024", imageUrl: AppImages.event2image)
  ]; 
    




  @override
  Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Upcoming Event"),
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
      body: Padding(
        padding:  EdgeInsets.all(1),
        child: GridView.count(
          crossAxisCount: 2, 
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: events.map((event) {
            return InkWell(
              onTap: () => Get.toNamed('/eventscreen'),
              child: EventCard(event: event),
            );
          }).toList(),
        ),
      )
        
    
    );
  }
}


