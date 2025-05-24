import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/data/model/auction.dart';

class ListOfAuctionSearching extends StatelessWidget {
  const ListOfAuctionSearching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Obx(() {
      if (homeController.isLoadingListAuctionSearch.value) {
        return _buildShimmerLoading();
      } else if (homeController.listofAuctionLast.value.isEmpty) {
        return Center(
          child: Text(
            'لا توجد بيانات',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
        );
      } else {
        return _buildAuctionList(homeController);
      }
    });
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 200.h, // يمكنك تعديل الارتفاع حسب التصميم
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16.w),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAuctionList(HomeController controller) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      itemCount: controller.listofAuctionLast.value.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final auction = controller.listofAuctionLast.value[index];
        return _buildAuctionCard(auction, controller);
      },
    );
  }

  Widget _buildAuctionCard(Auction auction, HomeController controller) {
    return GestureDetector(
      onTap: () => controller.viewAuctionDetails(auction),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(auction),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAuctionHeader(auction),
                  SizedBox(height: 8.h),
                  _buildMerchantInfo(auction),
                  SizedBox(height: 8.h),
                  _buildAuctionExtraInfo(auction),
                  SizedBox(height: 8.h),
                  _buildAuctionFooter(auction, controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(Auction auction) {
    final imageUrl =
        auction.auctionImage.isNotEmpty ? auction.auctionImage : "";
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 500),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 40.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            if (auction.auctionStatus == 1)
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Text(
                    'مباشر',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontFamily: AppTextStyles.Almarai,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuctionHeader(Auction auction) {
    return Text(
      auction.auctionName,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppTextStyles.Almarai,
        color: Colors.black87,
        shadows: [
          Shadow(
            color: Colors.grey.shade300,
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMerchantInfo(Auction auction) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: auction.logoBuss.isNotEmpty
              ? CachedNetworkImageProvider(auction.logoBuss)
              : null,
          backgroundColor: Colors.grey.shade300,
          child: auction.logoBuss.isEmpty
              ? Icon(Icons.store, size: 18.sp, color: Colors.grey.shade700)
              : null,
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              auction.nameBuss,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: AppTextStyles.Almarai,
                color: Colors.black87,
              ),
            ),
            Text(
              'منظم المزاد',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade600,
                fontFamily: AppTextStyles.Almarai,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAuctionExtraInfo(Auction auction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.monetization_on,
              size: 14.sp,
              color: AppColors.TheMain,
            ),
            SizedBox(width: 4.w),
            Text(
              'السعر الافتتاحي:',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppTextStyles.Almarai,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '${auction.openingPrice.toStringAsFixed(2)} اوقية',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppTextStyles.Almarai,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Icon(
              Icons.access_time,
              size: 14.sp,
              color: AppColors.TheMain,
            ),
            SizedBox(width: 4.w),
            Text(
              'بدء: ${auction.auctionBeginning}',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppTextStyles.Almarai,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              'انتهاء: ${auction.auctionEnd}',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppTextStyles.Almarai,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAuctionFooter(Auction auction, HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => controller.viewAuctionDetails(auction),
          borderRadius: BorderRadius.circular(12.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.TheMain,
                  AppColors.TheMain.withOpacity(0.85)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Row(
              children: [
                Icon(Icons.arrow_forward, size: 16.sp, color: Colors.white),
                SizedBox(width: 8.w),
                Text(
                  'عرض التفاصيل',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontFamily: AppTextStyles.Almarai,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          auction.auctionDay,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
            fontFamily: AppTextStyles.Almarai,
          ),
        ),
      ],
    );
  }
}
