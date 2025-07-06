import 'package:flutter/material.dart';

import 'package:klik_kart/teacher_side/models/course_model.dart.dart'; // ✅ correct import

class coursecardModel extends StatelessWidget {
  final CourseModel course;

  const coursecardModel({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.indigo],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                course.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            course.subtitle,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
