import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';

class ViewMainType extends StatefulWidget {
  const ViewMainType({super.key});

  @override
  State<ViewMainType> createState() => _ViewMainTypeState();
}

class _ViewMainTypeState extends State<ViewMainType> {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Container(
              width: MediaQuery.of(context).size.width,
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.showTheProduct.value = true;
                            controller.showTheBussines.value = false;
                            controller.showTheAuction.value = false;
                          },
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 54, 53, 53)
                                        .withOpacity(0.2), // لون الظل
                                    spreadRadius: 1, // انتشار الظل
                                    blurRadius: 1, // انعكاس الظل
                                    offset:
                                        Offset(1, 1), // انحراف الظل (الاتجاه)
                                  ),
                                ],
                                borderRadius:
                                    controller.showTheProduct.value == true
                                        ? BorderRadius.circular(20)
                                        : BorderRadius.circular(10),
                                color: controller.showTheProduct.value == true
                                    ? AppColors.TheMain
                                    : const Color.fromARGB(255, 252, 252, 252)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImagesPath.MainTypeIcon,
                                    width: 25.w,
                                    height: 25.h,
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "السوق الحره",
                                    // ignore: deprecated_member_use
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color:
                                            controller.showTheProduct.value ==
                                                    true
                                                ? AppColors.whiteColor
                                                : AppColors.balckColorTypeFour,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),

                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                            onTap: () {
                              controller.getDataAuction();
                              controller.showTheAuction.value = true;
                              controller.showTheProduct.value = false;
                              controller.showTheBussines.value = false;
                            },
                            child: Container(
                              height: 30.h,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 54, 53, 53)
                                              .withOpacity(0.2), // لون الظل
                                      spreadRadius: 1, // انتشار الظل
                                      blurRadius: 1, // انعكاس الظل
                                      offset:
                                          Offset(1, 1), // انحراف الظل (الاتجاه)
                                    ),
                                  ],
                                  borderRadius:
                                      controller.showTheAuction.value == true
                                          ? BorderRadius.circular(20)
                                          : BorderRadius.circular(10),
                                  color: controller.showTheAuction.value == true
                                      ? AppColors.TheMain
                                      : const Color.fromARGB(
                                          255, 252, 252, 252)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImagesPath.InvestmentIcon,
                                      width: 25.w,
                                      height: 25.h,
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      "المزادات",
                                      // ignore: deprecated_member_use
                                      style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: controller
                                                      .showTheAuction.value ==
                                                  true
                                              ? AppColors.whiteColor
                                              : AppColors.balckColorTypeFour,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500),

                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            controller.getDataBusiness();
                            controller.showTheBussines.value = true;
                            controller.showTheProduct.value = false;

                            controller.showTheAuction.value = false;
                          },
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 54, 53, 53)
                                        .withOpacity(0.2), // لون الظل
                                    spreadRadius: 1, // انتشار الظل
                                    blurRadius: 1, // انعكاس الظل
                                    offset:
                                        Offset(1, 1), // انحراف الظل (الاتجاه)
                                  ),
                                ],
                                borderRadius:
                                    controller.showTheBussines.value == true
                                        ? BorderRadius.circular(20)
                                        : BorderRadius.circular(10),
                                color: controller.showTheBussines.value == true
                                    ? AppColors.TheMain
                                    : const Color.fromARGB(255, 252, 252, 252)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImagesPath.BussinesManIcon,
                                    width: 25.w,
                                    height: 25.h,
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    "المتاجر",
                                    // ignore: deprecated_member_use
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color:
                                            controller.showTheBussines.value ==
                                                    true
                                                ? AppColors.whiteColor
                                                : AppColors.balckColorTypeFour,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),

                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
