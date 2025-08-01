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
      uid: map['uid'] as String? ?? '',
      email: map['email'] as String? ?? '',
      name: map['name'] as String? ?? '',
      imageUrl: map['imageUrl'] as String?,
      phone: map['phone'] as String?,
      address: map['address'] as String?,
      gender: map['gender'] as String?,
      isTeacher: map['isTeacher'] as bool? ?? false,
    );
  }
}
