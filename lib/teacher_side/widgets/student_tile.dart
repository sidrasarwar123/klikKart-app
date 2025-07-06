import 'package:flutter/material.dart';
import 'package:klik_kart/teacher_side/models/student_model.dart';


class StudentTile extends StatelessWidget {
  final Student student;
  final Function(bool) onStatusChange;

  const StudentTile({required this.student, required this.onStatusChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: ListTile(
        leading: Container(
          width: 100,
          padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(student.name, style: TextStyle(color: Colors.white, fontSize: 14)),
              Text("Roll no: ${student.rollNo}", style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: student.ispresent==true,
              onChanged: (val) => onStatusChange(true),
              activeColor: Colors.green,
            ),
            Checkbox(
              value: student.ispresent==false,
              onChanged: (val) => onStatusChange(false),
              activeColor: Colors.red,
            ),
          ],
        ),
      ),
    );
    
  }
}