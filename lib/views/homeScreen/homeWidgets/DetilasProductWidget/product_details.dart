// widgets/product_details.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/app_text_styles.dart';
import 'package:kilyani_app/core/constant/appcolors.dart';
import 'rating_section.dart';
import 'package:expandable_text/expandable_text.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BusinessInfo(controller: controller),
          SizedBox(height: 16.h),
          _ProductTitle(controller: controller),
          SizedBox(height: 8.h),
          RatingSection(),
          SizedBox(height: 16.h),
          _PriceSection(controller: controller),
          SizedBox(height: 16.h),
          _ProductDescription(controller: controller),
        ],
      ),
    );
  }
}

class _BusinessInfo extends StatelessWidget {
  final HomeController controller;

  const _BusinessInfo({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: NetworkImage(
            controller.currentProduct.value?.logoBuss ?? "",
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          controller.currentProduct.value?.nameBuss ?? "",
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ProductTitle extends StatelessWidget {
  final HomeController controller;

  const _ProductTitle({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Text(
      controller.currentProduct.value?.name ?? "",
      style: TextStyle(
        fontFamily: AppTextStyles.Almarai,
        color: AppColors.blackColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        height: 1.3,
      ),
    );
  }
}

class _PriceSection extends StatelessWidget {
  final HomeController controller;

  const _PriceSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: controller.currentProduct.value?.price.toString() ?? "",
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: AppColors.TheMain,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: " أوقية",
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: Colors.grey.shade600,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final HomeController controller;

  const _ProductDescription({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      controller.currentProduct.value?.about ?? "",
      expandText: 'عرض المزيد',
      collapseText: 'عرض أقل',
      maxLines: 3,
      linkColor: AppColors.TheMain,
      style: TextStyle(
        fontFamily: AppTextStyles.Almarai,
        color: Colors.grey.shade700,
        fontSize: 14.sp,
        height: 1.5,
      ),
    );
  }
}
