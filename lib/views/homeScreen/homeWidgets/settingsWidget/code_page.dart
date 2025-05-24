import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.codeShow.value,
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
                                  controller.codeShow.value = false;
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
                                "نظام التسويق",
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
                                  "يمكنك إستخدام كود التسويق الخاص بك للترويج عن المنصة ومزاياها",
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
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text(
                                  "عند إتمام الطلبية بإستخدام الكود التسويق الخاص بك ستحصل على مزايا ومبالغ قيمة بغض النظر عن المتجر الذي يتم الشراء منه",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour,
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Text(
                                  "ستحصل على كل شخص يستخدم كود تسويقك عند إتمام الطلب على نسبة 3% من إجمالي مبلغ الطلبية",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour,
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: 150.h,
                              width: MediaQuery.of(context).size.width,
                              child: Lottie.asset(ImagesPath.newsTwo),
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
                                      "كود التسويق الخاص بـك هو:",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour,
                                        fontSize: 18.2.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      controller.users!.value.code.toString(),
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
                                  "ننصحك بقراءة الشروط والاحكام للمنصة لمزيد من المعلومات والإستخدام الأمثل لِكود التسويق",
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
                                controller.terms.value = true;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 200.h,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color: AppColors.yellowColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "قراءة الشروط والاحكام",
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
