import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';

import 'package:kilyani_app/views/homeScreen/homeWidgets/AuthWidgets/step_one.dart';

import 'package:lottie/lottie.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

import '../../home_screen.dart';
import 'step_three.dart';
import 'step_two.dart';

class CreateAuth extends StatelessWidget {
  const CreateAuth({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheAuthCreaet.value,
            child: Container(
              color: AppColors.whiteColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 00.w),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetX<HomeController>(
                                  builder: (controller) => controller
                                              .stepOneAuthAcocunt.value ==
                                          0
                                      ? StepOne()
                                      : controller.stepOneAuthAcocunt.value == 1
                                          ? StepTwo()
                                          : StepThree(),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                GetX<HomeController>(
                                    builder: (controller) => Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 50.w),
                                            child: Row(
                                              children: [
                                                AnimatedContainer(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  width: 80.w,
                                                  height: 7.h,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .stepOneAuthAcocunt
                                                                  .value <=
                                                              0
                                                          ? AppColors
                                                              .yellowColor
                                                          : Colors.green[700],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                AnimatedContainer(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  width: 80.w,
                                                  height: 7.h,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .stepOneAuthAcocunt
                                                                  .value ==
                                                              0
                                                          ? AppColors
                                                              .balckColorTypeFour
                                                          : controller.stepOneAuthAcocunt
                                                                      .value <=
                                                                  1
                                                              ? AppColors
                                                                  .yellowColor
                                                              : Colors
                                                                  .green[700],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                AnimatedContainer(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  width: 80.w,
                                                  height: 7.h,
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .stepOneAuthAcocunt
                                                                  .value ==
                                                              0
                                                          ? AppColors
                                                              .balckColorTypeFour
                                                          : controller.stepOneAuthAcocunt
                                                                      .value ==
                                                                  1
                                                              ? AppColors
                                                                  .balckColorTypeFour
                                                              : controller.stepOneAuthAcocunt
                                                                          .value <=
                                                                      2
                                                                  ? AppColors
                                                                      .yellowColor
                                                                  : Colors.green[
                                                                      700],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 45.w),
                                      child: Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          child: InkWell(
                                            onTap: () {
                                              if (homeController
                                                      .stepOneAuthAcocunt
                                                      .value ==
                                                  0) {
                                                if (homeController.quOne ==
                                                        "a" ||
                                                    homeController.asOne ==
                                                        "a") {
                                                  homeController
                                                      .isEmptyData.value = true;
                                                } else {
                                                  homeController
                                                      .stepOneAuthAcocunt
                                                      .value = homeController
                                                          .stepOneAuthAcocunt
                                                          .value +
                                                      1;
                                                }
                                              } else if (homeController
                                                      .stepOneAuthAcocunt
                                                      .value ==
                                                  1) {
                                                if (homeController.quTwo ==
                                                        "a" ||
                                                    homeController.asTwo ==
                                                        "a") {
                                                  homeController
                                                      .isEmptyData.value = true;
                                                } else {
                                                  homeController
                                                      .stepOneAuthAcocunt
                                                      .value = homeController
                                                          .stepOneAuthAcocunt
                                                          .value +
                                                      1;
                                                }
                                              } else if (homeController
                                                      .stepOneAuthAcocunt
                                                      .value ==
                                                  2) {
                                                if (homeController
                                                        .phoneNumber ==
                                                    "a") {
                                                  homeController
                                                      .isEmptyData.value = true;
                                                } else {
                                                  homeController
                                                      .stepOneAuthAcocunt
                                                      .value = homeController
                                                          .stepOneAuthAcocunt
                                                          .value +
                                                      1;

                                                  homeController.creaeAuth(
                                                      homeController.quOne
                                                          .toString(),
                                                      homeController.asOne,
                                                      homeController.quTwo
                                                          .toString(),
                                                      homeController.asTwo,
                                                      "00222${homeController.phoneNumber}");
                                                }
                                              }
                                            },
                                            child: GetX<HomeController>(
                                              builder: (controller) =>
                                                  AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                alignment: Alignment.center,
                                                width: controller
                                                            .stepOneAuthAcocunt
                                                            .value ==
                                                        2
                                                    ? 290.w
                                                    : 220.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  color: controller
                                                              .stepOneAuthAcocunt
                                                              .value ==
                                                          2
                                                      ? AppColors.TheMain
                                                      : AppColors
                                                          .balckColorTypeFour,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Text(
                                                  controller.stepOneAuthAcocunt
                                                              .value ==
                                                          2
                                                      ? "الحفظ"
                                                      : "التالي",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ))),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                          visible: controller.isEmptyData.value,
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
                                  child: Lottie.asset(ImagesPath.wearing,
                                      width: 70.w, height: 70.h),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 115.h),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 45.w),
                                    child: Text(
                                      "لايمكنك المواصلة هنالك قيم فارغة..!",
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
                                        controller.isEmptyData.value = false;
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 250.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.TheMain,
                                            borderRadius:
                                                BorderRadius.circular(30)),
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
                          ))),
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                          visible: controller.waitAddAuth.value,
                          child: Stack(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.black45),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: Colors.black45,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text(
                                      "العملية تَتِم في الإرجاء..إنتظر قليلاً",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor,
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))),
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                          visible: controller.IsAddAuth.value,
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
                                  child: Lottie.asset(ImagesPath.successfully,
                                      width: 70.w, height: 70.h),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 115.h),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 45.w),
                                    child: Text(
                                      " عزيزي العميل لقد أكملت بالفعل عملية توثيق حسابك بنجاح,نُشكرك على ذلك ",
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
                                        homeController.clearAuth();
                                        Get.offAll(HomeScreen());
                                        homeController.getDataUserInHome();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 250.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.TheMain,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          "التوجه الان",
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
                          ))),
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                          visible: controller.isTheAuthError.value,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 45.w),
                                    child: Text(
                                      "عزيزي العميل هنالك خطا في إتمام الطلب,الرجاء المحاولة لاحقًا",
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
                                        controller.clearAuth();
                                        Get.offAll(HomeScreen());
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 250.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.TheMain,
                                            borderRadius:
                                                BorderRadius.circular(30)),
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
                          ))),
                ],
              ),
            )));
  }
}
