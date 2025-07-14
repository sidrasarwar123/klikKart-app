import 'package:cloud_firestore/cloud_firestore.dart';

class SuccessStoryModel {
  final String name;
  final String courseType;
  final String imageUrl;
  final String description;
  final String courseColor;

  SuccessStoryModel({
    required this.name,
    required this.courseType,
    required this.imageUrl,
    required this.description,
    required this.courseColor,
  });

  // From Firestore
  factory SuccessStoryModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SuccessStoryModel(
      name: data['name'] ?? '',
      courseType: data['courseType'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      description: data['description'] ?? '',
      courseColor: data['courseColor'] ?? '#000000',
    );
  }

  // To Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'courseType': courseType,
      'imageUrl': imageUrl,
      'description': description,
      'courseColor': courseColor,
    };
  }
}
