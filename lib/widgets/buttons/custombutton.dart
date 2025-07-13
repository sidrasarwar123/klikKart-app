import 'package:flutter/material.dart';
import 'package:klik_kart/constants/app_colors.dart';
import 'package:klik_kart/utils/loading.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? isloading;

  const CustomButton({ this.isloading=false,
    required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttoncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.30,
          vertical: screenHeight * 0.018, 
        ),
      ),
      child: isloading ==true? LoadingUtil.buttonLoading():
            
      Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.textcolor,
        ),
      ),
    );
  }
}
