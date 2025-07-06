import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/core/constant/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/appcolors.dart';

class ListBusinessSearch extends StatelessWidget {
  const ListBusinessSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Obx(() {
      if (homeController.isLoadingListBussSearch.value) {
        return _buildShimmerLoading();
      } else {
        return _buildBusinessGrid(homeController);
      }
    });
  }

  Widget _buildShimmerLoading() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عرض كل صف بمتجرين
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1.2, // ضبط نسبة العرض إلى الارتفاع
      ),
      itemCount: 6,
      itemBuilder: (context, i) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBusinessGrid(HomeController controller) {
    if (controller.listofBusinessSearch.value.isEmpty) {
      return Center(
        child: Text(
          'لا توجد بيانات',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // تجنب مشاكل التمرير داخل عناصر أخرى
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // صف يحتوي على متجرين فقط
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1.2, // ضبط نسبة الأبعاد
      ),
      itemCount: controller.listofBusinessSearch.value.length,
      itemBuilder: (context, i) {
        final business = controller.listofBusinessSearch.value[i];
        return _buildBusinessCard(context, business, controller);
      },
    );
  }

  Widget _buildBusinessCard(
      BuildContext context, dynamic business, HomeController controller) {
    return GestureDetector(
      onTap: () => controller.viewBusinessDetails(business),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: business.logoBuss,
                placeholder: (context, url) => Container(
                  color: AppColors.TheMain,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.TheMain,
                      strokeWidth: 2,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[100],
                  child: const Icon(Icons.business, color: Colors.grey),
                ),
              ),
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    business.nameBuss.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppTextStyles.Almarai,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.category, size: 12.sp, color: Colors.white70),
                      SizedBox(width: 4.w),
                      Flexible(
                        child: Text(
                          "تفاصيل النشاط التجاري",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: AppTextStyles.Almarai,
                            color: Colors.white70,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Favorite Button
            Positioned(
              top: 8.w,
              right: 8.w,
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 16.sp,
                  color: AppColors.TheMain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
