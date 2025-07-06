import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_text.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

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
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        homeController.showTheAuthCreaet.value = false;
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
                    height: 10.h,
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
                        "رجاءًا قم بملاء البيانات التالية بشكل دقيق واحرص على حفظ البيانات بشكل صحيح",
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
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Material(
                              elevation: 4,
                              shadowColor: AppColors.TheMain,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: homeController.controllerOneAuth,
                                onChanged: (value) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.quOne = value.toString();
                                },
                                onSaved: (newValue) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.quOne = newValue.toString();
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText:
                                        'اضف السؤال الاول الخاص بك هنا'.tr,
                                    // important line
                                    // control your hints text size
                                    hintStyle: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        letterSpacing: 0.8,
                                        color: AppColors.balckColorTypeFour
                                            .withOpacity(0.5),
                                        fontWeight: FontWeight.bold),
                                    fillColor: Colors.white54,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none)),
                                maxLines: 7,
                                minLines: 5,
                              ),
                            ),
                          ))),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Material(
                              elevation: 4,
                              shadowColor: AppColors.TheMain,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: homeController.controllerTwoAuth,
                                onChanged: (value) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.asOne = value.toString();
                                },
                                onSaved: (newValue) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.asOne = newValue.toString();
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "إجابة السؤال الاول هنا".tr,
                                    // important line
                                    // control your hints text size
                                    hintStyle: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        letterSpacing: 0.8,
                                        color: AppColors.balckColorTypeFour
                                            .withOpacity(0.5),
                                        fontWeight: FontWeight.bold),
                                    fillColor: Colors.white54,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none)),
                                maxLines: 3,
                                minLines: 3,
                              ),
                            ),
                          )))
                ])));
  }
}
