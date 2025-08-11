
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:klik_kart/controller/profile_controller.dart';
import 'package:quickalert/quickalert.dart';

import 'package:klik_kart/Student_side/models/job_model.dart';
import 'package:klik_kart/Student_side/widgets/job_card.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:klik_kart/widgets/fields/textfield.dart';

class JobReservation extends StatefulWidget {
  const JobReservation({super.key});

  @override
  State<JobReservation> createState() => _JobReservationState();
}

class _JobReservationState extends State<JobReservation> {
  final RxBool isLoading = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ProfileController profileController= Get.put(ProfileController());
  String phoneNumber = '';
  PlatformFile? pickedFile;
  bool isPreviewLoading = false;

  final JobModel job = Get.arguments as JobModel;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('userdata')
          .doc(user.uid)
          .get();
      final data = doc.data();
      if (data != null) {
        nameController.text = data['name'] ?? '';
        emailController.text = data['email'] ?? '';
      }
    }
  }

  Future<void> pickResume() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      final file = result.files.first;
      final sizeInMB = file.size / (1024 * 1024);

      if (sizeInMB > 5) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Please upload a file less than 5MB in size.',
        );
        return;
      }

      setState(() {
        pickedFile = file;
      });

      print(" File picked: ${pickedFile!.name}");
    }
  }

  Future<void> submitForm() async {
    if (pickedFile == null) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Please upload your resume before submitting.',
      );
      return;
    }

    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Your application has been submitted successfully!',
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Apply for Job")),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Job Title",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
             SizedBox(height: 10),
            JobCard(
              title: job.title,
              company: job.company,
              location: job.location,
              match: job.matchInfo,
              daysAgo: job.daysAgo,
              companyLogoUrl: job.companyLogoUrl,
            ),
            const SizedBox(height: 25),

            CustomTextField(
              textEditingController: nameController,
              hintText: "Full Name",
            ),
            const SizedBox(height: 15),

            IntlPhoneField(
              decoration: InputDecoration(
                hintText: '300 1234567',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              initialCountryCode: 'PK',
              onChanged: (phone) {
                phoneNumber = phone.completeNumber;
              },
            ),

            CustomTextField(
              textEditingController: emailController,
              hintText: "Email Address",
            ),
             SizedBox(height:20 ),

            GestureDetector(
             onTap: pickResume,
              child: Container(
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blue.withOpacity(0.05),
                ),
                child: Column(
                  children: [
                    Icon(Icons.upload_file, color: Colors.blue),
                    SizedBox(height: 8),
                    Text(
                    pickedFile?.name ?? "Upload Resume",
                  
                    
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),

          
          

            const SizedBox(height: 30),
 Obx(() => CustomButton(
  text: "Submit",
  isloading: isLoading.value,
  onPressed: () async {
    isLoading.value = true;

    try {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Your form has been successfully submitted!',
      );

      if (FirebaseAuth.instance.currentUser != null) {
        profileController.addNotificationAndShow(
          title: "Welcome!",
          description: "Your form has been successfully submitted.",
          icon: "person_add",
          color: "#4CAF50", 
        );
      }

    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  },
)),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
