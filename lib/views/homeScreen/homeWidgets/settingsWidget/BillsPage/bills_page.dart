import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import '../../../../../core/constant/images_path.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheBills.value,
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
                                  controller.showTheBills.value = false;
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
                              height: 35.h,
                              decoration: BoxDecoration(
                                  color: AppColors.TheMain,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                "الفواتير",
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الفواتير الخاصة بك المتوفرة في قاعدة البيانات",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour,
                                        fontSize: 18.2.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 500.h,
                                child: SingleChildScrollView(
                                  child: Obx(() {
                                    if (controller.listOfBills.value.isEmpty) {
                                      return Center(
                                        child: Lottie.asset(ImagesPath.empty,
                                            width: 200.w),
                                      );
                                    } else {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 500.h,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .listOfBills.value.length,
                                            itemBuilder: (context, index) {
                                              final bills = controller
                                                  .listOfBills.value[index];

                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10.h),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 450.h,
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .whiteColorTypeThree,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              35),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 9,
                                                          blurRadius: 9,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ]),
                                                  child: PDF().cachedFromUrl(
                                                    bills.BillsLink,
                                                    placeholder: (progress) =>
                                                        Center(
                                                            child: Text(
                                                                '$progress %')),
                                                    errorWidget: (error) =>
                                                        Center(
                                                            child: Text(error
                                                                .toString())),
                                                  ),
                                                ),
                                              );
                                            }),
                                      );
                                    }
                                  }),
                                ))
                          ])))
                ],
              ),
            )));
  }
}
