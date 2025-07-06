import 'package:flutter/material.dart';
import 'package:klik_kart/teacher_side/models/attendence_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class attendencecaed extends StatelessWidget {
  final AttendanceModel model;

  const attendencecaed({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          // Subject Box
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient:  LinearGradient(
                colors: [Color(0xFF1B4F9C), Color(0xFF0F2C63)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.subject,
                    style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Class:${model.className}", style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Spacer(),
  
          CircularPercentIndicator(
            radius: 28,
            lineWidth: 6.0,
            percent: model.presentPercent,
            center: Text("${(model.presentPercent * 100).toInt()}%"),
            progressColor: Colors.green,
            backgroundColor: Colors.grey.shade300,
          ),
         SizedBox(width: 10),
        
          CircularPercentIndicator(
            radius: 28,
            lineWidth: 6.0,
            percent: model.absentPercent,
            center: Text("${(model.absentPercent * 100).toInt()}%"),
            progressColor: Colors.red,
            backgroundColor: Colors.grey.shade300,
          ),
        ],
        
      ),
    );
  }
}
