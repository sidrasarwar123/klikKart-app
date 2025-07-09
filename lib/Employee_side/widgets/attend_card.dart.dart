import 'package:flutter/material.dart';
import 'package:klik_kart/Employee_side/model/emp_attend_model.dart';

class AttendanceTile extends StatelessWidget {
  final EmployeeAttendanceModel data;

  const AttendanceTile({super.key, required this.data});

  Color getStatusColor(String status) {
    switch (status) {
      case "Full Day":
        return Colors.green;
      case "Absent":
        return Colors.red;
      case "Early Leave":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.02),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  
          Container(
            width: screenWidth * 0.15,
            height: screenWidth * 0.16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.date, style:  TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                Text(data.day, style:  TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.03),


          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.access_time, size: 25, color: Colors.grey),
                    SizedBox(height: 4),
                    Text(data.clockIn, style: TextStyle(fontSize: 12)),
                    Text("Clock In", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),

      
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.access_time_outlined, size: 25, color: Colors.grey),
                    SizedBox(height: 4),
                    Text(data.clockOut, style: TextStyle(fontSize: 12)),
                    Text("Clock Out", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),

              
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_outline, size: 25, color: Colors.green),
                    SizedBox(height: 4),
                    Text(data.totalHours, style: TextStyle(fontSize: 12)),
                    Text("Total Hrs", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  
                  ],
                ),
                Column(
                  children: [
                       SizedBox(height: 6),

               
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: getStatusColor(data.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        data.status,
                        style: TextStyle(
                          color: getStatusColor(data.status),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),

                    // Regular badge
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade200,
                      ),
                      child: Text(
                        data.type,
                        style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
