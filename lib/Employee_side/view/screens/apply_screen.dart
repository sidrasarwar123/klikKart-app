import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';


class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
   DateTime selectedDate = DateTime.now();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now().add(Duration(days: 1));
  String selectedLeaveType = "Sick Leave";

  final List<String> leaveTypes = ["Sick Leave", "Casual Leave", "Medical Leave"];
  final TextEditingController reasonController = TextEditingController();

  Future<void> _pickDate(BuildContext context, bool isFrom) async {
    DateTime initialDate = isFrom ? fromDate : toDate;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != initialDate) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold (
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Apply Leave",),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              AppIcons.arrowicon,
              color: AppColors.buttoncolor,
              size: 30,
            )),

      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.04, left: screenWidth * 0.04),
          child: SingleChildScrollView(          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("Apply Leave Date", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.06, top: screenHeight * 0.01),
                  child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, size: 20),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2030),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                  )
                ],
              ),
            ),

                ),
                SizedBox(height: screenHeight * 0.02),
                 Text("Choose Leave Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: DropdownButton<String>(
                value: selectedLeaveType,
                underline: const SizedBox(),
                isExpanded: true,
                items: leaveTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLeaveType = value!;
                  });
                },
              ),
            ),

                SizedBox(height: screenHeight * 0.02),
                 Text("From Date To Date", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Row(
              children: [
              
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(context, true),
                    child: Container(
                      padding:  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        "${fromDate.day}-${fromDate.month}-${fromDate.year}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
             Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("To"),
                ),
            
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(context, false),
                    child: Container(
                      padding:  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        "${toDate.day}-${toDate.month}-${toDate.year}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),

        SizedBox(height: 16),

            
             Text("Reason", style: TextStyle(fontSize: 16)),
             SizedBox(height: 6),
            Container(
              height: 100,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: reasonController,
                maxLines: null,
                decoration: const InputDecoration.collapsed(hintText: "Enter your reason"),
              ),
            ),
          ],
          
        ),
          )
            )
          ]
        ),
      )

    );
  }
}