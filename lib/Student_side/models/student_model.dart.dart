

class StudentModel {
  final String uid;
  final String name;
  final String email;
  final int totalFee;
  final int submittedFee;
  final int pendingFee;
  final Attendance attendance;
  final String classId;
  final Map<String, CourseProgress> courseProgress;
  final List<AssignmentModel> assignments; // 🔹 New field

  StudentModel({
    required this.uid,
    required this.classId,
    required this.name,
    required this.email,
    required this.totalFee,
    required this.submittedFee,
    required this.pendingFee,
    required this.attendance,
    required this.courseProgress,
    required this.assignments, // 🔹 New field
  });

  factory StudentModel.fromMap(Map<String, dynamic> map, String uid, {List<AssignmentModel> assignments = const []}) {
    print(" Raw student map: $map");

    final courseMap = map['courseProgress'] as Map<String, dynamic>? ?? {};
    final courseProgress = courseMap.map((key, value) {
      if (value is Map<String, dynamic>) {
        return MapEntry(key, CourseProgress.fromMap(value));
      } else {
        return MapEntry(key, CourseProgress(progress: 0, title: '', image: '', status: '', imageUrl: ''));
      }
    });

    return StudentModel(
      uid: uid,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      totalFee: map['totalFee'] is int ? map['totalFee'] : int.tryParse(map['totalFee'].toString()) ?? 0,
      submittedFee: map['submittedFee'] is int ? map['submittedFee'] : int.tryParse(map['submittedFee'].toString()) ?? 0,
      pendingFee: map['pendingFee'] is int ? map['pendingFee'] : int.tryParse(map['pendingFee'].toString()) ?? 0,
      attendance: map['attendance'] != null && map['attendance'] is Map<String, dynamic>
          ? Attendance.fromMap(map['attendance'])
          : Attendance(present: 0, absent: 0),
      courseProgress: courseProgress,
      classId: map['classId'] ?? '',
      assignments: assignments, // 🔹 Assignments list
    );
  }
}


class Attendance {
  final int present;
  final int absent;

  Attendance({required this.present, required this.absent});

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      present: (map['present'] ?? 0) is int
          ? map['present']
          : int.tryParse(map['present'].toString()) ?? 0,
      absent: (map['absent'] ?? 0) is int
          ? map['absent']
          : int.tryParse(map['absent'].toString()) ?? 0,
    );
  }
}

class CourseProgress {
  final int progress;
  final String title;
  final String image;
  final String status;
  final String  imageUrl;

  CourseProgress({
    required this.progress,
    required this.title,
    required this.image,
    required this.status,
    required this.imageUrl,
  });

  factory CourseProgress.fromMap(Map<String, dynamic> map) {
      print("courseProgress from map: $map");
    return CourseProgress(
     progress: map['progress'] ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      status: map['status'] ?? '',
        imageUrl: map['imageUrl'] ?? '',
    );
  }
}
  class AssignmentModel {
  final String id;
  final String title;
  final int totalMarks;
  final int obtainedMarks;
  final String date;
  final int progress;


  AssignmentModel({
    required this.id,
    required this.title,
    required this.totalMarks,
    required this.obtainedMarks,
    required this.date,
    required this.progress,
  
  });

  factory AssignmentModel.fromMap(Map<String, dynamic> map, String id) {
    return AssignmentModel(
      id: id,
      title: map['title'] ?? '',
      totalMarks: map['totalMarks'] ?? 0,
      obtainedMarks: map['obtainedMarks'] ?? 0,
      date: map['date'] ?? '',
      progress: map['progress'] ?? 0,
     
    );
  }

}

