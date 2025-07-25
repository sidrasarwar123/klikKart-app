import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/controller/profile_controller.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';



class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  final profileController = Get.put(ProfileController());
  final RxBool isLoading = false.obs;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  String phoneNumber = '';

  String? learningMode;
  String? instituteBranch;
  String? educationLevel;

  @override
  void initState() {
    super.initState();
    checkApprovalStatus();
  }

void checkApprovalStatus() {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore.instance
      .collection('reservations')
      .doc(uid)
      .snapshots()
      .listen((doc) {
    if (doc.exists) {
      bool isApproved = doc['isApproved'] ?? false;
      print(" Document exists. isApproved: $isApproved");

      if (isApproved) {
        print("Approved! Navigating to BottomNavScreen (isApproved: true)");

        //  Make sure you pass the argument
        Get.offAllNamed('/bottombar', arguments: {'isApproved': true});
      } else {
        print("Not approved yet");
      }
    } else {
      print("Reservation document not found for user: $uid");
    }
  });
}
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: const Text("Reservation Form"),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              AppIcons.arrowicon,
              color: AppColors.buttoncolor,
              size: 30,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text("Please Fill this form to complete your booking.", style: TextStyle(fontSize: 15)),
                const SizedBox(height: 5),
                const Text("*required", style: TextStyle(color: Colors.red)),
                const SizedBox(height: 20),
                const Text("Personal Data", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 20),

                CustomTextField(
                  textEditingController: usernameController,
                  hintText: "Name",
                  validate: (value) {
                    if (value == '' || value == null) {
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                IntlPhoneField(
                  decoration: InputDecoration(
                    hintText: ' 000 0000',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                  ),
                  initialCountryCode: 'PK',
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber;
                  },
                ),

                const SizedBox(height: 10),
                CustomTextField(
                  textEditingController: adressController,
                  hintText: "Address",
                  validate: (value) {
                    if (value == '' || value == null) {
                      return "Please enter Address";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),
                _buildDropdown(
                  label: "Select Learning Mode",
                  value: learningMode,
                  items: ["Online Learning", "Physical Learning"],
                  onChanged: (val) => setState(() => learningMode = val),
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  label: "Select Institute Branch",
                  value: instituteBranch,
                  items: ["Dev Soft Tech Solutions", "Dev Soft Global Services"],
                  onChanged: (val) => setState(() => instituteBranch = val),
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  label: "Select Education",
                  value: educationLevel,
                  items: ["Matric", "Intermediate", "Graduation"],
                  onChanged: (val) => setState(() => educationLevel = val),
                ),
                const SizedBox(height: 30),

               Obx(() => CustomButton(
  isloading: isLoading.value,
  text: "Submit",
 onPressed: () async {
  if (_formKey.currentState!.validate()) {
    if (learningMode == null ||
        instituteBranch == null ||
        educationLevel == null ||
        phoneNumber.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    isLoading.value = true;

    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("reservations").doc(uid).set({
      'name': usernameController.text.trim(),
      'phone': phoneNumber,
      'address': adressController.text.trim(),
      'learningMode': learningMode,
      'instituteBranch': instituteBranch,
      'educationLevel': educationLevel,
      'submittedAt': FieldValue.serverTimestamp(),
      'isApproved': true,
    });

    //  Notification
  await profileController.addNotificationAndShow(
  title: "Reservation Submitted",
  description: "Your reservation form has been submitted successfully.",
  icon: "notifications_active",
  color: "#2196F3",
);

isLoading.value = false;


if (!context.mounted) return;

QuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  text: 'Your form has been successfully submitted!',
);

    usernameController.clear();
    adressController.clear();
    setState(() {
      learningMode = null;
      instituteBranch = null;
      educationLevel = null;
      phoneNumber = '';
    });
  }
}
))

              ]
              
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      hint: Text(
        label,
        style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
    );
  }
}
