import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/appcolors.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:kilyani_app/views/accountScreen/login.dart';
import 'package:kilyani_app/views/homeScreen/home_screen.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/app_text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.TheMain,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "نُرحب بك في منصة كليانى",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "واجهتك الأولى في عالم التجارة الإلكترونية",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 430.h,
                  child: Lottie.asset(ImagesPath.onBoardingOneProduct),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(Login());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 230.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.blackColorTypeTeo,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            homeController.isNoHaveAccount.value = false;
                            homeController.isNotHaveAccount.value = true;

                            Get.to(HomeScreen());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 230.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "المتابعة كزائر",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.blackColorTypeTeo,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
