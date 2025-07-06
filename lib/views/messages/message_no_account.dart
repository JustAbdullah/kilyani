import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/views/WelcomeScreen/welcome.dart';

import 'package:lottie/lottie.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class MessageNoAccount extends StatelessWidget {
  const MessageNoAccount({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showMessageNotHaveAccount.value,
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
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 270.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColorTypeTwo,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.wearing,
                            width: 60.w, height: 60.h),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            "لاتمتلك حساب للقيام بهذه العملية,,قم رجاءًا بإنشاء حساب للقيام بذلك",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 98, 98, 98),
                              fontSize: 15.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.showMessageNotHaveAccount.value = false;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: AppColors.balckColorTypeFour,
                                borderRadius: BorderRadius.circular(10)),
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 160.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        controller.isNoHaveAccount.value = true;
                        controller.isNotHaveAccount.value = false;
                        controller.showMessageNotHaveAccount.value = false;
                        Get.offAll(WelcomeScreen());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 220.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: AppColors.TheMain,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "إنشاء حساب الان",
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
                  ),
                ),
              ],
            )));
  }
}
