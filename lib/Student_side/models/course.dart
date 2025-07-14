import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String title;
  final String imageUrl;
  final double rating;
  final int lessons;
  final int price;

  CourseModel({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.lessons,
    required this.price,
  });

  factory CourseModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CourseModel(
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      lessons: data['lessons'] ?? 0,
      price: data['price'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'lessons': lessons,
      'price': price,
    };
  }
}
