import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class ListOFSizes extends StatelessWidget {
  const ListOFSizes({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      if (homeController.listofSize.value.isEmpty) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 175.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColorTypeTwo,
                borderRadius: BorderRadius.circular(17)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                "هذا المنتج لايحتوي على احجام",
                style: TextStyle(
                  fontSize: 12.2.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.redColor,
                ),
              ),
            ),
          ),
        );
      } else {
        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homeController.listofSize.value.length,
            itemBuilder: (context, index) {
              final productsSize = homeController.listofSize.value[index];

              return InkWell(
                  onTap: () {
                    homeController.checkIfTheProductHaveSize.value = 2;
                    homeController.choesSizeNumber.value =
                        int.parse(productsSize.SizeId.toString());
                  },
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: GetX<HomeController>(
                        builder: (Thecontroller) => Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: Thecontroller.choesSizeNumber.value ==
                                      int.parse(productsSize.SizeId.toString())
                                  ? AppColors.yellowColor
                                  : AppColors.whiteColorTypeTwo,
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              productsSize.sizeName.toString(),
                              style: TextStyle(
                                fontSize: 14.2.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )));
            });
      }
    });
  }
}
