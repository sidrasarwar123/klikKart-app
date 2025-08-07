class StudentModel {
  final String uid;
  final String name;
  final String email;
  final int totalFee;
  final int submittedFee;
  final int pendingFee;
  final Attendance attendance;
  final Map<String, CourseProgress> courseProgress;

  StudentModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.totalFee,
    required this.submittedFee,
    required this.pendingFee,
    required this.attendance,
    required this.courseProgress,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map, String uid) {
      print(" Raw student map: $map");
    final courseMap = map['courseProgress'] as Map<String, dynamic>? ?? {};

    final courseProgress = courseMap.map((key, value) {
      if (value is Map<String, dynamic>) {
        return MapEntry(key, CourseProgress.fromMap(value));
      } else {
        return MapEntry(key, CourseProgress(progress: 0, title: '', image: '', status: ''));
      }
    });

    return StudentModel(
      uid: uid,
   
   name: map['name'] ?? '',
    email: map['email'] ?? '',
    totalFee: map['totalFee'] is int ? map['totalFee'] : int.tryParse(map['totalFee'].toString()) ?? 0,
    submittedFee: map['submittedFee'] is int ? map['submittedFee'] : int.tryParse(map['submittedFee'].toString()) ?? 0,
    pendingFee: map['pendingFee'] is int ? map['pendingFee'] : int.tryParse(map['pendingFee'].toString()) ?? 0,
      attendance: map['attendance'] != null &&
              map['attendance'] is Map<String, dynamic>
          ? Attendance.fromMap(map['attendance'])
          : Attendance(present: 0, absent: 0),
      courseProgress: courseProgress,
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

  CourseProgress({
    required this.progress,
    required this.title,
    required this.image,
    required this.status,
  });

  factory CourseProgress.fromMap(Map<String, dynamic> map) {
      print("courseProgress from map: $map");
    return CourseProgress(
     progress: map['progress'] ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      status: map['status'] ?? '',
    );
  }
}
