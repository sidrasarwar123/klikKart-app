import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/Student_side/controller/event_controller.dart';
import 'package:klik_kart/Student_side/widgets/event_widget.dart';

class EventScreen extends StatelessWidget {
  final eventController = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Events"),
        leading: BackButton(),
      ),
      body: Obx(() {
        if (eventController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (eventController.eventList.isEmpty) {
          return Center(child: Text("No events available"));
        } else {
          return 
             SizedBox(
       child: GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 0.90,
    children: eventController.eventList.map((event) {
      return SizedBox(
        height: screenHeight * 0.3, // You can adjust to 0.35 or 0.4 for taller cards
        child: EventCard(event: event),
      );
    }).toList(),
  ),


             );
        }
      }),
    );
  }
}
