import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:kilyani_app/core/data/model/basket.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
class BasketTheScreen extends StatelessWidget {
  const BasketTheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      if (!controller.showTheBasket.value) {
        return const SizedBox.shrink();
      }

      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.80,
        color: Colors.white,
        child: SafeArea(
          child: Stack(
            children: [
              // الجزء الرئيسي القابل للتمرير
              ListView(
                children: [
                  SizedBox(height: 12.h),
                  _buildProgressBar(context),
                  SizedBox(height: 12.h),
                  Container(
                    alignment: Alignment.center,
                    width: 220.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: AppColors.blackColorTypeTeo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "محتويات السلة",
                      style: TextStyle(
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.whiteColor,
                        fontSize: 17.2.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // محتوى السلة (يجب تعديله ليكون قابلاً للتمرير داخلياً إذا لزم الأمر)
                  _buildBasketContent(context, controller),
                  // مسافة خالية تعادل ارتفاع الجزء السفلي لمنع التداخل
                  SizedBox(height: 100.h), // اضبط حسب ارتفاع الـ Footer
                ],
              ),
              
              // الجزء السفلي (ثابت في الأسفل)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _BasketFooter(controller: controller),
              ),
              
              // نافذة الخصم
              Visibility(
                visible: controller.showCode.value,
                child: _buildDiscountCodeModal(context, controller),
              ),
 Visibility(
                                      visible: controller.waitCheckCode.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.h),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Lottie.asset(
                                                  ImagesPath.loading,
                                                  width: 70.w,
                                                  height: 70.h),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 70.h),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                child: Text(
                                                  "العملية تَتِم في الإرجاء..إنتظر قليلاً",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
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
                                      )),   Visibility(
                                      visible: controller.isCodeNoTrue.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 48.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                  ImagesPath.error,
                                                  width: 70.w,
                                                  height: 70.h),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 115.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45.w),
                                                child: Text(
                                                  "كود التحقق الذي أدخلته خاطئ..حاول مجددًا",
                                                  style: TextStyle(
                                                    height: 1.5.h,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
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
                                              padding:
                                                  EdgeInsets.only(bottom: 38.h),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isCodeNoTrue
                                                        .value = false;
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 250.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.TheMain,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Text(
                                                      "إخفاء",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )),Visibility(
                                      visible:
                                          controller.isTheCodeTheUser.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 48.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                  ImagesPath.wearing,
                                                  width: 70.w,
                                                  height: 70.h),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 115.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45.w),
                                                child: Text(
                                                  "لايمكنك إستخدام كودك الخاص للحصول على خصم خاص..",
                                                  style: TextStyle(
                                                    height: 1.5.h,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
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
                                              padding:
                                                  EdgeInsets.only(bottom: 38.h),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isTheCodeTheUser
                                                        .value = false;
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 250.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.TheMain,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Text(
                                                      "إخفاء",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )), Visibility(
                                      visible: controller.isCodeTrue.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 48.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                  ImagesPath.successfully,
                                                  width: 70.w,
                                                  height: 70.h),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 115.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45.w),
                                                child: Text(
                                                  "لقد ادخلت كود التحقق بنجاح يمكنك الان من إكمال إنشاء الطلبية مع التخفيض الخاص",
                                                  style: TextStyle(
                                                    height: 1.5.h,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
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
                                              padding:
                                                  EdgeInsets.only(bottom: 38.h),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isCodeTrue
                                                        .value = false;
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 250.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.TheMain,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Text(
                                                      "إخفاء",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )),  Visibility(
                      visible: controller.waitDeleteBasket.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black38,
                      )),
                  Visibility(
                      visible: controller.waitDeleteBasket.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black38,
                      )),
                  Visibility(
                      visible: controller.waitCreateOrder.value,
                      child: Stack(children: [
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
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                      ])),
                  Visibility(
                      visible: controller.isCreateOrder.value,
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
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 130.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset(ImagesPath.successfully,
                                  width: 70.w, height: 70.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 120.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  "تم إنشاء الطلبية بنجاح",
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
                          Padding(
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  controller.isCreateOrder.value = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 220.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.TheMain,
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
                            ),
                          ),
                        ],
                      )), Visibility(
                      visible: controller.isNotCreateOrder.value,
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
                            color: Colors.black12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 158.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset(ImagesPath.error,
                                  width: 70.w, height: 70.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 125.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                child: Text(
                                  "لم يتم إنشاء الطلبية,هنالك خطا حاول مجددًا",
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
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  controller.waitCreateOrder.value = false;
                                  controller.isNotCreateOrder.value = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 220.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.TheMain,
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
                            ),
                          ),
                        ],
                      )),Visibility(
                      visible: controller.isNoMoneyInWallet.value,
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
                            color: Colors.black12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 158.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset(ImagesPath.error,
                                  width: 70.w, height: 70.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 105.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                child: Text(
                                  "لاتمتلك رصيد كافي في المحفظة لإتمام الطلبية",
                                  style: TextStyle(
                                    height: 1.3.h,
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
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  controller.isNoMoneyInWallet.value = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 220.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.TheMain,
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
                            ),
                          ),
                        ],
                      )), Visibility(
                      visible: controller.isTheBasketEmpty.value,
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
                            color: Colors.black12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 158.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset(ImagesPath.error,
                                  width: 70.w, height: 70.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 125.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                child: Text(
                                  "لايمكنك القيام بهذا الأمر ..السلة فارغة!",
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
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  controller.isTheBasketEmpty.value = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 220.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.TheMain,
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
                            ),
                          ),
                        ],
                      )), Visibility(
                      visible: controller.noLocation.value,
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
                            color: Colors.black12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 158.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset(ImagesPath.error,
                                  width: 70.w, height: 70.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 105.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                child: Text(
                                  "لم تقم بإضافة موقعك..أضف موقعك من أجل إنشاء الطلبية",
                                  style: TextStyle(
                                    height: 1.2.h,
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
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  controller.noLocation.value = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 220.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.TheMain,
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
                            ),
                          ),
                        ],
                      )),
              
            ],
          ),
        ),
      );
    });
  }
}

Widget _buildProgressBar(BuildContext context) {
  final steps = [
    _StepData(number: 1, title: "السلة", isActive: true),
    _StepData(number: 2, title: "الطلبية", isActive: false),
    _StepData(number: 3, title: "موعد الوصول", isActive: false),
    _StepData(number: 4, title: "الإنهاء", isActive: false),
  ];

  return Padding(
    padding: EdgeInsets.only(top: 20.h),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: 70.h,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < steps.length; i++) ...[
                _ProgressStep(
                  number: steps[i].number,
                  title: steps[i].title,
                  isActive: steps[i].isActive,
                ),
                if (i < steps.length - 1) _buildConnector(),
              ],
            ],
          ),
        ),
      ),
    ),
  );
}

// خط التوصيل بين المراحل
Widget _buildConnector() {
  return Padding(
    padding: EdgeInsets.only(bottom: 7.h),
    child: Container(
      width: 30.w,
      height: 1.7.h,
      decoration: BoxDecoration(
        color: AppColors.TheMain,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

// نموذج بيانات المرحلة
class _StepData {
  final int number;
  final String title;
  final bool isActive;

  _StepData({
    required this.number,
    required this.title,
    required this.isActive,
  });
}

// مكون مخصص لعنصر المرحلة
class _ProgressStep extends StatelessWidget {
  final int number;
  final String title;
  final bool isActive;

  const _ProgressStep({
    required this.number,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // دائرة الرقم
        Container(
          width: 25.w,
          height: 25.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.yellowColor : const Color(0xFF424141),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "$number",
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                color: isActive
                    ? AppColors.balckColorTypeFour
                    : AppColors.whiteColor,
                fontSize: 16.2.sp,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),

        SizedBox(height: 3.h),

        // عنوان المرحلة
        Text(
          title,
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.blackColorTypeTeo,
            fontSize: isActive ? 15.2.sp : 14.2.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ------------------ بناء محتوى السلة ------------------
Widget _buildBasketContent(BuildContext context, HomeController controller) {
  return  ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.6, // ارتفاع مناسب
    ),
    child:
  Obx(() {
    // إذا كانت القائمة فارغة، نعرض حالة الشيمر أو فارغة
    if (controller.listofBasket.value.isEmpty) {
      controller.checkTheBasket(); // تفعيل جلب البيانات

      // إذا انتهى الفحص وأثبتت أنها فارغة:
      if (controller.isTheBasketReadyEmpty.value) {
        return _buildEmptyBasket();
      } else {
        return _buildLoadingShimmers();
      }
    }

    // خلاف ذلك، نعرض ListView للعناصر
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      physics: const BouncingScrollPhysics(),
      itemCount: controller.listofBasket.value.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final basket = controller.listofBasket.value[index];
        return _BasketItem(
          basket: basket,
          controller: controller,
        );
      },
    );
  }));
}

// ======= حالة السلة الفارغة =======
Widget _buildEmptyBasket() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          ImagesPath.empty,
          width: 200.w,
          height: 200.h,
        ),
        SizedBox(height: 16.h),
        Text(
          'سلة الشراء فارغة',
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.TheMain,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'قم بإضافة منتجات لتظهر هنا',
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            fontSize: 14.sp,
            color: AppColors.blackColorTypeTeo,
          ),
        ),
      ],
    ),
  );
}

// ======= شيمر أثناء التحميل =======
Widget _buildLoadingShimmers() {
  return ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    itemCount: 3,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, i) {
      return Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: _buildShimmerItem(),
      );
    },
  );
}

Widget _buildShimmerItem() {
  return Shimmer.fromColors(
    baseColor: const Color(0xFFEEEEEE),
    highlightColor: Colors.white,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة وهمية للشيمر
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 16.w),
          // تفاصيل وهمية للشيمر
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 16.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 16.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// ======= عنصر واحد في القائمة مع ExpansionTile وتصميم مرتب =======
class _BasketItem extends StatelessWidget {
  final Basket basket;
  final HomeController controller;

  const _BasketItem({
    required this.basket,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // نتحقق إن كان العنصر حالياً مُنجنح للتفاصيل
      final isExpanded = controller.showMoreDetails.value &&
          (basket.shoppingId.toString() ==
              controller.idShowMordeDetails.value.toString());

      return Card(
        elevation: 2,
        color: AppColors.whiteColor,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ExpansionTile(
          // إذا كان مُفَعّل مسبقاً، نجعله منبسط
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            // عند فتح أو إغلاق العنصر نمرر الـ ID للكنترولر
            controller.toggleDetails(basket.shoppingId.toString());
          },
          // الصورة في أقصى اليسار
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              width: 80.w,
              height: 120.h,
              fit: BoxFit.cover,
              imageUrl: basket.product_image,
              placeholder: (context, url) => Container(
                width: 80.w,
                height: 80.h,
                color: AppColors.TheMain.withOpacity(0.1),
                child: Center(
                  child: Icon(
                    Icons.shopping_basket,
                    color: AppColors.TheMain,
                    size: 30.w,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 80.w,
                height: 80.h,
                color: Colors.grey[200],
                child: Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.grey[400],
                    size: 30.w,
                  ),
                ),
              ),
            ),
          ),
          // اسم المنتج (العنوان)
          title: Text(
            basket.productName,
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: AppColors.TheMain,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),

          // السعر والكمية تحت الاسم
          subtitle: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                _buildPriceTag(basket.price),
                _buildQuantityTag(basket.quantity),
              ],
            ),
          ),
          // المساحة الداخلية عند الفتح
          childrenPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
          // محتوى التفاصيل عند الفتح
          children: [
            // صف الحجم
            Row(
              children: [
                Text(
                  'الحجم:',
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.blackColorTypeTeo,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  basket.size_name,
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.blackColorTypeTeo,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            // صف اللون
            Row(
              children: [
                Text(
                  'اللون:',
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.blackColorTypeTeo,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                if (basket.color_code == "0xFFF0EFEF")
                  Text(
                    'لا يوجد لون',
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.redColor,
                      fontSize: 14.sp,
                    ),
                  )
                else
                  Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: Color(int.parse(basket.color_code)),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 12.h),

            // زر الإزالة بعرض كامل
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redColor.withOpacity(0.1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                onPressed: () =>
                    controller.deleteBasket(basket.shoppingId.toString()),
                icon: Icon(Icons.delete_outline,
                    color: AppColors.redColor, size: 20.w),
                label: Text(
                  'إزالة من السلة',
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.redColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      );
    });
  }

  Widget _buildPriceTag(var price) {
    return Row(
      children: [
        Text(
          'السعر:',
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.blackColorTypeTeo,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          price.toStringAsFixed(2),
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: Colors.green[700],
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          'أوقية',
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.blackColorTypeTeo,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityTag(int quantity) {
    return Row(
      children: [
        Text(
          'الكمية:',
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.blackColorTypeTeo,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          quantity.toString(),
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.TheMain,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _BasketFooter extends StatelessWidget {
  final HomeController controller;

  const _BasketFooter({required this.controller});

  @override
  Widget build(BuildContext context) {
    // نستخدم Directionality مرة واحدة للنصوص العربية
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ==== 1. صف السعر وموقع التسليم ====
            _TotalAndLocationSection(controller: controller),

            SizedBox(height: 16.h),

            // ==== 2. صف الأزرار: حذف السلة و إنشاء الطلبية ====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // زر حذف السلة
                _FooterButton(
                  text: "حذف السلة",
                  backgroundColor: AppColors.blackColorTypeTeo,
                  textColor: Colors.white,
                  onTap: () {
                    controller
                        .deleteAllBasket(controller.specilcode.toString());
                  },
                ),
SizedBox(width: 10.w,),
                // زر إنشاء الطلبية
                _FooterButton(
                  text: "إنشاء الطلبية",
                  backgroundColor: AppColors.TheMain,
                  textColor: Colors.white,
                  onTap: () {
                    if (controller.address.value == "لايوجد عنوان") {
                      controller.noLocation.value = true;
                    } else if (controller.listofBasket.value.isEmpty) {
                      controller.isTheBasketEmpty.value = true;
                    } else if (controller.users!.value.amount <=
                        controller.totalPrice.value) {
                      controller.isNoMoneyInWallet.value = true;
                    } else {
                      controller.oldPriceBasket.value =
                          controller.totalPrice.value;
                      controller.showCode.value = true;
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== WIDGET: صف السعر وموقع التسليم ====================
class _TotalAndLocationSection extends StatelessWidget {
  final HomeController controller;

  const _TotalAndLocationSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // صف إجمالي السعر
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "إجمالي سعر السلة:",
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                color: Color.fromARGB(255, 83, 82, 82),
                fontSize: 15.2.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            // قيمة السعر نفسها مع تحديث تلقائي
            GetX<HomeController>(
              builder: (_) => Text(
                "${controller.totalPrice.value.toStringAsFixed(2)} أوقية",
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: const Color.fromARGB(255, 229, 22, 22),
                  fontSize: 19.2.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        // صف موقع التسليم (عند الضغط عليه يظهر اختيار العنوان)
        GestureDetector(
          onTap: () {
            controller.checkWallet();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "موقع تسليم العملية:",
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: Color.fromARGB(255, 83, 82, 82),
                  fontSize: 15.2.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // عرض العنوان من الكنترولر تلقائيًا
              Expanded(
                child: GetX<HomeController>(
                  builder: (_) => Text(
                    controller.address.value,
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.TheMain,
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),

              // أيقونة مؤشر أن النص قابل للنقر (اختياري)
              Icon(
                Icons.location_on_outlined,
                color: AppColors.TheMain,
                size: 20.w,
              ),
            ],
          ),
        ),
      ],
    );
  }

}

// ==================== WIDGET: زر مُعتمد في الجزء السفلي ====================
class _FooterButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _FooterButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: textColor,
              fontSize: 15.2.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
Widget _buildDiscountCodeModal(BuildContext context, HomeController controller) {
  return Stack(
    children: [
      // طبقة التعتيم الخلفية
      _buildBackgroundOverlay(),
      
      // محتوى النافذة الرئيسية
      _buildDiscountContent(context, controller),
      
      // حالات التحميل والرسائل
      _buildLoadingState(controller,context),
      _buildCodeErrorState(controller,context),
      _buildUserCodeErrorState(controller,context),
      _buildCodeSuccessState(controller,context),
    ],
  );
}

Widget _buildBackgroundOverlay() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.black.withOpacity(0.5),
  );
}

Widget _buildDiscountContent(BuildContext context, HomeController controller) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 550.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Column(
        children: [
          // رأس النافذة
          _buildDiscountHeader(controller),
          SizedBox(height: 15.h),
          
          // عنوان الصفحة
          _buildDiscountTitle(),
          SizedBox(height: 20.h),
          
          // حقل إدخال الكود
          _buildCodeInputField(controller),
          SizedBox(height: 20.h),
          
          // فاصل
          _buildDivider(),
          SizedBox(height: 20.h),
          
          // أسعار قبل وبعد الخصم
          _buildPriceSection(controller),
          SizedBox(height: 20.h),
          
          // فاصل
          _buildDivider(widthFactor: 0.5),
          SizedBox(height: 25.h),
          
          // رسالة التوجيه
          _buildInfoMessage(),
          SizedBox(height: 25.h),
          
          // زر إنشاء الطلبية
          _buildCreateOrderButton(controller),
        ],
      ),
    ),
  );
}

Widget _buildDiscountHeader(HomeController controller) {
  return Align(
    alignment: Alignment.topRight,
    child: IconButton(
      icon: Icon(Icons.close, size: 28.sp, color: AppColors.TheMain),
      onPressed: () => controller.showCode.value = false,
    ),
  );
}

Widget _buildDiscountTitle() {
  return Text(
    "أدخل كود خصم للإستفادة من الخصم على إجمالي المبلغ",
    style: TextStyle(
      fontFamily: AppTextStyles.Almarai,
      color: AppColors.balckColorTypeFour,
      fontSize: 17.sp,
      fontWeight: FontWeight.bold,
      height: 1.5,
    ),
    textAlign: TextAlign.center,
    maxLines: 2,
  );
}

Widget _buildCodeInputField(HomeController controller) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.TheMain.withOpacity(0.3)),
              ),
              child: TextFormField(
                controller: controller.controllerOne,
                decoration: InputDecoration(
                  hintText: "لطفًا ادخل كود الخصم",
                  hintStyle: TextStyle(
                    color: AppColors.TheMain.withOpacity(0.6),
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  prefixIcon: Icon(
                    Icons.confirmation_num,
                    color: AppColors.TheMain,
                    size: 24.sp,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.TheMain,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  controller.codeEnter = value;
                },
              ),
            ),
          ),
          SizedBox(width: 10.w),
          ElevatedButton(
            onPressed: () {
              controller.checkTheCode(controller.codeEnter);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
            child: Text(
              "التحقق",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: AppTextStyles.Almarai,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildDivider({double widthFactor = 0.8}) {
  return FractionallySizedBox(
    widthFactor: widthFactor,
    child: Divider(
      thickness: 1,
      color: AppColors.balckColorTypeFour.withOpacity(0.3),
    ),
  );
}

Widget _buildPriceSection(HomeController controller) {
  return Column(
    children: [
      // السعر قبل الخصم
      _buildPriceRow(
        "إجمالي السعر قبل الخصم:",
        controller.oldPriceBasket.value.toString(),
        Color(0xFFE51616),
      ),
      SizedBox(height: 12.h),
      
      // السعر بعد الخصم
      _buildPriceRow(
        "إجمالي السعر بعد الخصم:",
        controller.newPriceBasket.value.toString(),
        AppColors.TheMain,
      ),
    ],
  );
}

Widget _buildPriceRow(String label, String price, Color priceColor) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: Color(0xFF535252),
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: priceColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                "أوقية",
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: Color(0xFF535252),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildInfoMessage() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Text(
      "يمكنك تخطي إضافة كود الخصم والضغط مباشرة على زر إنشاء الطلبية",
      style: TextStyle(
        fontFamily: AppTextStyles.Almarai,
        color: AppColors.balckColorTypeFour,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget _buildCreateOrderButton(HomeController controller) {
  return ElevatedButton(
    onPressed: () {
      controller.creaetOrder(
        controller.totalPrice.toString(),
        controller.id_bussines.toString(),
        controller.codeEnter.toString(),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.TheMain,
      minimumSize: Size(250.w, 50.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 5,
      shadowColor: AppColors.TheMain.withOpacity(0.3),
    ),
    child: Text(
      "إنشاء الطلبية",
      style: TextStyle(
        fontSize: 17.sp,
        fontFamily: AppTextStyles.Almarai,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// ----- حالات الرسائل المختلفة -----

Widget _buildLoadingState(HomeController controller ,BuildContext context) {
  return Visibility(
    visible: controller.waitCheckCode.value,
    child: _buildMessageDialog(
      Lottie.asset(ImagesPath.loading, width: 100.w, height: 100.h),
      "جاري التحقق من الكود... يرجى الانتظار",
      null,context
    ),
  );
}

Widget _buildCodeErrorState(HomeController controller,BuildContext context) {
  return Visibility(
    visible: controller.isCodeNoTrue.value,
    child: _buildMessageDialog(
      Lottie.asset(ImagesPath.error, width: 100.w, height: 100.h),
      "كود الخصم الذي أدخلته غير صحيح، يرجى المحاولة مرة أخرى",
      () => controller.isCodeNoTrue.value = false,context
    ),
  );
}

Widget _buildUserCodeErrorState(HomeController controller,BuildContext context) {
  return Visibility(
    visible: controller.isTheCodeTheUser.value,
    child: _buildMessageDialog(
      Lottie.asset(ImagesPath.wearing, width: 100.w, height: 100.h),
      "لا يمكنك استخدام كود الخصم الخاص بك للحصول على خصم",
      () => controller.isTheCodeTheUser.value = false,context
    ),
  );
}

Widget _buildCodeSuccessState(HomeController controller,BuildContext context) {
  return Visibility(
    visible: controller.isCodeTrue.value,
    child: _buildMessageDialog(
      Lottie.asset(ImagesPath.successfully, width: 100.w, height: 100.h),
      "تم تطبيق كود الخصم بنجاح! يمكنك الآن إكمال الطلبية",
      () => controller.isCodeTrue.value = false,context
    ),
  );
}

Widget _buildMessageDialog(Widget animation, String message, VoidCallback? onClose ,BuildContext context) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          animation,
          SizedBox(height: 20.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              fontSize: 16.sp,
              height: 1.6,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (onClose != null) ...[
            SizedBox(height: 25.h),
            ElevatedButton(
              onPressed: onClose,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.TheMain,
                minimumSize: Size(150.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                "موافق",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}