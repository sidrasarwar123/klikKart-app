import 'package:flutter/material.dart';
import 'package:klik_kart/teacher_side/models/attendence_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class attendencecaed extends StatelessWidget {
  final AttendanceModel model;

  const attendencecaed({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.015,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.015,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1B4F9C), Color(0xFF0F2C63)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.subject,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Class: ${model.className}",
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
           Spacer(),
          CircularPercentIndicator(
            radius: screenWidth * 0.07,
            lineWidth: 6.0,
            percent: model.presentPercent,
            center:
                Text("${(model.presentPercent * 100).toInt()}%"),
            progressColor: Colors.green,
            backgroundColor: Colors.grey.shade300,
          ),
          SizedBox(width: screenWidth * 0.02),
          CircularPercentIndicator(
            radius: screenWidth * 0.07,
            lineWidth: 6.0,
            percent: model.absentPercent,
            center:
                Text("${(model.absentPercent * 100).toInt()}%"),
            progressColor: Colors.red,
            backgroundColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
