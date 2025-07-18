import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/controller/auth_controller.dart';
import 'package:klik_kart/controller/profile_controller.dart';
import 'package:klik_kart/utils/loading.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.find<ProfileController>();
  String? gender;
  final AuthController authController=Get.put(AuthController());
  void initState() {
  super.initState();
  profileController.fetchUserData();
}

 @override
Widget build(BuildContext context) {
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
            Container(
              height: screenHeight * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.buttoncolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Column(
                  children: [
                    Text("Profile",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.03),
                      child: CircleAvatar(
  backgroundImage: user?.imageUrl != null && user!.imageUrl!.isNotEmpty
      ? NetworkImage(user.imageUrl!)
      : AssetImage(AppImages.personimage),
  radius: 40,
),
                    ),
                    Text(
                      user.name ?? "Name",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

          
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("User Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  const SizedBox(height: 10),

                  _infoTile("Name", user.name ?? "N/A", onEdit: () {
                    _editTextField(context, "Name", user.name ?? "", (val) {
                      profileController.updateUserField("name", val);
                    });
                  }),

                  _infoTile("Email", user.email ?? "N/A"),

                  _infoTile("Phone", user.phone ?? "N/A", onEdit: () {
                    _editTextField(context, "Phone", user.phone ?? "", (val) {
                      profileController.updateUserField("phone", val);
                    });
                  }),

                  _infoTile("Address", user.address ?? "N/A", onEdit: () {
                    _editTextField(context, "Address", user.address ?? "", (val) {
                      profileController.updateUserField("address", val);
                    });
                  }),

                  _infoTile("Gender", user.gender ?? "N/A", onEdit: () {
                    _editGender(context, (selected) {
                      profileController.updateUserField("gender", selected);
                    });
                  }),

const SizedBox(height: 30),
CustomButton(
  text: "Log Out",
  onPressed: () {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        icon: Icon(Icons.warning, color: Colors.red),
        title: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); 
              authController.logOut(); 
            },
            child: Text("Log Out"),
          ),
        ],
      ),
    );
  },
),



                ],
              ),
            )
          ],
        ),
      );
    }),
  );
}


  Widget _infoTile(String title, String value, {VoidCallback? onEdit}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(title, style: TextStyle(fontSize: 16))),
          Expanded(flex: 5, child: Text(value, style: TextStyle(color: Colors.blue))),
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

            // 👇 یہیں نوٹیفکیشن بھیجیں
            profileController.addNotificationAndShow(
              title: "$title Updated",
              description: "$title has been updated to $newValue.",
              icon: "notifications_active",
              color: "#2196F3", // Blue
            );
          },
          child: Text("Save"),
        )
      ],
    ),
  );
}
  void _editGender(BuildContext context, Function(String) onGenderSelected) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Gender", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 20),
              DropdownButton<String>(
                isExpanded: true,
                value: gender,
                hint: const Text("Select"),
                items: const [
                  DropdownMenuItem(child: Text("Male"), value: "Male"),
                  DropdownMenuItem(child: Text("Female"), value: "Female"),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      gender = value;
                    });
                    onGenderSelected(value);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
