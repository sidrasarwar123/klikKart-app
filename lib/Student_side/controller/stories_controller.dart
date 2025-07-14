import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klik_kart/Student_side/models/succes_stories.dart';


class SuccessStoryModelController extends GetxController {
  RxList<SuccessStoryModel> storiesList = <SuccessStoryModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuccessStories();
  }

  void fetchSuccessStories() async {
    try {
      isLoading.value = true;
      final snapshot =
          await FirebaseFirestore.instance.collection('success_stories').get();

      storiesList.value = snapshot.docs
          .map((doc) => SuccessStoryModel.fromFirestore(doc))
          .toList();

      isLoading.value = false;
    } catch (e) {
      print("Error fetching success stories: $e");
      isLoading.value = false;
    }
  }
}
