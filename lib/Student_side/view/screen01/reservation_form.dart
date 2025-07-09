import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/constants/app_icons.dart';
import 'package:klik_kart/widgets/buttons/custombutton.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
    final _formKey = GlobalKey<FormState>();

  String? learningMode;
  String? instituteBranch;
  String? educationLevel;
 

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
       appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          child: Text("Reservation Form"),
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
    
   body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
    child: Form(
      key: _formKey,
      child: ListView(
        children: [
           Text(
            "Please Fill this form to complete your booking.",
            style: TextStyle(fontSize: 15),
          ),
     SizedBox(height: 5),
         Text("*required", style: TextStyle(color: Colors.red)),
           SizedBox(height: 20),
       Text(
            "Personal Data",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
           SizedBox(height: 20),
          _buildTextField("Name"),
           SizedBox(height: 16),

          
       IntlPhoneField(
  decoration: InputDecoration(
    hintText: ' 000 0000',
    hintStyle: TextStyle(
      color: Colors.grey.shade400,
      fontSize: 14,
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding:  EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Colors.grey.shade100),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Colors.grey.shade100),
    ),
  ),
  initialCountryCode: 'PK',
  onChanged: (phone) {
    print(phone.completeNumber);
  },
),

           SizedBox(height: 16),

      
          _buildTextField("Address"),
         SizedBox(height: 16),

          
          _buildDropdown(
            label: "Select Learning Mode",
            value: learningMode,
            items: ["Online Learning", "Physical Learning"],
            onChanged: (val) => setState(() => learningMode = val),
          ),
           SizedBox(height: 16),
          _buildDropdown(
            label: "Select Institute Branch",
            value: instituteBranch,
            items: [
              "Dev Soft Tech Solutions",
              "Dev Soft Global Services"
            ],
            onChanged: (val) => setState(() => instituteBranch = val),
          ),
           SizedBox(height: 16),
          _buildDropdown(
            label: "Select Education",
            value: educationLevel,
            items: ["Matric", "Intermediate", "Graduation"],
            onChanged: (val) => setState(() => educationLevel = val),
          ),

      SizedBox(height: 30),
CustomButton(
  text: "Submit",
  onPressed: () {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Your form has been successfully submitted!',
    );
  },
),

        
        ],
      ),
    ),
  ),
),

      
    
    );
  }

  Widget _buildTextField(String hint) {
    return TextFormField(
      decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
            ),
          
            filled: true,
            fillColor: Colors.white,
            contentPadding:
               EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.grey.shade100),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.grey.shade100),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.grey.shade100),
            ),
          ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded:true ,
      decoration: InputDecoration(
            hintText: label,
       
            filled: true,
            fillColor: Colors.white,
            contentPadding:
               EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.grey.shade100),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.grey.shade100),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.grey.shade100),
            ),
          ),
           hint: Text( 
    label,
    style: TextStyle(
      color: Colors.grey.shade400,
      fontSize: 14,
    ),
  ),
      icon:  Icon(Icons.keyboard_arrow_down_rounded),
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: onChanged,
      
    );
  }

  
  }

 