// class UserModel {
//   String userId;
//   String name;
//   String email;
//   bool isTeacher; 
//   UserModel({
//     required this.userId,
//     required this.name,
//     required this.email,
  
//     required this.isTeacher, 
//   });

//   // Convert Firestore Document to UserModel
//   factory UserModel.fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return UserModel(
//       userId: data['userId'] ?? '',
//       name: data['name'] ?? '',
//       email: data['email'] ?? '',
     
//       isTeacher: data['isTeacher'] ?? false, 
//     );
//   }

//   // Convert UserModel to Firestore Document
//   Map<String, dynamic> toFirestore() {
//     return {
//       'userId': userId,
//       'name': name,
//       'email': email,
     
//       'isTeacher': isTeacher, 
//     };
//   }
// }