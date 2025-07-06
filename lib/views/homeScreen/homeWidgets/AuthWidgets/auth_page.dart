import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class authPage extends StatelessWidget {
  const authPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.authPage.value,
            child: Directionality(
              textDirection: TextDirection.rtl,
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
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  controller.authPage.value = false;
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 10.w, top: 5.h),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.TheMain,
                                      borderRadius: BorderRadius.circular(10),
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
                              height: 5.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 220.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: AppColors.TheMain,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "نظام التوثيق",
                                style: TextStyle(
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.whiteColor,
                                  fontSize: 17.2.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Text(
                                  "نظام التوثيق هو نظام متطور يرفع من كفاءة وأمن حسابك الخاص",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.blackColorTypeTeo,
                                    fontSize: 18.2.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Text(
                                  "نظام التوثيق يتكون من عدة مراحل مختلفة تبدًا من ",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour,
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                )),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "-إعداد الاسئلة الحماية الخاص بك",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: const Color.fromARGB(
                                            255, 77, 76, 76),
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "-إعداد الاجوبة الخاصة بك",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: const Color.fromARGB(
                                            255, 77, 76, 76),
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "-إضافة رقم هاتفك الخاص",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: const Color.fromARGB(
                                            255, 77, 76, 76),
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 150.h,
                              width: MediaQuery.of(context).size.width,
                              child: Lottie.asset(ImagesPath.safeAccount),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "حالة نظام التوثيق الخاص بك هو:",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour,
                                        fontSize: 18.2.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      controller.users!.value.status_auth == 0
                                          ? "غير موثق"
                                          : "موثق",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.TheMain,
                                        fontSize: 18.2.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Text(
                                  "أبدأ الان عمل نظام التوثيق الخاص بك",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour,
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: 25.h,
                            ),
                            InkWell(
                              onTap: () {
                                if (controller.users!.value.status_auth == 0) {
                                  controller.showTheAuthCreaet.value = true;
                                } else {}
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 200.h,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color:
                                        controller.users!.value.status_auth == 0
                                            ? AppColors.yellowColor
                                            : AppColors.yellowColor
                                                .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "التوثيق الان",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour,
                                    fontSize: 18.2.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ])))
                ],
              ),
            )));
  }
}
