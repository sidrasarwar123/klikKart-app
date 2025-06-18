// widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:klik_kart/constants/app_colors.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;


  const CustomButton({
    required this.text,
    required this.onPressed,
   
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttoncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
      ),
      child:
      Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 49, 39, 39),
        ),
      ),
    );
  }
}
