import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klik_kart/Student_side/controller/chat_controller.dart';
import 'package:klik_kart/Student_side/widgets/chat_bubble.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final ChatController chatController = Get.put(ChatController());

  final ScrollController _scrollController = ScrollController();

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
  child: Obx(() {
    final messages = chatController.messages;
    if (messages.isEmpty) {
      return const Center(child: Text("No messages yet"));
    }

  return ListView.builder(
    itemCount: chatController.messages.length,
    itemBuilder: (context, index) {
      final msg = chatController.messages[index].data() as Map<String, dynamic>;
      final isUser = msg['senderId'] == chatController.userId;
return ChatBubble(
  message: msg['message'],
  time: (msg['timestamp'] as Timestamp?)?.toDate().toLocal().toString().substring(11, 16) ?? '',
  isMe: isUser, 
);
      },
    );
  }),
),

         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: chatController.messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => chatController.sendMessage(),
                  child: const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),SizedBox(height: 100,)
        ],
      ),
    );
  }
}