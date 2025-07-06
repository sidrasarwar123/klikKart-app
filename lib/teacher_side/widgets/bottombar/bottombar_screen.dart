import 'package:flutter/material.dart';


import 'package:klik_kart/Student_side/view/screen01/job_screen.dart';
import 'package:klik_kart/teacher_side/view/screen/form_applyscreen.dart';

import 'package:klik_kart/teacher_side/view/screen/home_screen.dart';
import 'package:klik_kart/teacher_side/view/screen/marks_screen.dart';
import 'package:klik_kart/teacher_side/view/screen/profile_screen.dart';

class BottombarScreen extends StatefulWidget {
  @override
  _BottombarScreenState createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
  
homescreen03(),
JobScreen(),
MarksScreen(),
FormApplyscreen(),
StudentProfilescreen(),



  
    
  ];

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
      navItem(Icons.menu_book, "Time Table", 3, iconSize, fontSize),
    navItem(Icons.article_outlined, "Exam Mark", 2, iconSize, fontSize),
    navItem(Icons.person, "Profile", 4, iconSize, fontSize),
       
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index, double iconSize, double fontSize) {
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
