import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:kilyani_app/controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../core/data/model/auction.dart';

class AuctionBussiness extends StatelessWidget {
  const AuctionBussiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return SizedBox(
      width: double.infinity,
      height: 220.h,
      child: FutureBuilder<List<Auction>>(
        future: controller.getDataAuctionUser(
          controller.currentBusiness.value?.business_account_id.toString() ??
              "0",
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: AppColors.TheMain));
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return Center(
              child:
                  Lottie.asset(ImagesPath.empty, width: 150.w, height: 150.h),
            );
          } else {
            return PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              controller: PageController(viewportFraction: 0.95),
              itemBuilder: (context, index) {
                Auction auction = snapshot.data![index];
                return InkWell(
                  onTap: () => controller.viewAuctionDetails(auction),
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          /// القسم الأيسر: صورة المزاد
                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: auction.auctionImage,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.TheMain.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8.h,
                                  left: 8.w,
                                  right: 8.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      auction.auctionName,
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12.w),

                          /// القسم الأيمن: تفاصيل المزاد
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// اسم المتجر وصورته
                                Row(
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: auction.logoBuss,
                                        width: 40.w,
                                        height: 40.h,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                          width: 40.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.TheMain,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            CircleAvatar(
                                          radius: 20.r,
                                          backgroundColor: Colors.grey.shade300,
                                          child: Icon(Icons.error,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Text(
                                        auction.nameBuss,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.TheMain,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),

                                /// بيانات المزاد
                                buildAuctionInfo(Icons.calendar_today,
                                    "بدء: ${auction.auctionBeginning}"),
                                buildAuctionInfo(Icons.timer,
                                    "إنتهاء: ${auction.auctionEnd}"),
                                buildAuctionInfo(Icons.attach_money,
                                    "إفتتاحية: ${auction.openingPrice} أوقية",
                                    isPrice: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget buildAuctionInfo(IconData icon, String text, {bool isPrice = false}) {
    return Row(
      children: [
        Icon(icon,
            size: 16.sp, color: isPrice ? AppColors.TheMain : Colors.grey),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              fontSize: 12.sp,
              fontWeight: isPrice ? FontWeight.bold : FontWeight.normal,
              color: isPrice ? AppColors.TheMain : Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
