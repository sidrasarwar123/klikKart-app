import 'package:flutter/material.dart';
import 'package:klik_kart/Student_side/widgets/chat_bubble.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.buttoncolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.03),
              child: Row(
                children: [
                  Container(
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppImages.iconimage)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin',
                          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.lightGreenAccent, size: 15),
                            SizedBox(width: 4),
                            Text('Active', style: TextStyle(color: Colors.lightGreenAccent, fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          
          Expanded(
            child: ListView(
              padding:  EdgeInsets.all(16),
              children:  [
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    message: "Not much, just hanging out at home. How about you?",
                    time: "12:33 PM",
                    isUser: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    message: "Same here. I've been trying to stay busy by working on some art projects.",
                    time: "12:34 PM",
                    isUser: false,
                  ),
                  
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    message: "That sounds cool. What kind of art are you into?",
                    time: "12:34 PM",
                    isUser: true,
                  ),
                ),
              ],
            ),
          
          ),

      
         
           Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:  EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                 SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: AppColors.textcolor,
                  child: Icon(Icons.send, color:AppColors.buttoncolor),
                ),
                SizedBox(height: screenHeight*0.3,)
              ],
            ),
        
        ],
      ),
    );
  }
}
