import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId) async {
    final QuerySnapshot userData = await _firestore
        .collection('userdata')
        .where('uid', isEqualTo: uId)
        .get();

    return userData.docs;
  }
}