import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/event.dart';

class EventController extends GetxController {
  RxList<Event> eventList = <Event>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  void fetchEvents() async {
  print("📡 fetchEvents called");
  isLoading.value = true;
  try {
    final snapshot = await FirebaseFirestore.instance.collection('events').get();
    print("📦 Found ${snapshot.docs.length} events");

    final data = snapshot.docs.map((e) {
      print("📄 Event Data: ${e.data()}");
      return Event.fromMap(e.data());
    }).toList();

    eventList.value = data;
  } catch (e) {
    print("❌ Error fetching events: $e");
  } finally {
    isLoading.value = false;
  }
}
}
