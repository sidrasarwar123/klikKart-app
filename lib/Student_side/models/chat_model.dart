import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String message;
  final String senderId;
  final String time;
  final Timestamp timestamp;

  ChatMessage({
    required this.message,
    required this.senderId,
    required this.time,
    required this.timestamp,
  });

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      message: map['message'] ?? '',
      senderId: map['senderId'] ?? '',
      time: map['time'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'senderId': senderId,
      'time': time,
      'timestamp': timestamp,
    };
  }
}
