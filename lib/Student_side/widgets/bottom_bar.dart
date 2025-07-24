import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:klik_kart/Student_side/view/screen01/chat_screen.dart';
import 'package:klik_kart/Student_side/view/screen01/home_screen.dart';
import 'package:klik_kart/Student_side/view/screen01/job_screen.dart';
import 'package:klik_kart/Student_side/view/screen01/profile_screen.dart';
import 'package:klik_kart/Student_side/view/screen02/home_screen02.dart';
import 'package:klik_kart/Student_side/view/screen02/profile_studentscreen.dart.dart';

class BottomNavScreen extends StatefulWidget {
  final int initialIndex;
  final bool isApproved; //  add approval flag

  BottomNavScreen({this.initialIndex = 0, required this.isApproved});
    factory BottomNavScreen.fromArguments() {
    final args = Get.arguments as Map<String, dynamic>?;
    return BottomNavScreen(
      initialIndex: args?['initialIndex'] ?? 0,
      isApproved: args?['isApproved'] ?? false,
    );
  }

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  
  late int _selectedIndex;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    // ✅ Dynamically load pages based on approval
    _pages = widget.isApproved
        ? [
            HomeScreen02(),
            JobScreen(),
            ChatScreen(),
            StudentProfilescreen(),
          ]
        : [
            HomeMainScreen(),
            JobScreen(),
            ChatScreen(),
            ProfileScreen(),
          ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double navBarHeight = screenHeight * 0.08;
    double iconSize = screenWidth * 0.06;
    double fontSize = screenWidth * 0.03;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: navBarHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navItem(Icons.home, "Home", 0, iconSize, fontSize),
                  navItem(Icons.work, "Job", 1, iconSize, fontSize),
                  navItem(Icons.chat, "Chats", 2, iconSize, fontSize),
                  navItem(Icons.person, "Profile", 3, iconSize, fontSize),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem(
      IconData icon, String label, int index, double iconSize, double fontSize) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color: isSelected ? Colors.blue : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
