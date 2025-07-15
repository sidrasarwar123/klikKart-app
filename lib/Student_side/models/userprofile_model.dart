class UserprofileModel {
  String name;
  String gender;
  String phone;
  String address;
  String email;

  UserprofileModel({
    required this.name,
    required this.gender,
    required this.phone,
    required this.address,
    required this.email,
  });

  factory UserprofileModel.fromMap(Map<String, dynamic> map) {
    return UserprofileModel(
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'phone': phone,
      'address': address,
      'email': email,
    };
  }
}
