import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:klik_kart/Student_side/models/userprofile_model.dart';

class UserController extends GetxController {
  Rx<UserprofileModel> currentUser = UserprofileModel(
    name: '',
    gender: '',
    phone: '',
    address: '',
    email: '',
  ).obs;

  RxBool isLoading = false.obs;

  Future<void> fetchUserData(String uid) async {
    isLoading.value = true;
    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (doc.exists) {
      currentUser.value = UserprofileModel.fromMap(doc.data()!);
    }
    isLoading.value = false;
  }

  Future<void> updateUserData(String uid, UserprofileModel updatedUser) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update(updatedUser.toMap());
    currentUser.value = updatedUser;
  }
}
