import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Icon? suffixIcon;

  CustomTextField({

    this.keyboardType,
    required this.hint,
    this.isPassword = false,
    this.suffixIcon,
    this.readOnly,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
    
      obscureText: isPassword,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        
      
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.transparent),
        ),
       
      ),
    );
  }
}
