import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class MessageError extends StatelessWidget {
  const MessageError({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.messageErrorBasket.value,
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
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Lottie.asset(ImagesPath.error,
                        width: 70.w, height: 70.h),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 95.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                      child: Text(
                        "عزيزي العميل ناسف على ذلك ولكن هنالك مشكلة في عملية إضافة المنتج إلى السلة,رجاءًا قم بالمحاولة لاحقًا",
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
              ],
            )));
  }
}
