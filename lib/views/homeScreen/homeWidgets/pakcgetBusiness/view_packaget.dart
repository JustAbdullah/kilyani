import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class ViewPackaget extends StatelessWidget {
  const ViewPackaget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.getDataPackages();
    return GetX<HomeController>(
        builder: (controller) => Visibility(
              visible: controller.showThePackage.value,
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: AppColors.whiteColor,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.showThePackage.value = false;
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.w, top: 5.h),
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
                            height: 30.h,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 220.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: AppColors.TheMain,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "بــاقات الأعمال الخاصة بالمتاجر",
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
                            height: 30.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Text(
                                "هذة باقات الأعمال الخاصة بالمتاجر,يمكنك تفحص الباقات ورؤية مزايا الباقات",
                                style: TextStyle(
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour,
                                  fontSize: 18.2.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Obx(() {
                            if (homeController.listofPackages.value.isEmpty) {
                              return Center(
                                child: Lottie.asset(ImagesPath.empty,
                                    width: 200.w),
                              );
                            } else {
                              return SizedBox(
                                height: 270.h,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: homeController
                                        .listofPackages.value.length,
                                    itemBuilder: (context, index) {
                                      final package = homeController
                                          .listofPackages.value[index];

                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 10.h),
                                        child: Container(
                                          width: 200.w,
                                          height: 270.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                    0.2), // لون الظل
                                                spreadRadius: 2, // انتشار الظل
                                                blurRadius: 2, // انعكاس الظل
                                                offset: Offset(0,
                                                    3), // انحراف الظل (الاتجاه)
                                              ),
                                            ],
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 25.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "الفئة:",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 17.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        package.packageName,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color:
                                                              AppColors.TheMain,
                                                          fontSize: 17.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "عدد المنتجات",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        package.limitProduct
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color:
                                                              AppColors.TheMain,
                                                          fontSize: 15.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        "منتج فقط",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "إمكانية التعديل:",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        package.editProduct,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color:
                                                              package.editProduct ==
                                                                      "لا"
                                                                  ? AppColors
                                                                      .redColor
                                                                  : Colors.green[
                                                                      700],
                                                          fontSize: 15.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "إضافة مزاد:",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        package.addAuction,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color:
                                                              package.addAuction ==
                                                                      "لا"
                                                                  ? AppColors
                                                                      .redColor
                                                                  : Colors.green[
                                                                      700],
                                                          fontSize: 15.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "إضافة الالوان والاحجام:",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        package.colorsSizes,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color:
                                                              package.colorsSizes ==
                                                                      "لا"
                                                                  ? AppColors
                                                                      .redColor
                                                                  : Colors.green[
                                                                      700],
                                                          fontSize: 15.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "سعر الباقة:",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Text(
                                                        package.packagePrice ==
                                                                0
                                                            ? "مجانًا"
                                                            : package
                                                                .packagePrice
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color:
                                                              Colors.green[700],
                                                          fontSize: 15.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4.h),
                                                        child: Text(
                                                          package.packagePrice ==
                                                                  0
                                                              ? ""
                                                              : "أوقية",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                AppTextStyles
                                                                    .Almarai,
                                                            color: AppColors
                                                                .balckColorTypeFour,
                                                            fontSize: 12.2.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "وصف الفئة:",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 15.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.w),
                                                    child: Text(
                                                      package
                                                          .packageDescription,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color:
                                                            AppColors.TheMain,
                                                        fontSize: 12.2.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }
                          }),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Text(
                                "ملاحظة:هذة الباقات موجه للمتاجر التى تم قبولها بشكل رسمي في المنصة",
                                style: TextStyle(
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.redColor,
                                  fontSize: 18.2.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
