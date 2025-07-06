import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';

import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MarksEntry extends StatefulWidget {
  const MarksEntry({super.key});

  @override
  State<MarksEntry> createState() => _MarksEntryState();
}

class _MarksEntryState extends State<MarksEntry> {
   final List<Map<String, dynamic>> students = [
    {"name": "Anas", "marks": "23"},
    {"name": "Maaz", "marks": "50"},
    {"name": "AbuBakar", "marks": "60"},
    {"name": "Uzair", "marks": "70"},
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child:  Text("Assignments"),
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
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.02,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 infoBox("Class Name:", "UI/UX DESIGNER A12"),
                  infoBox("Topik:", "Prototyping Test"),
                  infoBox("Date:", "22-2-2024"),
        
              ],
            ),
            Column(
              children: [
                    SizedBox(height: screenHeight*0.02,),
                     ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Container(
                    margin:  EdgeInsets.symmetric(vertical: 12),
                    padding:  EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 4)
                      ],
                    ),
                    child: Row(
                      children: [
                        
                        Container(
                          width: screenWidth*0.2,
                          height: screenHeight*0.09,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF0A63CD), Color(0xFF1C82E5)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                         SizedBox(width: screenWidth*0.03),
        
                    
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student["name"],
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${student["marks"]}/100",
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ElevatedButton.icon(
         onPressed: () {
          final TextEditingController totalController =
        TextEditingController(text: "100");
          final TextEditingController obtainedController =
        TextEditingController(text: students[index]["marks"]);
        
          QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            barrierDismissible: false,
            confirmBtnText: 'Yes',
            cancelBtnText: 'No',
            confirmBtnColor: Colors.green,
            showCancelBtn: true,
            customAsset: null,
            widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Edit Marks',
            style: TextStyle(color: AppColors.buttoncolor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(height: 8),
           Divider(thickness: 1,color: AppColors.buttoncolor,),
           SizedBox(height: 12),
          Row(
            children: [
            
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text("Total Marks"),
                     SizedBox(height: 5),
                    TextField(
                      controller: totalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '100',
                        suffixIcon: Icon(Icons.edit, size: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(width: 12),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Obtained Marks"),
                SizedBox(height: 5),
                    TextField(
                      controller: obtainedController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '80',
                        suffixIcon: Icon(Icons.edit, size: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
            ),
            onConfirmBtnTap: () {
            
        setState(() {
          students[index]["marks"] = obtainedController.text;
        });
        Navigator.of(context).pop(); 
            },
            onCancelBtnTap: () {
        Navigator.of(context).pop();
            },
          );
        },
        
          icon: Icon(Icons.edit,color: Colors.white,),
          label: Text("Edit",style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                        backgroundColor: const Color(0xFF007AFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
        ),
        
                      ]
                      )
                  );})
              ],
            )
          ],
        ),
      ),
    );
  }
   Widget infoBox(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, color: Colors.black87,fontWeight: FontWeight.bold)),
         SizedBox(height: 4),
        Container(
          padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A63CD), Color(0xFF1C82E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 10),
          ),
        ),
      ],
    );
  }
}
