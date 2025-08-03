class Student {
  final String name;
  final String rollNo;
  bool? ispresent;

  Student({
    required this.name,
    required this.rollNo,
    this.ispresent,
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] ?? '',
      rollNo: map['rollNo'] ?? '',
      ispresent: map['isPresent'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rollNo': rollNo,
      'isPresent': ispresent ?? false,
    };
  }
}
