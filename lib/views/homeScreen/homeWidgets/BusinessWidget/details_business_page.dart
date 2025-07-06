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
import 'websites_bussiness.dart';


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
        icon: Icon(Icons.arrow_back_ios_new_rounded, 
                   color: AppColors.TheMain, size: 24.sp),
        onPressed: controller.clearInDetilasBusiness,
      ),
     
    );
  }

  Widget _buildMainContent(HomeController controller, BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildStoreIdentitySection(controller),
          SizedBox(height: 32.h),
          _buildStoreDetailsSection(controller),
          SizedBox(height: 32.h),
          _buildStoreProductsSection(context),
          SizedBox(height: 32.h),
          _buildStoreAuctionsSection(), 
           SizedBox(height: 32.h),
          _buildStoreWebSitesSection(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _buildStoreIdentitySection(HomeController controller) {
    return Column(
      children: [
        // Elegant logo container with subtle shadow
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: controller.currentBusiness.value?.logoBuss ?? "",
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[100],
                child: Center(
                  child: Icon(Icons.storefront_rounded,
                      size: 40.sp, color: AppColors.grey),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[100],
                child: Center(
                  child: Icon(Icons.business_rounded,
                      size: 40.sp, color: AppColors.grey),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        
        // Store name with elegant typography
        Text(
          controller.currentBusiness.value?.nameBuss ?? "اسم المتجر",
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            fontSize: 26.sp,
            fontWeight: FontWeight.w900,
            color: AppColors.balckColorTypeFour,
            height: 1.3,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 16.h),
        
        // Rating section with clean design
        _buildRatingSection(controller),
      ],
    );
  }

  Widget _buildRatingSection(HomeController controller) {
    return GestureDetector(
      onTap: () => controller.showTheRatingBuss.value = true,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.grey.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Star rating
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.TheMain.withOpacity(0.1),
              ),
              child: Icon(Icons.star_rounded, 
                         color: AppColors.TheMain, size: 20.sp),
            ),
            SizedBox(width: 12.w),
            
            // Rating numbers
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "التقييم العام",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      controller.averageRatingBuss.value.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.balckColorTypeFour,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "/5.0",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 16.w),
            
            // View ratings button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.TheMain.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "عرض التقييمات",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.TheMain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreDetailsSection(HomeController controller) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 16,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline_rounded, 
                   size: 20.sp, color: AppColors.grey),
              SizedBox(width: 8.w),
              Text(
                "معلومات المتجر",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.balckColorTypeFour,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            controller.currentBusiness.value?.description ?? "",
            style: TextStyle(
              fontSize: 15.sp,
              height: 1.7,
              color: AppColors.balckColorTypeFour,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildStoreProductsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.shopping_bag_outlined, 
                     size: 20.sp, color: AppColors.grey),
                SizedBox(width: 8.w),
                Text(
                  "المنتجات المتاحة",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.balckColorTypeFour,
                  ),
                ),
              ],
            ),
          
          ],
        ),
        SizedBox(height: 16.h),
        const BusinessPageProductMore(),
      ],
    );
  }

  Widget _buildStoreAuctionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.gavel_outlined, 
                 size: 20.sp, color: AppColors.grey),
            SizedBox(width: 8.w),
            Text(
              "المزادات النشطة",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.balckColorTypeFour,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const AuctionBussiness(),
      ],
    );
  }
  Widget _buildStoreWebSitesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.gavel_outlined, 
                 size: 20.sp, color: AppColors.grey),
            SizedBox(width: 8.w),
            Text(
              "المواقع الإلكترونية ",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.balckColorTypeFour,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const WebsitesBussiness(),
      ],
    );
  }

  Widget _buildFloatingChatButton(HomeController controller) {
    return Positioned(
      bottom: 30.h,
      left: 20.w,
      child: FloatingActionButton(
        heroTag: 'chat-btn',
        backgroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () => controller.checkConv(
            controller.currentBusiness.value!.business_account_id as int),
        child: Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                AppColors.TheMain,
                AppColors.TheMain.withOpacity(0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Icon(
            Icons.chat_bubble_outline_rounded,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}