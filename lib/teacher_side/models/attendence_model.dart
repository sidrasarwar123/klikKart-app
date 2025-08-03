class AttendanceModel {
  final String name;
  final String rollNo;
  final bool isPresent;

  AttendanceModel({
    required this.name,
    required this.rollNo,
    required this.isPresent,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rollNo': rollNo,
      'isPresent': isPresent,
    };
  }

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      name: map['name'] ?? '',
      rollNo: map['rollNo'] ?? '',
      isPresent: map['isPresent'] ?? false,
    );
  }
}
