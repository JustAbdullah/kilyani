import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';

class UserDataHomeScreen extends StatelessWidget {
  const UserDataHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundColor: AppColors.TheMain,
                child: Icon(Icons.person, color: Colors.white, size: 18.sp),
              ),
              SizedBox(width: 10.w),
              GetX<HomeController>(
                builder: (controller) => Text(
                  controller.isNotHaveAccount.value
                      ? "لايوجد حساب"
                      : controller.users?.value.user_name.toString() ??
                          "لايوجد حساب",
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.TheMain,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          GetX<HomeController>(
            builder: (controller) => SizedBox(
              width: 180.w,
              child: Text(
                controller.address.value,
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: const Color.fromARGB(255, 72, 71, 71),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
