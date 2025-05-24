import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class WalltePage extends StatelessWidget {
  const WalltePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.walletShow.value,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            // استخدمنا خلفية داكنة باردة بدلاً من اللون البرتقالي
            backgroundColor: AppColors.whiteColor,
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    // شريط العنوان مع زر الإغلاق
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, right: 20.w),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            controller.walletShow.value = false;
                          },
                          child: Container(
                            width: 35.w,
                            height: 35.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.close,
                              color: AppColors.TheMain,
                              size: 20.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // عنوان الصفحة
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Text(
                        "المحفظة",
                        style: TextStyle(
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.TheMain,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    // بطاقة عرض المبلغ المتوفر
                    Container(
                      padding: EdgeInsets.all(20.w),
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "المبلغ المتوفر في محفظتك هو:",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Colors.grey.shade800,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "${controller.users!.value.amount.toString()} أوقية",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.TheMain,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    // عنوان لائحة العمليات والإشعارات
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Text(
                        "لائحة الإشعارات والعمليات التي تجري في حسابك",
                        style: TextStyle(
                          fontFamily: AppTextStyles.Almarai,
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    // قائمة العمليات مع تصميم بطاقة مميز لكل عملية
                    Expanded(
                      child: Obx(() {
                        if (controller.listofWalletHistory.value.isEmpty) {
                          return Center(
                            child: Lottie.asset(
                              ImagesPath.empty,
                              width: 200.w,
                            ),
                          );
                        } else {
                          return ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            itemCount:
                                controller.listofWalletHistory.value.length,
                            itemBuilder: (context, index) {
                              final history =
                                  controller.listofWalletHistory.value[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 20.h),
                                padding: EdgeInsets.all(15.w),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.95),
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // صف التاريخ
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          history.date_of_operation,
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.indigo.shade800,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          history.date,
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.indigo.shade800,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    // وصف العملية
                                    Text(
                                      history.description_of_operation,
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: Colors.grey.shade800,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 10.h),
                                    // عرض مبلغ العملية مع العملة
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "مبلغ هذه العملية هو: ",
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.grey.shade800,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${history.transaction_amount.toString()} أوقية",
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: Colors.indigo.shade800,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
