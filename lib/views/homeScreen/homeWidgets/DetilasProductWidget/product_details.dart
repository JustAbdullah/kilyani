import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'rating_section.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/app_text_styles.dart';
import 'package:kilyani_app/core/constant/appcolors.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(
      () {
        // التحقق من وجود منتج محدد
        final product = controller.currentProduct.value;
        if (product == null) {
          return Center(
            child: Text(
              "يرجى اختيار منتج",
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                color: AppColors.blackColor,
                fontSize: 16.sp,
              ),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BusinessInfo(
                logo: product.logoBuss,
                nameBuss: product.nameBuss,
              ),
              SizedBox(height: 16.h),
              _ProductTitle(title: product.name),
              SizedBox(height: 8.h),
              const RatingSection(),
              SizedBox(height: 16.h),
              _PriceSection(price: product.price),
              SizedBox(height: 16.h),
              _ProductDescription(about: product.about),
            ],
          ),
        );
      },
    );
  }
}

class _BusinessInfo extends StatelessWidget {
  final String? logo;
  final String? nameBuss;

  const _BusinessInfo({
    Key? key,
    required this.logo,
    required this.nameBuss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: (logo != null && logo!.isNotEmpty)
                ? NetworkImage(logo!)
                : null,
            backgroundColor: Colors.grey.withOpacity(0.2),
          ),
          SizedBox(width: 8.w),
          Text(
            nameBuss ?? "",
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: AppColors.blackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductTitle extends StatelessWidget {
  final String? title;

  const _ProductTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
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
  final dynamic price; // يمكن أن يكون عددًا أو نصاً حسب نموذج البيانات

  const _PriceSection({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: price.toString(),
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
  final String? about;

  const _ProductDescription({
    Key? key,
    required this.about,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      about ?? "",
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
