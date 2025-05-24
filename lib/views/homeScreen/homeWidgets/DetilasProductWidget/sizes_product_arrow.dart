import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class SizesProductArrow extends StatelessWidget {
  const SizesProductArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: InkWell(
                onTap: () {
                  controller.checkTheSizeProcut();
                  controller.update();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColorTypeTwo),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الأحجام",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 49, 49, 49),
                              fontSize: 15.2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.checkTheSizeProcut();
                              controller.update();
                            },
                            child: Image.asset(
                              controller.showTheSizeProduct.value
                                  ? ImagesPath.ArrowTop
                                  : ImagesPath.ArrowDown,
                              width: controller.showTheSizeProduct.value
                                  ? 20.w
                                  : 20.w,
                              height: controller.showTheSizeProduct.value
                                  ? 20.h
                                  : 10.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
