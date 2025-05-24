import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(
          builder: (controller) => Visibility(
              visible: controller.terms.value,
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: AppColors.whiteColor,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.terms.value = false;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, top: 5.h),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 40.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.TheMain,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  height: 25.h,
                                ),
                                Text(
                                  "الشروط والإحكام والقوانين",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.TheMain,
                                    fontSize: 19.2.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  controller.accountCreationRulesTitle
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                    fontSize: 17.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.accountCreationRules.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 98, 98, 98),
                                    fontSize: 14.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.h,
                                ),
                                Text(
                                  controller.geolocationRulestitle.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                    fontSize: 17.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.geolocationRules.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 98, 98, 98),
                                    fontSize: 14.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.h,
                                ),
                                Text(
                                  controller.productAuctionReviewRulesTitle
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                    fontSize: 17.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.productAuctionReviewRules
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 98, 98, 98),
                                    fontSize: 14.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.h,
                                ),
                                Text(
                                  controller.electronicWalletRulesTitle
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                    fontSize: 17.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.electronicWalletRules.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 98, 98, 98),
                                    fontSize: 14.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.h,
                                ),
                                Text(
                                  controller.reportSystemRulesUsersTitle
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                    fontSize: 17.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.reportSystemRulesUsers.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 98, 98, 98),
                                    fontSize: 14.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.h,
                                ),
                                Text(
                                  controller.marketingSystemRulestitle
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                    fontSize: 17.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.marketingSystemRules.toString(),
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 98, 98, 98),
                                    fontSize: 14.2.sp,
                                    height: 1.1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 75.h,
                                ),
                              ]),
                        ),
                      ))))),
    );
  }
}
