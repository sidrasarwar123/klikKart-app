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
  final String adminId = "adminUID"; // 🔁 Replace with your real admin UID
  late String chatId;
  late Stream<QuerySnapshot> messageStream;

  @override
  void onInit() {
    super.onInit();
    userId = _auth.currentUser?.uid ?? "";
    chatId = generateChatId(adminId, userId); // 🔑 Generate chat ID
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
      print("📥 Received ${snapshot.docs.length} messages");

      if (snapshot.docs.isEmpty) {
        print("⚠️ No messages found. Either collection is empty or chatId is incorrect.");
      } else {
        for (var doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;

          // 🔍 Check structure
          if (!data.containsKey('message') || !data.containsKey('senderId') || !data.containsKey('timestamp')) {
            print("❌ Structure issue in document: ${doc.id}");
            print("🔍 Data: $data");
          } else {
            print("✅ Message: ${data['message']} from ${data['senderId']}");
          }
        }
      }

      messages.value = snapshot.docs;
    }, onError: (e) {
      print("❌ Error in messageStream: $e");
    });
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) {
      print("⚠️ Message is empty, nothing to send.");
      return;
    }

    print("📤 Sending message: $text");

    // Update chat info
    await _firestore
        .collection("chats")
        .doc(chatId)
        .set({
          "participants": [adminId, userId],
          "lastMessage": text,
          "updatedAt": FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

    // Send actual message
    await _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .add({
          "senderId": userId,
          "message": text,
          "timestamp": FieldValue.serverTimestamp(),
        });

    print("✅ Message sent successfully.");
    messageController.clear();
  }
}