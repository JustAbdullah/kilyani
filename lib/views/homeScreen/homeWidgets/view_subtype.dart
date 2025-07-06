import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_text.dart';

class ViewSubType extends StatelessWidget {
  const ViewSubType({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    // عنصر "الكل" مع تصميم محسّن (إطار دائري وظل خفيف)
    Widget buildAllWidget() {
      return GetX<HomeController>(
        builder: (controller) => InkWell(
          onTap: () => controller.typeIdProduct.value = 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30.w,
                height: 30.h,
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset(
                  ImagesPath.all,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 7.h),
              TextCustom(
                theText: "الكل",
                fontSizeWidth: 12.sp,
                fontWeight: controller.typeIdProduct.value == 0
                    ? FontWeight.bold
                    : FontWeight.w500,
                fontFamily: AppTextStyles.Almarai,
                fontColor: controller.typeIdProduct.value == 0
                    ? AppColors.yellowColor
                    : AppColors.balckColorTypeFour,
              ),
            ],
          ),
        ),
      );
    }

    // عنصر الشيفرة (Shimmer) أثناء تحميل البيانات
    Widget buildShimmerItem() {
      return Shimmer.fromColors(
        baseColor: const Color.fromARGB(31, 83, 82, 82),
        highlightColor: AppColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.TheMain,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              width: 60.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      );
    }

    // عنصر النوع مع الصورة والنص
    Widget buildTypeItem(dynamic mainType) {
      return GetX<HomeController>(
        builder: (controller) => InkWell(
          onTap: () => controller.typeIdProduct.value = mainType.idType as int,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30.w,
                height: 30.h,
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: mainType.img.toString(),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.TheMain,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: TextCustom(
                        theText: "كليانى",
                        fontSizeWidth: 10.sp,
                        fontFamily: AppTextStyles.Marhey,
                        fontColor: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(height: 7.h),
              TextCustom(
                theText: mainType.name.toString(),
                fontSizeWidth: 12.sp,
                fontWeight: controller.typeIdProduct.value == mainType.idType
                    ? FontWeight.bold
                    : FontWeight.w500,
                fontFamily: AppTextStyles.Almarai,
                fontColor: controller.typeIdProduct.value == mainType.idType
                    ? AppColors.yellowColor
                    : AppColors.balckColorTypeFour,
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // عرض العناصر في قائمة أفقية
          Obx(() {
            List<Widget> items = [];
            items.add(buildAllWidget());
            if (homeController.listofMainType.value.isEmpty) {
              items.addAll(List.generate(5, (index) => buildShimmerItem()));
            } else {
              items.addAll(homeController.listofMainType.value
                  .map(buildTypeItem)
                  .toList());
            }
            return SizedBox(
              height: 80.h, // ارتفاع العنصر حسب التصميم
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemBuilder: (context, index) => items[index],
              ),
            );
          }),
          SizedBox(height: 7.h),
          // مؤشر بسيط مع ظل وحواف مستديرة
          Center(
            child: Container(
              width: 40.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.TheMain,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
