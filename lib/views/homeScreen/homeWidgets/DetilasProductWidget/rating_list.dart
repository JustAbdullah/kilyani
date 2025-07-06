import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/app_text_styles.dart';
import 'package:kilyani_app/core/constant/appcolors.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/data/model/rating.dart';
import 'rating_dialog.dart'; // تأكد من استيراد RatingDialog

class RatingList extends StatelessWidget {
  const RatingList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Visibility(
          visible: controller.showTheRatingProduct.value,
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Stack(
              children: [
                // الواجهة الرئيسية
                Column(
                  children: [
                    _buildAppBar(controller),
                    Expanded(
                      child: _buildRatingContent(controller),
                    ),
                    _buildAddRatingButton(controller),
                  ],
                ),

                // إضافة RatingDialog هنا
                if (controller.addRatintProduct.value) const RatingDialog(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(HomeController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100.withOpacity(0.3),
            blurRadius: 10.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: 28.w),
            color: AppColors.blackColor,
            onPressed: () => controller.showTheRatingProduct.value = false,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.currentProduct.value?.name ?? "",
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "تقييمات ومراجعات المنتج",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingContent(HomeController controller) {
    return FutureBuilder<List<Rating>>(
      future: controller.getRating(controller.currentProduct.value!.id as int),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingIndicator();
        }
        if (snapshot.hasError || snapshot.data == null) {
          return _buildEmptyState();
        }
        return _buildRatingsList(snapshot.data!);
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.TheMain,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.yellowColor),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          ImagesPath.empty,
          width: 200.w,
          height: 200.h,
          fit: BoxFit.contain,
        ),
        Text(
          "لا توجد تقييمات حتى الآن\nكن أول من يقيّم هذا المنتج",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingsList(List<Rating> ratings) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      physics: const BouncingScrollPhysics(),
      itemCount: ratings.length,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      itemBuilder: (context, index) => _buildRatingItem(ratings[index]),
    );
  }

  Widget _buildRatingItem(Rating rating) {
    return Material(
      borderRadius: BorderRadius.circular(16.r),
      elevation: 4,
      color: AppColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey.shade100,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rating.user_name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor,
                        ),
                      ),
                      _buildRatingStars(rating.rating),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              rating.text_rating,
              style: TextStyle(
                  fontSize: 13.sp, height: 1.5, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: AppColors.yellowColor,
          size: 18.w,
        );
      }),
    );
  }

  Widget _buildAddRatingButton(HomeController controller) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: FloatingActionButton.extended(
          elevation: 4,
          backgroundColor: AppColors.TheMain,
          icon: Icon(Icons.edit, color: AppColors.whiteColor),
          label: Text(
            "أضف تقييمك",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
            ),
          ),
          onPressed: () {
            controller.addRatintProduct.value = true;
          }),
    );
  }
}
