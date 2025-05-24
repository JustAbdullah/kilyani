import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Padding(
            padding: EdgeInsets.only(bottom: 45.h, left: 120.w),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.totalPriceProcut.value.toString(),
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.TheMain,
                      fontSize: 17.2.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 1.5.w,
                  ),
                  Text(
                    "أوقية",
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.TheMain,
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )));
  }
}
