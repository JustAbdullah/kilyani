import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class WaitAdd extends StatelessWidget {
  const WaitAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.messageWaitBasket.value,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black38,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black38,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Lottie.asset(ImagesPath.loading,
                        width: 70.w, height: 70.h),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 70.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "يتم إضافة المنتج إلى السلة",
                        style: TextStyle(
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.yellowColor,
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
