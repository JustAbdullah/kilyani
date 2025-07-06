import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import '../../../../../core/constant/images_path.dart';

class TopChat extends StatelessWidget {
  const TopChat({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  homeController.chatInConv.value = false;
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w, top: 10.h),
                  child: Container(
                    alignment: Alignment.center,
                    width: 40.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: AppColors.TheMain,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        ImagesPath.arrow,
                        width: 45.w,
                        height: 45.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                children: [
                  Text(
                    "المحادثة مع:",
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.balckColorTypeFour,
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    homeController.currentConv.value?.nameBuss.toString() ??
                        "يتم إجراء محادثة جديدة",
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.TheMain,
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
