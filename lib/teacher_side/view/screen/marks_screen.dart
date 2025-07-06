import 'package:flutter/material.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MarksScreen extends StatefulWidget {
  const MarksScreen({super.key});

  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {
   String selectedClass = "Senior 163 G";
   String selectedStudent="Khuzaima";
  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  Column(
        children: [
      
          Container(
            height: screenHeight * 0.40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.buttoncolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),child: 
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.070, right: screenWidth * 0.06),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Final Marks",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)
                       ),
                       
                ),
            ),Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.6,top: screenHeight*0.03),
              child: Text("Select your Class",style: TextStyle(color: Colors.white,)
               ),
               
            ),SizedBox(height: screenHeight*0.02,),
            Container(
                  width: screenWidth * 0.85,
                  padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color.fromARGB(255, 245, 240, 240)),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
  isExpanded: true,
  underline:  SizedBox(),
  value: selectedClass,
  items: ["Senior 163 G", "Junior A1", "Prep B"]
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
         
            ),
          ))
      .toList(),
  onChanged: (value) {
    setState(() {
      selectedClass = value!;
    });
  },
),

                ),Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.6,top: screenHeight*0.01),
              child: Text("Select your Student",style: TextStyle(color: Colors.white,)
               ),
               
            ),SizedBox(height: screenHeight*0.02,),
            Container(
                  width: screenWidth * 0.85,
                  padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color.fromARGB(255, 245, 240, 240)),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
  isExpanded: true,
  underline:  SizedBox(),
  value: selectedStudent,
  items: ["Khuzaima", "M.Hamza", "M.Hashim"]
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
         
            ),
          ))
      .toList(),
  onChanged: (value) {
    setState(() {
      selectedClass = value!;
    });
  },
),

                ),
            ]
            ),
            
          ),
          
          Stack(
  clipBehavior: Clip.none,
  alignment: Alignment.topCenter,
  children: [
    Padding(
      padding: EdgeInsets.only(top: screenHeight*0.03, left: screenWidth*0.05, right: screenWidth*0.05,),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: screenHeight * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Column(
          children: [
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Progress", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.buttoncolor)),
                Text("Obtain", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.buttoncolor)),
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.buttoncolor)),
              ],
            ),
             Divider(color: AppColors.buttoncolor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Assignment", style: TextStyle(color: AppColors.buttoncolor)),
                Text("15%     ", style: TextStyle(color: AppColors.buttoncolor)),
                Text("20%", style: TextStyle(color: AppColors.buttoncolor)),
              ],
            ),
             SizedBox(height: 6),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sentinal", style: TextStyle(color: AppColors.buttoncolor)),
                Text("15%", style: TextStyle(color: AppColors.buttoncolor)),
                Text("20%", style: TextStyle(color: AppColors.buttoncolor)),
              ],
            ),
             SizedBox(height: 6),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Final term", style: TextStyle(color: AppColors.buttoncolor)),
                Text("50%   ", style: TextStyle(color: AppColors.buttoncolor)),
                Text("60%", style: TextStyle(color: AppColors.buttoncolor)),
              ],
            ),
             SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("Grade"),
                     Text("B+", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.buttoncolor)),
                    SizedBox(height: 6),
                   
                  ],
                ),
                Column(
                  children:  [
                    Text("Percentage"),
                    Text("80%", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.buttoncolor)),
                  ],
                ),
                
              ],
            ), Padding(
              padding:  EdgeInsets.only(right: screenWidth*0.1),
              child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical:screenHeight*0.01),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Passed", style: TextStyle(color: Colors.white)),
                      ),
            )
          ],
        ),
      ),
    ),

    
   
  ],
),     
          Padding(
            padding: EdgeInsets.only(
                bottom: screenHeight * 0.03, top: screenHeight * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    side:  BorderSide(color: Colors.blue, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:  EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: screenWidth * 0.1),
                ElevatedButton(
                onPressed: () {
                 QuickAlert.show(
 context: context,
 type: QuickAlertType.success,
 text: 'Transaction Completed Successfully!',
);},
        style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Publish",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),



        ]
        
      )
     
            
  
  
    );    
  }
}
