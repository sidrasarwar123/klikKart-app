import 'package:flutter/material.dart';

Widget leaveCard({
  required String title,
  required String description,
  required String date,
  required String status,
  required Color color,
  required BuildContext context, 
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Container(
    margin: EdgeInsets.only(bottom: 8),
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.04,
      vertical: screenHeight * 0.015,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        Container(
          margin: EdgeInsets.only(top: screenHeight*0.02),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: screenWidth*0.03),

      
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black)),
              SizedBox(height: 4),
              Text(description,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),

      
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(date,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700])),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: status == "Approved"
                    ? Colors.green
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: status == "Approved" ? Colors.white : Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
