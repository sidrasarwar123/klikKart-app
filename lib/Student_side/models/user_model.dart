class UserModel {
  final String uid;
  final String email;
  final bool isTeacher;

  UserModel({required this.uid, required this.email, required this.isTeacher});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'isTeacher': isTeacher,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      isTeacher: map['isTeacher'],
    );
  }
}
