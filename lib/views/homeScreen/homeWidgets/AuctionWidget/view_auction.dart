import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/data/model/auction.dart';

class ViewAuction extends StatelessWidget {
  const ViewAuction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Obx(() {
      return _buildAuctionList(homeController);
    });
  }

  Widget _buildAuctionList(HomeController controller) {
    return SizedBox(
      height: 180.h, // تم تقليل الارتفاع من 220.h إلى 180.h
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        itemCount: controller.listofAuctionLast.value.isEmpty
            ? 3
            : controller.listofAuctionLast.value.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          if (controller.listofAuctionLast.value.isEmpty) {
            return _buildShimmerLoader();
          }
          final auction = controller.listofAuctionLast.value[index];
          return _buildAuctionCard(auction, controller);
        },
      ),
    );
  }

  Widget _buildAuctionCard(Auction auction, HomeController controller) {
    return GestureDetector(
      onTap: () => controller.viewAuctionDetails(auction),
      child: Container(
        width: 320.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.95),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildImageSection(auction),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAuctionHeader(auction),
                    _buildMerchantInfo(auction),
                    _buildAuctionFooter(auction, controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(Auction auction) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20.w)),
          child: CachedNetworkImage(
            imageUrl: auction.auctionImage,
            width: 130.w,
            height: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey.shade300,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.TheMain,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.shade100,
              child: Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(20.w)),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAuctionHeader(Auction auction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                auction.auctionName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTextStyles.Almarai,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8.w),
            _buildStatusIndicator(auction.auctionStatus),
          ],
        ),
        SizedBox(height: 8.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${auction.openingPrice} ',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.TheMain,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTextStyles.Almarai,
                ),
              ),
              TextSpan(
                text: 'اوقية',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade700,
                  fontFamily: AppTextStyles.Almarai,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMerchantInfo(Auction auction) {
    return Row(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 14.r,
            backgroundImage: CachedNetworkImageProvider(auction.logoBuss),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              auction.nameBuss,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                fontFamily: AppTextStyles.Almarai,
                color: Colors.black87,
              ),
            ),
            Text(
              'منظم المزاد',
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey.shade600,
                fontFamily: AppTextStyles.Almarai,
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
          borderRadius: BorderRadius.circular(20.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.TheMain..withOpacity(0.8),
                  const Color.fromARGB(255, 223, 94, 14),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  size: 14.sp,
                  color: Colors.white,
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(width: 4.w),
                Text(
                  'عرض التفاصيل',
                  style: TextStyle(
                    fontSize: 12.sp,
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
            fontSize: 12.sp,
            color: Colors.grey.shade600,
            fontFamily: AppTextStyles.Almarai,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusIndicator(int status) {
    bool isActive = status == 1;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isActive
              ? [Colors.greenAccent, Colors.green]
              : [Colors.redAccent, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Row(
        children: [
          Icon(
            isActive ? Icons.check_circle : Icons.cancel,
            size: 14.sp,
            color: Colors.white,
          ),
          SizedBox(width: 4.w),
          Text(
            isActive ? 'نشط الآن' : 'انتهى',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: AppTextStyles.Almarai,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLoader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 320.w,
        height: 180.h, // تم تقليل الارتفاع هنا أيضًا
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.w),
        ),
      ),
    );
  }
}
