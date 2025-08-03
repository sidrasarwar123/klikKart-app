// teacherprofilescreen.dart (Full working backend integrated with Firestore + GetX)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/controller/auth_controller.dart';
import 'package:klik_kart/controller/profile_controller.dart';
import 'package:klik_kart/utils/loading.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class teacherprofilescreen extends StatefulWidget {
  const teacherprofilescreen({super.key});

  @override
  State<teacherprofilescreen> createState() => _teacherprofilescreenState();
}

class _teacherprofilescreenState extends State<teacherprofilescreen> {
  final ProfileController profileController = Get.find<ProfileController>();
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    profileController.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        final user = profileController.userModel.value;

        if (user == null || profileController.isLoading.value) {
          return LoadingUtil.shimmerTile(itemcount: 8);
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(user, screenHeight),
              _buildDetails(user, screenWidth, screenHeight),
              SizedBox(height: 20),
              CustomButton(
                text: "Log Out",
                onPressed: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Do you want to logout?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    confirmBtnColor: Colors.red,
                    onConfirmBtnTap: () {
                      Get.back();
                      Get.offAllNamed('/login');
                    },
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader(user, double screenHeight) {
    return Container(
      height: screenHeight * 0.27,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.buttoncolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.09),
        child: Column(
          children: [
            Text("Profile", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            CircleAvatar(
              backgroundImage: user.imageUrl != null && user.imageUrl!.isNotEmpty
                  ? NetworkImage(user.imageUrl!)
                  : AssetImage(AppImages.teacherimage) as ImageProvider,
              radius: 30,
            ),
            SizedBox(height: 8),
            Text(user.name ?? "Name", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(user, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Teacher Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          SizedBox(height: 10),
          _infoTile("Name", user.name ?? "N/A", onEdit: () {
            _editTextField(context, "Name", user.name ?? "", (val) {
              profileController.updateUserField("name", val);
            });
          }),
          _infoTile("Email", user.email ?? "N/A"),
          _infoTile("Gender", user.gender ?? "N/A", onEdit: () {
            _editTextField(context, "Gender", user.gender ?? "", (val) {
              profileController.updateUserField("gender", val);
            });
          }),
          _infoTile("Phone", user.phone ?? "N/A", onEdit: () {
            _editTextField(context, "Phone", user.phone ?? "", (val) {
              profileController.updateUserField("phone", val);
            });
          }),
          _infoTile("CNIC", user.cnic ?? "N/A", onEdit: () {
            _editTextField(context, "CNIC", user.cnic ?? "", (val) {
              profileController.updateUserField("cnic", val);
            });
          }),
          _infoTile("Address", user.address ?? "N/A", onEdit: () {
            _editTextField(context, "Address", user.address ?? "", (val) {
              profileController.updateUserField("address", val);
            });
          }),
          _infoTile("Designation", user.designation ?? "N/A", onEdit: () {
            _editTextField(context, "Designation", user.designation ?? "", (val) {
              profileController.updateUserField("designation", val);
            });
          }),
        ],
      ),
    );
  }

  Widget _infoTile(String title, String value, {VoidCallback? onEdit}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromARGB(255, 205, 229, 248)),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(title, style: TextStyle(fontSize: 16))),
          Expanded(flex: 5, child: Text(value, style: TextStyle(color: AppColors.buttoncolor))),
          if (onEdit != null)
            IconButton(
              icon: Icon(Icons.edit, size: 18, color: AppColors.buttoncolor),
              onPressed: onEdit,
            ),
        ],
      ),
    );
  }

  void _editTextField(BuildContext context, String title, String currentValue, Function(String) onSave) {
    final controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Edit $title", style: TextStyle(color: AppColors.buttoncolor)),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: title),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              final newValue = controller.text;
              onSave(newValue);
              Navigator.pop(context);
              profileController.addNotificationAndShow(
                title: "$title Updated",
                description: "$title has been updated to $newValue.",
                icon: "notifications_active",
                color: "#2196F3",
              );
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}
