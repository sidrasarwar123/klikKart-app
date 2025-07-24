class CourseModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final int price;
  final String lesson; // <-- single lesson field
  final Instructor instructor;
  final List<LessonModel> lessons;
  final List<ReviewModel> reviews;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.lesson, // <-- include in constructor
    required this.instructor,
    required this.lessons,
    required this.reviews,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json, String id) {
    return CourseModel(
      id: id,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      price: (json['price'] ?? 0).toInt(),
         lesson: json['lesson']?.toString() ?? '', 
      instructor: Instructor.fromJson(json['instructor'] ?? {}),
      lessons: (json['lessons'] as List<dynamic>? ?? [])
          .map((lesson) => LessonModel.fromJson(lesson))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
    );
  }
}



class Instructor {
  final String name;
  final String role;
  final String imageUrl;

  Instructor({
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}

class LessonModel {
  final String title;
  final String lesson;

  LessonModel({required this.title, required this.lesson});

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      title: json['title'] ?? '',
      lesson: json['lesson'] ?? '',
    );
  }
  @override
   String toString(){
    return '';
   }
  }


class ReviewModel {
  final String name;
  final String date;
  final String message;
  final String imageUrl;

  ReviewModel({
    required this.name,
    required this.date,
    required this.message,
    required this.imageUrl,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] ?? '',
      date: json['date'] ?? '',
      message: json['message'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}