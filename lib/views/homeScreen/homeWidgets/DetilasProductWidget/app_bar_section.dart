// widgets/app_bar_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/app_text_styles.dart';
import 'package:kilyani_app/core/constant/appcolors.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: 28.w),
            color: AppColors.blackColor,
            onPressed: controller.clearInDetilasProduct,
          ),
          TextButton.icon(
            icon: Icon(Icons.report, size: 20.w, color: AppColors.redColor),
            label: Text(
              "إبلاغ",
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                color: AppColors.redColor,
                fontSize: 14.sp,
              ),
            ),
            onPressed: () {
              //  controller.prepareReportData();
              controller.showTheBan.value = true;
            },
          ),
        ],
      ),
    );
  }
}
