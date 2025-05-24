import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class ListOFColors extends StatelessWidget {
  const ListOFColors({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      if (homeController.listofcolors.value.isEmpty) {
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
                "هذا المنتج لايحتوي على الوان",
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
            itemCount: homeController.listofcolors.value.length,
            itemBuilder: (context, index) {
              final productsColors = homeController.listofcolors.value[index];

              return InkWell(
                  onTap: () {
                    homeController.checkIfTheProductHaveColor.value = 2;
                    homeController.choesColorNumber.value =
                        int.parse(productsColors.ColorId.toString());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 45.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: Color(int.parse(productsColors.colorCode)),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        GetX<HomeController>(
                          builder: (Thecontrollers) => Text(
                            productsColors.colorName.toString(),
                            style: TextStyle(
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTextStyles.Almarai,
                              color: Thecontrollers.choesColorNumber.value ==
                                      int.parse(
                                          productsColors.ColorId.toString())
                                  ? AppColors.yellowColor
                                  : AppColors.balckColorTypeFour,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ));
            });
      }
    });
  }
}
