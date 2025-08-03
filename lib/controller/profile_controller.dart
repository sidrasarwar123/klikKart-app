import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/models/notification_model.dart';
import 'package:klik_kart/Student_side/models/user_model.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  RxList<AppNotification> notifications = <AppNotification>[].obs;
  RxBool isLoading = false.obs;
  Rx<UserModel?> userModel = Rx<UserModel?>(null);

  @override
  void onInit() {
    fetchUserData();
    fetchNotifications(); 
    super.onInit();
  }

 Future<Map<String, dynamic>?> getSingleUserData(String uid) async {
  final doc = await _firestore.collection('userdata').doc(uid).get();
  if (doc.exists && doc.data() != null) {
    return doc.data() as Map<String, dynamic>;
  }
  return null;
}

  Future<void> fetchUserData() async {
    isLoading.value = true;
    final uid = _auth.currentUser?.uid;
    if (uid != null) {
      final doc = await _firestore.collection('userdata').doc(uid).get();
      if (doc.exists) {
        userModel.value = UserModel.fromMap(doc.data()!);
      }
    }
    isLoading.value = false;
  }

  Future<void> updateUserField(String field, String value) async {
    final uid = _auth.currentUser?.uid;
    if (uid != null) {
      await _firestore.collection('userdata').doc(uid).update({field: value});
      await fetchUserData();
    }
  }

  Future<void> addNotificationAndShow({
    required String title,
    required String description,
    required String icon,
    required String color,
  }) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore
        .collection("notifications")
        .doc(uid)
        .collection("usernotification")
        .add({
      "title": title,
      "description": description,
      "icon": icon,
      "color": color,
      "time": Timestamp.now(),
    });

    Get.snackbar(title, description,
        backgroundColor: Colors.white,
        icon: Icon(IconsMap[icon] ?? Icons.notifications),
        colorText: Colors.black);

    fetchNotifications(); // Refresh list
  }

  Future<void> fetchNotifications() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final querySnapshot = await _firestore
        .collection('notifications')
        .doc(uid)
        .collection('usernotification')
        .orderBy('time', descending: true)
        .get();

    notifications.value =
        querySnapshot.docs.map((doc) => AppNotification.fromMap(doc.data())).toList();
  }

  final Map<String, IconData> IconsMap = {
    "calendar_today": Icons.calendar_today,
    "notifications_active": Icons.notifications_active,
    "book": Icons.book,
    "sports_basketball": Icons.sports_basketball,
  };
}
