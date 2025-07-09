import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/Employee_side/widgets/leave_card.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
   String selectedTab = "Approvals";
 
   int selectedIndex = 0;
    final List<String> tabs = ['Approvals', 'Leave History',];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
  
    return Scaffold(
     body: SingleChildScrollView(scrollDirection: Axis.vertical,
       child: Column(
       
         children: [
           Container(
        height: screenHeight * 0.20,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.buttoncolor,
          borderRadius:  BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child:  Center(
          child: Text(
            "Attendance",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
           ),SizedBox(height: screenHeight*0.05,),
       Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              width: screenWidth*0.40,
                                              height: screenHeight*0.2,
                                              child: CircularProgressIndicator(
                                                value: 0.7,
                                                strokeWidth: 12,
                                                backgroundColor: Colors.grey[200],
                                                valueColor:  AlwaysStoppedAnimation<Color>(Colors.blue),
                                              ),
                                            ),Column(
                                              children: [
                                          Text("07", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: AppColors.buttoncolor)),
                                            Text("leave balance", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,)),
                                              ],
                                            ) ],
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.03),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                    Icon(Icons.circle,size: 18,color: Colors.grey,),
                                                  Text("Total Leave",style: TextStyle(color: Colors.grey,fontSize: 18),),
                                                    ],
                                                  ), Text("22",style: TextStyle(fontSize: 18),),
                                                 
                                                
                                                ],
                                              ),SizedBox(width: screenWidth*0.2,),
                                               Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                    Icon(Icons.circle,size: 18,color: Colors.blue,),
                                                  Text("Total Leave",style: TextStyle(color: Colors.grey,fontSize: 18),),
                                                    ],
                                                  ), Text("15",style: TextStyle(fontSize: 18),),
                                                 
                                                
                                                ],
                                              ),
                                       
                                       
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.05),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [ Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                width: screenWidth*0.14,
                                                height: screenHeight*0.07,
                                                child: CircularProgressIndicator(
                                                  value: 0.7,
                                                  strokeWidth: 7,
                                                  backgroundColor: Colors.grey[200],
                                                  valueColor:  AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                                                ),
                                              ),Column(
                                                children: [
                                            Text("2", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.buttoncolor)),
                                
                                                ],
                                              )
                                               ],
                                          ),SizedBox(height: screenHeight*0.01,),
                                          Text("Medical Leave", style: TextStyle(fontSize: 13,color: Colors.grey)),
                                                ],
                                              ),SizedBox(width: screenWidth*0.1,),
                                               Column(
                                                children: [ Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                width: screenWidth*0.14,
                                                height: screenHeight*0.07,
                                                child: CircularProgressIndicator(
                                                  value: 0.7,
                                                  strokeWidth: 7,
                                                  backgroundColor: Colors.grey[200],
                                                  valueColor:  AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                                                ),
                                              ),Column(
                                                children: [
                                            Text("4", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.buttoncolor)),
                                
                                                ],
                                              )
                                               ],
                                          ),SizedBox(height: screenHeight*0.01,),
                                          Text("Casual Leave", style: TextStyle(fontSize: 13,color: Colors.grey)),
                                                ],
                                              ),SizedBox(width: screenWidth*0.1,),
                                                  Column(
                                                children: [ Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                width: screenWidth*0.14,
                                                height: screenHeight*0.07,
                                                child: CircularProgressIndicator(
                                                  value: 0.7,
                                                  strokeWidth: 7,
                                                  backgroundColor: Colors.grey[200],
                                                  valueColor:  AlwaysStoppedAnimation<Color>(Colors.blue),
                                                ),
                                              ),Column(
                                                children: [
                                            Text("1", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.buttoncolor)),
                                
                                                ],
                                              )
                                               ],
                                          ),SizedBox(height: screenHeight*0.01,),
                                          Text("Sick Leave", style: TextStyle(fontSize: 13,color: Colors.grey)),
                                                ],
                                              ),
                                            
                                              
                                              
                                             
       
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                             Padding(
                  padding: EdgeInsets.only(top: screenHeight*0.05,),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Container(
                          
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 241, 235, 235)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(tabs.length, (index) {
                                bool isSelected = index == selectedIndex;
                                return Padding(
                                  padding: EdgeInsets.symmetric(),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:screenWidth*0.12, vertical: screenWidth*0.03),
                                      decoration: BoxDecoration(
                                        color: isSelected ? Colors.blue : Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: isSelected ? Colors.blue:Colors.white
                                        
                                        ),
                                      ),
                                      child: Text(
                                        tabs[index],
                                        style: TextStyle(
                                          color:
                                              isSelected ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        ),
        () {
       if (selectedIndex == 0) {
        return 
            Column(
              children: [
                ListView(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         children: [
                           leaveCard(
                        title: "Casual Leave",
                        description: "Applied from 26th Mar to 28th Mar, 2024",
                        date: "26 March 2024",
                        status: "Requested",
                        color: Colors.blue,
                        context: context,
                           ),
                           leaveCard(
                        title: "Medical Leave",
                        description: "Applied from 11th Mar to 12th Mar, 2024",
                        date: "11 March 2024",
                        status: "Approved",
                        color: Colors.amber,
                           context: context,
                           ),
                           leaveCard(
                        title: "Sick Leave",
                        description: "Applied from 1st Mar to 2nd Mar, 2024",
                        date: "1st March 2024",
                        status: "Approved",
                        color: Colors.blue,
                           context: context,
                           ),
                         ],
                       ),
                       SizedBox(height: screenHeight*0.02,),
                       CustomButton(text: " apply for leave", onPressed: (){
Get.toNamed('/applyscreen');
                       }),
                         SizedBox(height: screenHeight*0.09,),
              ],
            );
        
       
       
              
       
          
         
           }  else {
        return    Column(
         children: [
       
         ],
        );
           
           }
         }(), 
                      ]
                    ),
                  ),
                  )
          
              ],
          )
         ]
       ),
     )
     );
  }
}
