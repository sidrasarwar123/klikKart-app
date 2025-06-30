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



// import 'package:flutter/material.dart';



// class EventScreen extends StatelessWidget {
//   final List<Event> events = [
//     Event('Mango Festival', '18 May 2024', 'assets/mango.jpg'),
//     Event('14 August', '14 August 2024', 'assets/august.jpg'),
//     Event('Annual Dinner', '25 July 2024', 'assets/dinner.jpg'),
//     Event('Kashmir Trip', '1 Sep 2024', 'assets/kashmir.jpg'),
//     Event('Mango Festival', '18 May 2024', 'assets/mango.jpg'),
//     Event('14 August', '14 August 2024', 'assets/august.jpg'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(),
//         title: Text('Upcoming Events'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           itemCount: events.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 12,
//             crossAxisSpacing: 12,
//             childAspectRatio: 1.1,
//           ),
//           itemBuilder: (context, index) {
//             return EventCard(event: events[index]);
//           },
//         ),
//       ),
//     );
//   }
// }

// class Event {
//   final String title;
//   final String date;
//   final String imagePath;

//   Event(this.title, this.date, this.imagePath);
// }

// class EventCard extends StatelessWidget {
//   final Event event;

//   const EventCard({required this.event});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.asset(
//                 event.imagePath,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: Text(event.title, style: TextStyle(fontWeight: FontWeight.bold)),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6.0),
//             child: Text(event.date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
//           ),
//           SizedBox(height: 4),
//         ],
//       ),
//     );
//   }
// }