import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Employee_side/model/member_model.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/constants/app_images.dart';

class TeamMember extends StatefulWidget {
  const TeamMember({super.key});

  @override
  State<TeamMember> createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  final List<TeamMemberModel> teamMembers = [
    TeamMemberModel(name: 'Ali Hassan', imagePath: AppImages.person1image, isPresent: true),
    TeamMemberModel(name: 'Floyd Miles', imagePath: AppImages.person2image, isPresent: false),
    TeamMemberModel(name: 'Cody Fisher', imagePath: AppImages.person3image, isPresent: true),
    TeamMemberModel(name: 'Kristin Watson', imagePath: AppImages.person4image, isPresent: true),
    TeamMemberModel(name: 'Jacob Jones', imagePath: AppImages.person5image, isPresent: false),
    TeamMemberModel(name: 'Wade Warren', imagePath: AppImages.person5image, isPresent: true),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: const Text("My Team Member"),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            AppIcons.arrowicon,
            color: AppColors.buttoncolor,
            size: 30,
          ),
        ),
      ),
      body: GridView.builder(
        padding:  EdgeInsets.all(12),
        itemCount: teamMembers.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 180,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final member = teamMembers[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:  BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    member.imagePath,
                    height: 80,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                 SizedBox(height:screenHeight*0.01),
                Text(
                  member.name,
                  style:  TextStyle(fontWeight: FontWeight.bold),
                ),
              
                Container(
                  margin:  EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          member.isPresent ? Colors.lightBlue : Colors.purpleAccent,
                    ),
                    onPressed: () {},
                    child: Text(member.isPresent ? 'Present' : 'Absent',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


