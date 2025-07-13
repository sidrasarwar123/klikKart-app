import 'package:flutter/material.dart';
import 'package:klik_kart/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validate;
  final TextEditingController textEditingController;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final double? width;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.validate,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.readOnly,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: width ?? screenWidth * 0.85,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isPassword,
        validator: validate,
        keyboardType: keyboardType,
        readOnly: readOnly ?? false,
        style:  TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: AppColors.buttoncolor,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color:  Color.fromARGB(255, 241, 237, 237)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Color.fromARGB(255, 241, 237, 237)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Color.fromARGB(255, 241, 237, 237)),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            height: 1.2, 
          ),
        ),
      ),
    );
  }
}
