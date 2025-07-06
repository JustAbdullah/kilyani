import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import '../../../../../core/constant/images_path.dart';



import '../../../../../core/data/model/bills.dart';


class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return GetX<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.showTheBills.value,
        child: Scaffold(
          body: Container(
            color: AppColors.whiteColor,
            child: Column(
              children: [
                // Header Section
                _buildAppBar(controller),

                // Content Area
                Expanded(
                  child: _buildContent(controller, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(HomeController controller) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.TheMain,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الفواتير",
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                color: AppColors.whiteColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, size: 30.sp, color: AppColors.whiteColor),
              onPressed: () => controller.showTheBills.value = false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(HomeController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          // Title and Description
          _buildHeaderInfo(),

          // Bills List
          Expanded(
            child: _buildBillsList(controller, context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Text(
          "الفواتير المتاحة",
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.TheMain,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "عرض وتحميل الفواتير من قاعدة البيانات",
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.balckColorTypeFour,
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildBillsList(HomeController controller, BuildContext context) {
    return Obx(() {
      if (controller.listOfBills.value.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                ImagesPath.empty,
                width: 250.w,
                height: 250.h,
              ),
              Text(
                "لا توجد فواتير متاحة حالياً",
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.balckColorTypeFour,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        );
      } else {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: controller.listOfBills.value.length,
          separatorBuilder: (context, index) => SizedBox(height: 15.h),
          itemBuilder: (context, index) {
            final bill = controller.listOfBills.value[index];
            return _buildBillCard(bill, context);
          },
        );
      }
    });
  }

  Widget _buildBillCard(TheBills bill, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        height: 400.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.whiteColorTypeThree,
              AppColors.whiteColor,
            ],
          ),
        ),
        child: Column(
          children: [
            // PDF Viewer
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
                child: PDF().cachedFromUrl(
                  bill.BillsLink,
                  placeholder: (progress) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: progress / 100,
                          color: AppColors.TheMain,
                          strokeWidth: 3,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "جاري التحميل... ${progress.round()}%",
                          style: TextStyle(
                            fontFamily: AppTextStyles.Almarai,
                            color: AppColors.TheMain,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  errorWidget: (error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline,
                            color: AppColors.redColor, size: 40.sp),
                        SizedBox(height: 10.h),
                        Text(
                          "حدث خطأ في التحميل",
                          style: TextStyle(
                            fontFamily: AppTextStyles.Almarai,
                            color: AppColors.redColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Bill Info Footer
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.TheMain.withOpacity(0.1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15.r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "فاتورة رقم: ${bill.BillsId}",
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.TheMain,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.picture_as_pdf,
                      color: AppColors.TheMain, size: 24.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
