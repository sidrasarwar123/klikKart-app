import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<QueryDocumentSnapshot> messages = <QueryDocumentSnapshot>[].obs;
  TextEditingController messageController = TextEditingController();

  late String userId;
  final String adminId = "adminUID"; 
  late String chatId;
  late Stream<QuerySnapshot> messageStream;

  @override
  void onInit() {
    super.onInit();
    userId = _auth.currentUser?.uid ?? "";
    chatId = generateChatId(adminId, userId); 
    print("✅ Current User ID: $userId");
    print("🔐 Chat ID: $chatId");
    _listenToMessages();
  }

  String generateChatId(String id1, String id2) {
    final sorted = [id1, id2]..sort();
    return "${sorted[0]}_${sorted[1]}";
  }

  void _listenToMessages() {
    print("📡 Listening to: chats/$chatId/messages");

    messageStream = _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();

    messageStream.listen((snapshot) {
      messages.value = snapshot.docs;
      print("📥 Received ${snapshot.docs.length} messages");
    }, onError: (e) {
      print("❌ Error in messageStream: $e");
    });
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    // Add or update main chat doc
    await _firestore.collection("chats").doc(chatId).set({
      "participants": [adminId, userId],
      "lastMessage": text,
      "updatedAt": FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    // Add actual message
    await _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .add({
      "senderId": userId,
      "message": text,
      "timestamp": FieldValue.serverTimestamp(),
    });

    messageController.clear();
    print("✅ Message sent: $text");
  }
}
