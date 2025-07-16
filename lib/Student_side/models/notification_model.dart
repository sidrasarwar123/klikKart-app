// models/notification_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class AppNotification {
  final String title;
  final String description;
  final String icon;
  final String color;
  final DateTime time;

  AppNotification({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.time,
  });

  factory AppNotification.fromMap(Map<String, dynamic> map) {
    return AppNotification(
      title: map['title'],
      description: map['description'],
      icon: map['icon'],
      color: map['color'],
      time: (map['time'] as Timestamp).toDate(),
    );
  }
}
