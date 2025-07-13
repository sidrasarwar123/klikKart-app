import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart'; 
import 'package:klik_kart/constants/app_colors.dart';

class LoadingUtil {
  static Widget buttonLoading({double size = 20, Color color = AppColors.textcolor}) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.textcolor,
      ),
    );
  }

  static void showLoadingDialog({String message = "Please wait..."}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.textcolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColors.buttoncolor),
            SizedBox(height: 16.h),
            Text(message, style: TextStyle(fontSize: 16.sp)),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static Widget shimmerTile({
    double height = 80,
    double width = double.infinity,
    int itemcount = 5, // default value
  }) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemcount,
        itemBuilder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: height,
            width: width,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
