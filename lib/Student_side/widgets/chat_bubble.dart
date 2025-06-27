import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 6),
      padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
      decoration: BoxDecoration(
        color: isUser ? Color(0xFF1169BD) : Colors.black87,
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(12),
          topRight:  Radius.circular(12),
          bottomLeft: Radius.circular(isUser ? 12 : 0),
          bottomRight: Radius.circular(isUser ? 0 : 12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(color: Colors.white70, fontSize: 10),
          ),
        ],
      ),
    );
  }
}