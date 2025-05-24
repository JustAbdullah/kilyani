import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_text.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

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
                        "قم بإضافة السؤال الثاني لعملية توثيق الحساب,واحرص على حفظ عملية التوثيق واتمامها باعلى دقة ممكنة",
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
                                controller: homeController.controllerThreeAuth,
                                onChanged: (value) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.quTwo = value.toString();
                                },
                                onSaved: (newValue) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.quTwo = newValue.toString();
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText:
                                        'اضف السؤال الثاني الخاص بك هنا'.tr,
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
                                controller: homeController.controllerFourAuth,
                                onChanged: (value) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.asTwo = value.toString();
                                },
                                onSaved: (newValue) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.asTwo = newValue.toString();
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "إجابة السؤال الثاني هنا".tr,
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
