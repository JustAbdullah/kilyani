// widgets/rating_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // الحصول على الـ HomeController الذي يحتوي على averageRating و showTheRatingProduct
    final homeController = Get.find<HomeController>();

    return Obx(() {
      // قيمة المتوسط متغيرة RxDouble سيتم تتبعها وإعادة بناء الواجهة تلقائيًا
      final rating = homeController.averageRating.value;
      return InkWell(
        onTap: () {
          // عند الضغط، يتم تفعيل عرض التقييمات والمراجعات
          homeController.showTheRatingProduct.value = true;
        },
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // الصف الخاص بالتقييم والنجوم
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildRatingStars(rating),
                  SizedBox(width: 8.w),
                  Text(
                    '${rating.toStringAsFixed(1)}/5.0',
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              // الصف الخاص بزر "مشاهدة التقييمات والمراجعات"
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "مشاهدة التقييمات والمراجعات",
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.TheMain,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.reviews,
                    size: 18.w,
                    color: AppColors.TheMain,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: AppColors.TheMain,
          size: 20.w,
        );
      }),
    );
  }
}
