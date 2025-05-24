import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../ChatWidget/chat_window_user.dart';
import 'auction_bussiness.dart';
import 'more_business_product_page.dart';
import 'rating_list_buss.dart';

class DetailsBusinessPage extends StatelessWidget {
  const DetailsBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: controller.showDetialsBusiness.value
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  backgroundColor: AppColors.whiteColor,
                  appBar: _buildAppBar(controller),
                  body: Stack(
                    children: [
                      _buildMainContent(controller, context),
                      const RatingListBuss(),
                      const ChatWindowUser(),
                      _buildFloatingChatButton(controller),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(HomeController controller) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "ملف المتجر",
        style: TextStyle(
          fontFamily: AppTextStyles.Almarai,
          fontSize: 20.sp,
          fontWeight: FontWeight.w800,
          color: AppColors.TheMain,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded,
            color: AppColors.TheMain, size: 26.sp),
        onPressed: controller.clearInDetilasBusiness,
      ),
    );
  }

  Widget _buildMainContent(HomeController controller, BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildStoreIdentitySection(controller),
          SizedBox(height: 30.h),
          _buildStoreDetailsSection(controller),
          _buildDivider(),
          _buildStoreProductsSection(context),
          _buildDivider(),
          _buildStoreAuctionsSection(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _buildStoreIdentitySection(HomeController controller) {
    return Column(
      children: [
        // الشعار مع تأثير ثلاثي الأبعاد
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.TheMain.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: controller.currentBusiness.value?.logoBuss ?? "",
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: AppColors.TheMain,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.TheMain,
                    strokeWidth: 2,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[200],
                child: Icon(Icons.storefront_rounded,
                    color: AppColors.balckColorTypeFour, size: 40.sp),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),

        // اسم المتجر مع تأثير الكتابة
        Hero(
          tag:
              'store-name-${controller.currentBusiness.value?.business_account_id}',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              controller.currentBusiness.value?.nameBuss ?? "اسم المتجر",
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                fontSize: 26.sp,
                fontWeight: FontWeight.w900,
                color: AppColors.TheMain,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(height: 15.h),

        // التقييم مع النجوم التفاعلية
        _buildRatingSection(controller),
      ],
    );
  }

  Widget _buildRatingSection(HomeController controller) {
    return GestureDetector(
      onTap: () => controller.showTheRatingBuss.value = true,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.TheMain),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star_rounded, color: AppColors.yellowColor, size: 24.sp),
            SizedBox(width: 8.w),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: controller.averageRatingBuss.value.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.balckColorTypeFour,
                    ),
                  ),
                  TextSpan(
                    text: "/5.0",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.balckColorTypeFour,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "عرض التقييمات",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.balckColorTypeFour,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreDetailsSection(HomeController controller) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 10.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "معلومات المتجر",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.balckColorTypeFour,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            controller.currentBusiness.value?.description ?? "",
            style: TextStyle(
              fontSize: 15.sp,
              height: 1.6,
              color: AppColors.TheMain,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.h),
      height: 1.h,
      color: AppColors.balckColorTypeFour,
    );
  }

  Widget _buildStoreProductsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "المنتجات المتاحة",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.balckColorTypeFour,
          ),
        ),
        SizedBox(height: 15.h),
        const BusinessPageProductMore(),
      ],
    );
  }

  Widget _buildStoreAuctionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "المزادات النشطة",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.balckColorTypeFour,
          ),
        ),
        SizedBox(height: 15.h),
        const AuctionBussiness(),
      ],
    );
  }

  Widget _buildFloatingChatButton(HomeController controller) {
    return Positioned(
      bottom: 30.h,
      left: 20.w,
      child: FloatingActionButton(
        heroTag: 'chat-btn',
        backgroundColor: AppColors.balckColorTypeFour,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () => controller.checkConv(
            controller.currentBusiness.value!.business_account_id as int),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.balckColorTypeFour,
                AppColors.balckColorTypeFour.withOpacity(0.8),
              ],
            ),
          ),
          child: Icon(
            Icons.chat_bubble_outline_rounded,
            color: Colors.white,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}
