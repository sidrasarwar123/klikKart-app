class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? imageUrl;
  final String? phone;
  final String? address;
  final String? gender;
  final bool isTeacher;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.imageUrl,
    this.phone,
    this.address,
    this.gender,
    required this.isTeacher,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'imageUrl': imageUrl ?? '',
      'phone': phone ?? '',
      'address': address ?? '',
      'gender': gender ?? '',
      'isTeacher': isTeacher,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      phone: map['phone'],
      address: map['address'],
      gender: map['gender'],
      isTeacher: map['isTeacher'],
    );
  }
}
