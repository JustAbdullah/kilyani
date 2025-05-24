import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/custome_textfiled.dart';
import 'forget_password_three.dart';

class ForgetPasswordTwo extends StatelessWidget {
  const ForgetPasswordTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.ForgetThePasswordPageTwo.value,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColors.whiteColor,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.ForgetThePasswordPageTwo
                                          .value = false;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, top: 5.h),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 40.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.TheMain,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                SizedBox(
                                  height: 0.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 120.h,
                                    child: Image.asset(
                                      ImagesPath.logo,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: TextCustom(
                                      fontWeight: FontWeight.bold,
                                      theText: "مرحبًا بك",
                                      fontSizeWidth: 17.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontColor: AppColors.TheMain,
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      "صفحة إستعادة كلمة المرور",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor,
                                      ),
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      "أدخل رقم هاتفك المُدخل عند توثيق حسابك",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: const Color.fromARGB(
                                            255, 56, 56, 56),
                                      ),
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      "هذة العملية خاصة للحسابات التى تم توثيقها..غير ذلك لايمكن إستعادة حسابك",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.redColor,
                                      ),
                                    )),
                                SizedBox(
                                  height: 38.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 220.w,
                                              height: 40.h,
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: TextFormFiledCustom(
                                                  labelData: "رقم الهاتف".tr,
                                                  hintData:
                                                      "لطفًا أدخل رقم هاتفك هنا"
                                                          .tr,
                                                  iconData: Icons
                                                      .mobile_friendly_rounded,
                                                  controllerData: controller
                                                      .controllerThreeAuth,
                                                  value: (value) {
                                                    SystemChrome
                                                        .setEnabledSystemUIMode(
                                                            SystemUiMode.manual,
                                                            overlays: []);
                                                    controller.phoneNumber =
                                                        value.toString();
                                                    return value;
                                                  },
                                                  fillColor: Color.fromARGB(
                                                      255, 244, 244, 244),
                                                  hintColor: AppColors.TheMain,
                                                  iconColor: AppColors.TheMain,
                                                  borderSideColor:
                                                      Color.fromARGB(
                                                          255, 244, 244, 244),
                                                  fontColor: AppColors.TheMain,
                                                  obscureText: false,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  autofillHints: [
                                                    AutofillHints.name
                                                  ],
                                                  onChanged: (value) {
                                                    SystemChrome
                                                        .setEnabledSystemUIMode(
                                                            SystemUiMode.manual,
                                                            overlays: []);
                                                    controller.phoneNumber =
                                                        value.toString();
                                                    return value;
                                                  },
                                                  validator: (value) {},
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 7.h),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  width: 50.w,
                                                  height: 35.h,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.TheMain,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Text("+222",
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: Colors.white,
                                                      ))),
                                            ),
                                          ],
                                        ))),
                                SizedBox(
                                  height: 78.h,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 00.h),
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 45.w),
                                        child: InkWell(
                                          onTap: () {
                                            if (controller
                                                    .PhoneNumberForgetPassword ==
                                                "a") {
                                              controller
                                                  .isEmptyDataForagetPassword
                                                  .value = true;
                                            } else {
                                              controller
                                                  .isEmptyDataForagetPassword
                                                  .value = false;
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 290.w,
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              color: AppColors.TheMain,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "التحقق الان",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors.whiteColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ))),
                              ]),
                        )),
                  ),
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                          visible: controller.isEmptyDataForagetPassword.value,
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
                                      "عزيزي العميل هنالك قيم فارغة الرجاء,ملا البيانات بشكل كامل",
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
                                        controller.isEmptyDataForagetPassword
                                            .value = false;
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
                  ForgetPasswordThree()
                ],
              ),
            )));
  }
}
