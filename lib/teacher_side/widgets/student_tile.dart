import 'package:flutter/material.dart';
import 'package:klik_kart/teacher_side/models/student_model.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  final Function(bool) onStatusChange;

  const StudentTile({
    required this.student,
    required this.onStatusChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.007,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.01,
        ),
        leading: Container(
          width: screenWidth * 0.28,
          padding: EdgeInsets.all(screenWidth * 0.02),
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                student.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.035,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                "Roll no: ${student.rollNo}",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: student.ispresent == true,
              onChanged: (val) => onStatusChange(true),
              activeColor: Colors.green,
            ),
            Checkbox(
              value: student.ispresent == false,
              onChanged: (val) => onStatusChange(false),
              activeColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
