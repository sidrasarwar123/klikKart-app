class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? imageUrl;
  final String? phone;
  final String? address;
  final String designation;
  final String cnic;
  final String? gender;
  final bool isTeacher;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
      required this.designation,
          required this.cnic,
    required this.imageUrl,
    required this.phone,
   required this.address,
   required this.gender,
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
        'cnic': cnic,
         'designation': designation,
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
         cnic: map['cnic'] ?? '',
      gender: map['gender'] as String?,
      isTeacher: map['isTeacher'] as bool? ?? false,
         designation: map['designation'] ?? '',
    );
  }
}
