

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/teacher_side/controller/assignment_controller.dart';
import 'package:quickalert/models/quickalert_type.dart';

import 'package:quickalert/widgets/quickalert_dialog.dart';

class MarksEntry extends StatefulWidget {
  final String classId;
  final String studentId;

  const MarksEntry({
    required this.classId,
    required this.studentId,
    Key? key,
  }) : super(key: key);

  @override
  State<MarksEntry> createState() => _MarksEntryState();
}

class _MarksEntryState extends State<MarksEntry> {
  final AssignmentController controller = Get.put(AssignmentController());

 @override
void initState() {
  super.initState();
  print("📌 StudentAssignment INIT");
  print(" classId: ${widget.classId}");
  print(" studentId: ${widget.studentId}");

  controller.fetchAssignments(
    classId: widget.classId,
    studentId: widget.studentId,
  );
}

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: const Text("Assignments"),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(AppIcons.arrowicon, color: AppColors.buttoncolor, size: 30),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoBox("Class Name:", "UI/UX DESIGNER A12"),
                  infoBox("Topik:", "Prototyping Test"),
                  infoBox("Date:", "22-2-2024"),
                ],
              ),
              Column(
                children: controller.assignments.map((assignment) {
                  int index = controller.assignments.indexOf(assignment);
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    padding: const EdgeInsets.all(12),
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
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.09,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0A63CD), Color(0xFF1C82E5)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                assignment.title,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${assignment.obtainedMarks}/${assignment.totalMarks}",
                                style: const TextStyle(
                                    color: Colors.redAccent, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            final TextEditingController totalController =
                                TextEditingController(
                                    text: assignment.totalMarks.toString());
                            final TextEditingController obtainedController =
                                TextEditingController(
                                    text: assignment.obtainedMarks.toString());

                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.confirm,
                              barrierDismissible: false,
                              confirmBtnText: 'Yes',
                              cancelBtnText: 'No',
                              confirmBtnColor: Colors.green,
                              showCancelBtn: true,
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Edit Marks',
                                    style: TextStyle(
                                      color: AppColors.buttoncolor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Divider(
                                      thickness: 1,
                                      color: AppColors.buttoncolor),
                                   SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Total Marks"),
                                            const SizedBox(height: 5),
                                            TextField(
                                              controller: totalController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: '100',
                                                suffixIcon: const Icon(Icons.edit, size: 16),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Obtained Marks"),
                                            const SizedBox(height: 5),
                                            TextField(
                                              controller: obtainedController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: '80',
                                                suffixIcon: const Icon(Icons.edit, size: 16),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
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
                              onConfirmBtnTap: () async {
                                final int updatedTotalMarks =
                                    int.tryParse(totalController.text) ?? 100;
                                final int updatedObtainedMarks =
                                    int.tryParse(obtainedController.text) ?? 0;

                                await controller.updateAssignment(
                                  classId: widget.classId,
                                  studentId: widget.studentId,
                                  assignmentId: assignment.id,
                                  totalMarks: updatedTotalMarks,
                                  obtainedMarks: updatedObtainedMarks,
                                );
                                  await controller.fetchAssignments(
                                  classId: widget.classId,
                                  studentId: widget.studentId,
                                );
                               Navigator.of(context).pop();                           
Get.snackbar(
  "Success",
  "Marks Updated",
  backgroundColor: Colors.green,
  colorText: Colors.white,
);
                        },
                            
                              onCancelBtnTap: () {
                           
                              },
                            );
                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                          label: const Text("Edit", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                            backgroundColor: const Color(0xFF007AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget infoBox(String title, String value) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0A63CD), Color(0xFF1C82E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
