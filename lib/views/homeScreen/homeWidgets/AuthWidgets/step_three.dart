import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_text.dart';
import '../../../../customWidgets/custome_textfiled.dart';

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 00.w),
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: TextCustom(
                        fontWeight: FontWeight.bold,
                        theText: "مرحبًا بك",
                        fontSizeWidth: 17.sp,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.TheMain,
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "انت في مرحلة عملية توثيق حسابك الخاص",
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "اخر مرحلة من مراحل توثيق حسابك..قم بإدخال رقم هاتفك الصحيح",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppTextStyles.Almarai,
                          color: const Color.fromARGB(255, 56, 56, 56),
                        ),
                      )),
                  SizedBox(
                    height: 18.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 220.w,
                                height: 40.h,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextFormFiledCustom(
                                    labelData: "رقم الهاتف".tr,
                                    hintData: "لطفًا أدخل رقم هاتفك هنا".tr,
                                    iconData: Icons.mobile_friendly_rounded,
                                    controllerData:
                                        homeController.controllerFiveAuth,
                                    value: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.phoneNumber =
                                          value.toString();
                                      return value;
                                    },
                                    fillColor:
                                        Color.fromARGB(255, 244, 244, 244),
                                    hintColor: AppColors.TheMain,
                                    iconColor: AppColors.TheMain,
                                    borderSideColor:
                                        Color.fromARGB(255, 244, 244, 244),
                                    fontColor: AppColors.TheMain,
                                    obscureText: false,
                                    keyboardType: TextInputType.phone,
                                    autofillHints: [AutofillHints.name],
                                    onChanged: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.phoneNumber =
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
                                padding: EdgeInsets.only(bottom: 7.h),
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 50.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.TheMain,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text("+222",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: Colors.white,
                                        ))),
                              ),
                            ],
                          ))),
                  SizedBox(
                    height: 8.h,
                  ),
                ])));
  }
}
