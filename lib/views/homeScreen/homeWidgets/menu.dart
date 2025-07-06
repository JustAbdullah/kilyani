import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';

import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Container(
        // خلفية القائمة مع ظل خفيف
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMenuItem(
              label: "الرئيسية",
              iconPathActive: ImagesPath.homeIconOrange,
              iconPathInactive: ImagesPath.homeIconBlack,
              isActive: controller.homeView.value,
              onTap: () {
                controller.showSearching.value = false;
                controller.showDetialsOrder.value = false;
                controller.theSettings.value = false;
                controller.showTheBasket.value = false;
                controller.showTheOrder.value = false;
                controller.homeView.value = true;
              },
            ),
            _buildMenuItem(
              label: "البحث",
              iconPathActive: ImagesPath.SearchIconOrange,
              iconPathInactive: ImagesPath.SearchIconBlack,
              isActive: controller.showSearching.value,
              onTap: () {
                controller.showSearching.value = true;
                controller.showDetialsOrder.value = false;
                controller.theSettings.value = false;
                controller.showTheBasket.value = false;
                controller.showTheOrder.value = false;
                controller.homeView.value = false;
              },
            ),
            _buildMenuItem(
              label: "السلة",
              iconPathActive: ImagesPath.CartShopIconOrange,
              iconPathInactive: ImagesPath.CartShopIconBlack,
              isActive: controller.showTheBasket.value,
              onTap: () {
                if (controller.isNotHaveAccount.value) {
                  controller.showMessageNotHaveAccount.value = true;
                } else {
                  controller.showSearching.value = false;
                  controller.theSettings.value = false;
                  controller.showDetialsOrder.value = false;
                  controller.homeView.value = false;
                  controller.showTheOrder.value = false;
                  controller.isTheBasketReadyEmpty.value = false;
                  controller.getDataBasket(controller.specilcode);
                  controller.showTheBasket.value = true;
                }
              },
            ),
            _buildMenuItem(
              label: "الطلبيات",
              iconPathActive: ImagesPath.OrderBoxIconOrange,
              iconPathInactive: ImagesPath.OrderBoxIconBlack,
              isActive: controller.showTheOrder.value,
              onTap: () {
                if (controller.isNotHaveAccount.value) {
                  controller.showMessageNotHaveAccount.value = true;
                } else {
                  controller.showSearching.value = false;
                  controller.getDataOrders();
                  controller.showTheOrder.value = true;
                  controller.theSettings.value = false;
                  controller.homeView.value = false;
                  controller.showTheBasket.value = false;
                }
              },
            ),
            _buildMenuItem(
              label: "الإعدادت",
              iconPathActive: ImagesPath.SettingIconOrange,
              iconPathInactive: ImagesPath.SettingIconBlack,
              isActive: controller.theSettings.value,
              onTap: () {
                if (controller.isNotHaveAccount.value) {
                  controller.showMessageNotHaveAccount.value = true;
                } else {
                  controller.showSearching.value = false;
                  controller.theSettings.value = true;
                  controller.homeView.value = false;
                  controller.showDetialsOrder.value = false;
                  controller.showTheBasket.value = false;
                  controller.showTheOrder.value = false;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  /// دالة خاصة لبناء عنصر من عناصر القائمة
  Widget _buildMenuItem({
    required String label,
    required String iconPathActive,
    required String iconPathInactive,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                isActive ? iconPathActive : iconPathInactive,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: isActive
                      ? AppColors.TheMain
                      : AppColors.balckColorTypeFour,
                  fontSize: 12.sp,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              // مؤشر بسيط يظهر تحت العنصر النشط
              if (isActive)
                Container(
                  width: 20.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppColors.TheMain,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                )
              else
                SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
