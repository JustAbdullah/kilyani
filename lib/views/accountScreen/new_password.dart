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

class newPassworsPage extends StatelessWidget {
  const newPassworsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.PageNewPassword.value,
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              SizedBox(
                                height: 0.h,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 140.h,
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
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children: [
                                        TextCustom(
                                          fontWeight: FontWeight.w500,
                                          theText: "مرحبًا بك",
                                          fontSizeWidth: 15.sp,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor:
                                              AppColors.blackColorTypeTeo,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        TextCustom(
                                          fontWeight: FontWeight.bold,
                                          theText:
                                              controller.users!.value.user_name,
                                          fontSizeWidth: 17.sp,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor: AppColors.TheMain,
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 15.h,
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
                                    "ادخل كلمة المرور الجديدة",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppTextStyles.Almarai,
                                      color:
                                          const Color.fromARGB(255, 56, 56, 56),
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
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: TextFormFiledCustom(
                                          labelData: "كلمة المرور الجديدة".tr,
                                          hintData:
                                              "لطفًا ادخل كلمة المرور الجديدة"
                                                  .tr,
                                          iconData: Icons.lock,
                                          controllerData: controller
                                              .controllerFourForgetPassword,
                                          value: (value) {
                                            SystemChrome.setEnabledSystemUIMode(
                                                SystemUiMode.manual,
                                                overlays: []);
                                            controller
                                                    .NewPassewordForgetPassword =
                                                value.toString();
                                            return value;
                                          },
                                          fillColor: Color.fromARGB(
                                              255, 244, 244, 244),
                                          hintColor: AppColors.TheMain,
                                          iconColor: AppColors.TheMain,
                                          borderSideColor: Color.fromARGB(
                                              255, 244, 244, 244),
                                          fontColor: AppColors.TheMain,
                                          obscureText: true,
                                          keyboardType: TextInputType.text,
                                          autofillHints: [AutofillHints.name],
                                          onChanged: (value) {
                                            SystemChrome.setEnabledSystemUIMode(
                                                SystemUiMode.manual,
                                                overlays: []);
                                            controller
                                                    .NewPassewordForgetPassword =
                                                value.toString();
                                            return value;
                                          },
                                          validator: (value) {},
                                        ),
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
                                                  .NewPassewordForgetPassword ==
                                              "a") {
                                            controller
                                                .isEmptyDataForagetPassword
                                                .value = true;
                                          } else {
                                            controller.upDatPassword(controller
                                                .NewPassewordForgetPassword);
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
                                            "التحقق",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ))),
                            ])),
                  ),
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                          visible: controller.waitForgetPassword.value,
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
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                          visible: controller.IsAddForgetPaswwordError.value,
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
                                      "هنالك خطا في العملية,,الرجاء التاكد من البيانات والمحاولة لاحقًا",
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
                                        controller.clearForgetPassword();
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
                          visible: controller.IsAddForgetPaswword.value,
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
                              Align(
                                  alignment: Alignment.center,
                                  child: Lottie.asset(ImagesPath.successfully,
                                      width: 160.w, height: 160.h)),
                              Padding(
                                padding: EdgeInsets.only(top: 115.h),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      "لقد قمت بعملية تغيير كلمة المرور بنجاح.قم بتسجيل الدخول,,قليلاُ وسيتم تحويلك",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor,
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ))),
                ],
              ),
            )));
  }
}
