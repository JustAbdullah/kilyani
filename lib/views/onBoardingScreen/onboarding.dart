import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/onboarding_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/data/model/static_onboarding.dart';
import '../../core/localization/changelanguage.dart';
import '../WelcomeScreen/welcome.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeLanguageToLocale =
        Get.put(ChangeLanguageToLocale());
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    onBoardingControllerImp onboardingControllerImp =
        Get.put(onBoardingControllerImp());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: onboardingControllerImp.pageController,
            onPageChanged: (val) {
              onboardingControllerImp.onPageChange(val);
            },
            itemCount: onBoardingItme.length,
            itemBuilder: (context, i) => Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 100.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(ImagesPath.shape),
                  ),
                ),
                Column(children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "تــطبيق كليانى",
                    // ignore: deprecated_member_use
                    style: TextStyle(
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.TheMain,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),

                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "الدليل التعريفي لتطبيق كليانى",
                    // ignore: deprecated_member_use
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.balckColorTypeFour,
                      fontSize: 13.sp,
                    ),

                    textAlign: TextAlign.center,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 0.h,
                        ),
                        child: Lottie.asset("${onBoardingItme[i].image}",
                            width: 700.w, height: 300.h, fit: BoxFit.cover),
                      )),
                  SizedBox(
                    height: 125,
                  ),
                  Text(
                    "${onBoardingItme[i].title}",
                    // ignore: deprecated_member_use
                    style: TextStyle(
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.TheMain,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "${onBoardingItme[i].body}",
                      style: TextStyle(
                          height: screenHeight * 0.0017,
                          fontFamily: AppTextStyles.Almarai,
                          color: Color(0XFF434242),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  GetX<onBoardingControllerImp>(
                    builder: (controller) => Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(
                                onBoardingItme.length,
                                (index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        width: controller.currntPage == index
                                            ? 23
                                            : 13,
                                        height: 13,
                                        decoration: BoxDecoration(
                                            color: controller.currntPage ==
                                                    index
                                                ? AppColors.TheMain
                                                : AppColors.balckColorTypeFour,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    )),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GetX<onBoardingControllerImp>(
                      builder: (controller) => InkWell(
                            onTap: () {
                              if (controller.currntPage.value > 2) {
                                Get.to(WelcomeScreen());
                                controller.appServices.sharedPreferences
                                    .setInt('onBoarding', 1);
                              } else {
                                controller.currntPage.value =
                                    controller.currntPage.value + 1;
                                controller.pageController.animateToPage(
                                    controller.currntPage.value,
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.bounceOut);
                              }
                            },
                            child: AnimatedContainer(
                                duration: Duration(milliseconds: 700),
                                width: controller.currntPage.value ==
                                        onBoardingItme.length - 1
                                    ? screenWidth * 0.55
                                    : screenWidth * 0.50,
                                height: screenHeight / 25,
                                decoration: BoxDecoration(
                                    color: controller.currntPage.value ==
                                            onBoardingItme.length - 1
                                        ? AppColors.TheMain
                                        : AppColors.balckColorTypeFour,
                                    borderRadius: controller.currntPage.value ==
                                            onBoardingItme.length - 1
                                        ? BorderRadius.circular(25)
                                        : BorderRadius.circular(20)),
                                child: Center(
                                  child: controller.currntPage ==
                                          onBoardingItme.length - 1
                                      ? Text(
                                          "الإنتقال".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors.whiteColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          "المتابعة".tr,
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: AppColors.whiteColor,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                )),
                          )),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
