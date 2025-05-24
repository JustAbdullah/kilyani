import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/app_text_styles.dart';
import 'package:kilyani_app/core/constant/appcolors.dart';
import 'package:kilyani_app/core/constant/images_path.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        bottom: 20.h,
        left: 20.w,
        right: 20.w,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200.withOpacity(0.3),
                  blurRadius: 15.r,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildTotalPrice(controller),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuantityControls(controller),
                    SizedBox(
                      width: 15.w,
                    ),
                    _buildAddToCartButton(controller),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalPrice(HomeController controller) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'الإجمالي: ',
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: Colors.grey.shade700,
              fontSize: 14.sp,
            ),
          ),
          TextSpan(
            text: '${controller.totalPriceProcut.value}',
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: AppColors.TheMain,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          TextSpan(
            text: ' أوقية',
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: Colors.grey.shade500,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControls(HomeController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _buildControlButton(
            icon: ImagesPath.minus,
            onTap: controller.minusThePrice,
            isActive: controller.countTheQu.value > 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              controller.countTheQu.toString(),
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.blackColor,
              ),
            ),
          ),
          _buildControlButton(
            icon: ImagesPath.plus,
            onTap: controller.plusThePrice,
            isActive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required String icon,
    required Function() onTap,
    required bool isActive,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: isActive ? onTap : null,
        child: Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.TheMain : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Image.asset(
              icon,
              width: 18.w,
              height: 18.h,
              color: isActive ? AppColors.whiteColor : Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddToCartButton(HomeController controller) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.TheMain,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: () => controller.addIntoBasket(
            controller.currentProduct.value?.id,
            controller.currentProduct.value?.product_business_account,
            controller.choesSizeNumber.value,
            controller.choesColorNumber.value,
            controller.countTheQu.value,
            controller.totalPriceProcut.value,
            controller.currentProduct.value?.product_business_account,
          ),
          child: Container(
            height: 38.h,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesPath.Addbasket,
                  width: 14.w,
                  height: 14.h,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 8.w),
                Text(
                  'أضف إلى السلة',
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
