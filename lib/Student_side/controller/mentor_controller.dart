import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mentor_model.dart';

class MentorController extends GetxController {
  RxList<MentorModel> mentorList = <MentorModel>[].obs;
  RxBool isLoading = false.obs;

  // @override
  // void onInit() {
  //   fetchMentors();
  //   super.onInit();
  // }

  void fetchMentors() async {
    await Future.delayed(Duration.zero);
    isLoading.value = true;
    try {
      final snapshot = await FirebaseFirestore.instance.collection('mentor').get();
      mentorList.value = snapshot.docs.map((doc) => MentorModel.fromMap(doc.data())).toList();
    } catch (e) {
      print("Error fetching mentors: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
