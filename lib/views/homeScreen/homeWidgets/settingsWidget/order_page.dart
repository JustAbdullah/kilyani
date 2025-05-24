import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Visibility(
          visible: controller.showTheOrder.value,
          child: Scaffold(
            backgroundColor: Colors.black54,
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    width: double.infinity,
                    decoration: _buildBoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header Section
                        _buildHeader(context),

                        // Orders List
                        Expanded(
                          child: Obx(() {
                            if (controller.listofOrder.value.isEmpty) {
                              return _buildEmptyState();
                            }
                            return _buildOrdersList(controller);
                          }),
                        ),

                        // Close Button
                        _buildCloseButton(controller),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppColors.whiteColor, Color(0xFFF5F5F7)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 15,
          spreadRadius: 2,
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.TheMain, AppColors.TheMain.withOpacity(0.8)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket_rounded, color: Colors.white, size: 24.sp),
          SizedBox(width: 10.w),
          Text(
            "طلبياتي",
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(ImagesPath.empty,
            width: 250.w, height: 250.h, repeat: false),
        Text(
          "لا توجد طلبيات حالية",
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.TheMain,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "يمكنك البدء بإنشاء طلبية جديدة من خلال الزر أدناه",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTextStyles.Almarai,
            color: Colors.grey[600],
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersList(HomeController controller) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      itemCount: controller.listofOrder.value.length,
      separatorBuilder: (_, i) => Divider(
        color: Colors.grey[300],
        height: 20.h,
        indent: 20.w,
        endIndent: 20.w,
      ),
      itemBuilder: (context, index) {
        final order = controller.listofOrder.value[index];
        return _buildOrderCard(order, context, controller);
      },
    );
  }

  Widget _buildOrderCard(
      dynamic order, BuildContext context, HomeController controller) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.TheMain.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: InkWell(
        onTap: () => controller.viewOrderDetails(order),
        borderRadius: BorderRadius.circular(15.r),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Number & Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem(
                    icon: Icons.confirmation_number_outlined,
                    label: "رقم الطلب",
                    value: "#${order.order_number}",
                  ),
                  _buildInfoItem(
                    icon: Icons.date_range_outlined,
                    label: "التاريخ",
                    value: order.order_date,
                    isDate: true,
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // Order Total
              _buildInfoItem(
                icon: Icons.monetization_on_outlined,
                label: "الإجمالي",
                value: "${order.total} أوقية",
                isTotal: true,
              ),

              SizedBox(height: 15.h),

              // Details Button
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.TheMain,
                        AppColors.TheMain.withOpacity(0.7)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "عرض التفاصيل",
                        style: TextStyle(
                          fontFamily: AppTextStyles.Almarai,
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 14.sp),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    bool isDate = false,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            color: isTotal ? AppColors.TheMain : Colors.grey[600], size: 18.sp),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                color: Colors.grey[600],
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              value,
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                color: isTotal ? AppColors.TheMain : Colors.black,
                fontSize: isDate ? 12.sp : 14.sp,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCloseButton(HomeController controller) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: InkWell(
        onTap: () => controller.showTheOrder.value = false,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            "إغلاق",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: Colors.grey[700],
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
