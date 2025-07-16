import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Student_side/models/user_model.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    RxBool isLoading = false.obs;
    Rx<UserModel?> userModel = Rx<UserModel?>(null);
       final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId) async {
    final QuerySnapshot userData = await _firestore
        .collection('userdata')
        .where('uid', isEqualTo: uId)
        .get();

    return userData.docs;
  }
   Future<void> fetchUserData() async {
    isLoading.value = true;
    final uid = _auth.currentUser?.uid;
    if (uid != null) {
      final doc = await _firestore.collection('userdata').doc(uid).get();
      if (doc.exists) {
      userModel.value= UserModel.fromMap(doc.data()!);
      }
    }
    isLoading.value = false;
  }

  Future<void> updateUserField(String field, String value) async {
    final uid = _auth.currentUser?.uid;
    if (uid != null) {
      await _firestore.collection('userdata').doc(uid).update({field: value});
      await fetchUserData();
    }
  }

  
}
