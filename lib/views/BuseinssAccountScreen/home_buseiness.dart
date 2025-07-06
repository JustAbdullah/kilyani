import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';

class HomeBuseiness extends StatelessWidget {
  const HomeBuseiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                      "الواجهه الرئيسية",
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
                    height: 10.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Text(
                        "مرحبًا بك انت في واجهه المتجر الرسمي",
                        style: TextStyle(
                          fontFamily: AppTextStyles.Almarai,
                          color: const Color.fromARGB(255, 30, 30, 30),
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
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Text(
                        "التحكم الكامل لك كمتجر يتم من خلال صفحة الويب الخاصة بك كلوحة تحكم",
                        style: TextStyle(
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.balckColorTypeFour,
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
