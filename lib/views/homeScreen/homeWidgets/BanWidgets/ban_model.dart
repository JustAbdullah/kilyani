import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';

import 'package:lottie/lottie.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_container_api.dart';
import '../../../../customWidgets/custom_text.dart';

class BanModel extends StatelessWidget {
  const BanModel({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheBan.value,
            child: Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: AppColors.whiteColor,
                      child: SingleChildScrollView(
                        child: Padding(
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
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      "عزيزي العميل هذا طلبك لعملية الإبلاغ على منتج ما",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                      ),
                                    )),
                                SizedBox(
                                  height: 0.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      "رجاءًا قم بملا نموذج البيانات لتقديم البلاغ",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          "اسم المتجر:",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeThree,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SizedBox(
                                          width: 250.w,
                                          child: Text(
                                            homeController.saveStoreToBan,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors.TheMain,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          "اسم المنتج:",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeThree,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SizedBox(
                                            width: 220.w,
                                            height: 20.h,
                                            child: Text(
                                              homeController
                                                  .saveNameproductToBan,
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors.TheMain,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                      ],
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Material(
                                            elevation: 4,
                                            shadowColor: AppColors.TheMain,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextFormField(
                                              controller: homeController
                                                  .controllerTheOne,
                                              onChanged: (value) {
                                                SystemChrome
                                                    .setEnabledSystemUIMode(
                                                        SystemUiMode.manual,
                                                        overlays: []);
                                                homeController
                                                        .controllerTheOneText =
                                                    value.toString();
                                              },
                                              onSaved: (newValue) {
                                                SystemChrome
                                                    .setEnabledSystemUIMode(
                                                        SystemUiMode.manual,
                                                        overlays: []);
                                                homeController
                                                        .controllerTheOneText =
                                                    newValue.toString();
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'اضف هنا سبب البلاغ'.tr,
                                                  // important line
                                                  // control your hints text size
                                                  hintStyle: TextStyle(
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      letterSpacing: 0.8,
                                                      color: AppColors
                                                          .balckColorTypeFour
                                                          .withOpacity(0.5),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  fillColor: Colors.white54,
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      borderSide:
                                                          BorderSide.none)),
                                              maxLines: 7,
                                              minLines: 5,
                                            ),
                                          ),
                                        ))),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      "قم رجاءًا برفع صورة حول البلاغ إذا رغبت بذلك",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextCustom(
                                          theText: "إضافة صورة توضيحية:".tr,
                                          fontSizeWidth: 17,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor:
                                              AppColors.blackColorsTypeOne),
                                      InkWell(
                                        onTap: () async {
                                          homeController.pickImage();
                                        },
                                        child: GetX<HomeController>(
                                          builder: (controller) =>
                                              ContainerCustomApi(
                                                  colorContainer: controller
                                                              .addImageWork
                                                              .value ==
                                                          true
                                                      ? Colors.green
                                                      : AppColors.redColor,
                                                  theBorderRadius: 15,
                                                  heigthContainer: 30.h,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 37.h),
                                                    child: Text(
                                                      controller.addImageWork
                                                                  .value ==
                                                              true
                                                          ? "تم إختيار صورة".tr
                                                          : "لم يتم إختيار اي صورة"
                                                              .tr,
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 45.w),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: InkWell(
                                        onTap: () {
                                          homeController.uploadImageToServer();
                                          ;
                                          homeController.BanTheProduct(
                                              "بيان حول منتج ${homeController.saveNameproductToBan}",
                                              homeController
                                                  .controllerTheOneText,
                                              homeController.imageName);
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
                                            "رفع البلاغ الان",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Text(
                                    "ملاحظة:إننا نأخذ موضوع البلاغات في محمل الجد وبإهتمام بالغ,لذلك عمليات إساءة إستخدام نظام البلاغات  او البلاغات المزيفة قد تؤدي إلى حظر حسابك..",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.redColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          controller.showTheBan.value = false;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.w),
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
                  ),
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                          visible: controller.waitBan.value,
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
                          visible: controller.isBan.value,
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
                                      "عزيزي العمــيل تم رفع الشكوى بِـنجاح ويتم مراجعة الشكوى,شُكرًا على إهتمامك وحرصك ",
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
                                        controller.isBan.value = false;
                                        controller.showTheBan.value = false;
                                        controller.addImageWork.value = false;

                                        controller.clearController();
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
                          visible: controller.isNotBan.value,
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
                                        controller.isNotBan.value = false;
                                        controller.addImageWork.value = false;
                                        controller.clearController();
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
