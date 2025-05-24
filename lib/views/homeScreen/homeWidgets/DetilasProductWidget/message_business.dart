import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class MessageBussines extends StatelessWidget {
  const MessageBussines({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.isNotTheBussines.value,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black54,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black54,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black26,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 48.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(ImagesPath.error,
                        width: 70.w, height: 70.h),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 115.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                      child: Text(
                        "عزيزي العميل لايمكنك إضافة هذا المنتج إلى السلة كون أن لديك منتج مُضاف في السلة لمتجر أخر",
                        style: TextStyle(
                          height: 1.5.h,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.whiteColor,
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 38.h),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          controller.isNotTheBussines.value = false;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 250.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: AppColors.TheMain,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "إخفاء",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.whiteColor,
                              fontSize: 16.2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ))
              ],
            )));
  }
}
