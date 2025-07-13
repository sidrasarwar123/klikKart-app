import 'package:flutter/material.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_images.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? gender; 
  String phoneNumber = '';
  String address = ''; 

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
  
          Container(
            height: screenHeight * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.buttoncolor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.04),
              child: Column(
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.personimage),
                      radius: 35,
                    ),
                  ),
                 Text(
                    "Khuzaima",
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                   Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "User Details",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                   SizedBox(height: 10),

                  _infoTile("Name", "Khuzaima"),
                  _infoTile("Email", "khuzaima@gmail.com"),
                  _infoTile("Gender", gender ?? "", onEdit: () => _editGender(context)),
                  _infoTile("Phone Number", phoneNumber.isNotEmpty ? phoneNumber : "", onEdit: () {
                    _editTextField(context, "Phone Number", phoneNumber, (val) {
                      setState(() {
                        phoneNumber = val;
                      });
                    });
                  }),
                  _infoTile("Address", address.isNotEmpty ? address : "", onEdit: () {
                    _editTextField(context, "Address", address, (val) {
                      setState(() {
                        address = val;
                      });
                    });
                  }),

          
                  // Padding(
                  //   padding: EdgeInsets.only(top: screenHeight * 0.03),
                  //   child:
                  // CustomButton(
                  //     text: "Log Out",
                  //     onPressed: () {
                  //       showDialog(
                  //         context: context,
                  //         builder: (_) => AlertDialog(
                  //           icon:  Icon(Icons.error, color: Colors.blue),
                  //           title:  Text('Are you sure you want to log out?'),
                  //           actions: [
                  //             TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                  //             ElevatedButton(
                  //               onPressed: () => Navigator.pop(context),
                  //               child: const Text("Log Out"),
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _infoTile(String title, String value, {VoidCallback? onEdit}) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 4),
      padding:  EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(title, style:  TextStyle(fontSize: 16))),
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

  void _editGender(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Select Gender", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child:  Text("Save"),
          )
        ],
      ),
    );
  }
}
