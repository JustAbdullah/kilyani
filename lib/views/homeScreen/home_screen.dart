import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/views/SearchScreen/search_page.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/AuctionWidget/auction_details.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/AuthWidgets/auth_page.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/AuthWidgets/create_auth.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/BanWidgets/ban_model.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/BasketWidget/basket_screen.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/BusinessWidget/details_business_page.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/news_screen.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/settingsWidget/info_account.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/settingsWidget/settings.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/view_new_product.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/view_subtype.dart';
import 'package:kilyani_app/views/homeScreen/top_rated_product.dart';
import 'package:kilyani_app/views/messages/message_status.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_text.dart';
import '../messages/message_no_account.dart';
import 'homeWidgets/AuctionWidget/view_auction.dart';
import 'homeWidgets/settingsWidget/BillsPage/bills_page.dart';
import 'homeWidgets/settingsWidget/Walletcharging.dart';
import 'homeWidgets/settingsWidget/convPage/chat_conv.dart';
import 'homeWidgets/settingsWidget/convPage/conv_list.dart';
import 'homeWidgets/OrdersWidget/basket_order.dart';
import 'homeWidgets/BusinessWidget/list_busines.dart';
import 'homeWidgets/DetilasProductWidget/detilas_product.dart';
import 'homeWidgets/OrdersWidget/order_screen.dart';
import 'homeWidgets/OrdersWidget/order_screen_background.dart';
import 'homeWidgets/menu.dart';
import 'homeWidgets/pakcgetBusiness/view_packaget.dart';
import 'homeWidgets/settingsWidget/code_page.dart';
import 'homeWidgets/settingsWidget/location_map.dart';
import 'homeWidgets/settingsWidget/location_show.dart';
import 'homeWidgets/settingsWidget/messages_list.dart';
import 'homeWidgets/settingsWidget/order_page.dart';
import 'homeWidgets/settingsWidget/stores_terms.dart';
import 'homeWidgets/settingsWidget/terms.dart';
import 'homeWidgets/settingsWidget/walllet_page.dart';
import 'homeWidgets/top_hdear_home_screen.dart';
import 'homeWidgets/view_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // يُستخدم SafeArea لضمان عدم تغطية المحتوى من قِبل النوافذ (مثل النوتش)
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    TopHeaderHomeScreen(),
                    SizedBox(height: 10.h),

                    // قسم التصنيفات
                    TextCustom(
                      theText: "تصنيفات المنتجات",
                      fontSizeWidth: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.balckColorTypeFour,
                    ),
                    SizedBox(height: 10.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 0.h),
                        child: ViewSubType(),
                      ),
                    ),
                    SizedBox(height: 0.h),

                    // قسم الأخبار
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: NewsScreen(),
                    ),
                    SizedBox(height: 5.h),

                    // المنتجات حسب التصنيف
                    _buildSectionHeader(
                      icon: Icons.category_rounded,
                      title: "المـنتجات حسب التصنيف",
                    ),
                    SizedBox(height: 0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: ViewProducts(),
                    ),
                    SizedBox(height: 5.h),

                    // المنتجات الرائجة
                    _buildSectionHeader(
                      icon: Icons.trending_up,
                      title: "المنتجات الرائجة",
                    ),
                    SizedBox(height: 0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: TopRatedProduct(),
                    ),
                    SizedBox(height: 0.h),

                    // أحدث المتاجر
                    _buildSectionHeader(
                      icon: Icons.store,
                      title: "أحــدث المــتاجـر",
                    ),
                    SizedBox(height: 0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: BusinessList(),
                    ),
                    SizedBox(height: 0.h),

                    // أحدث المنتجات
                    _buildSectionHeader(
                      icon: Icons.new_releases,
                      title: "أحدث المــنتجات",
                    ),
                    SizedBox(height: 0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        height: 170.h,
                        child: ViewNewProduct(),
                      ),
                    ),
                    SizedBox(height: 0.h),

                    // المزادات
                    _buildSectionHeader(
                      icon: Icons.gavel,
                      title: "أحــدث المزادات",
                    ),
                    SizedBox(height: 0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: ViewAuction(),
                    ),
                    SizedBox(
                        height: 80.h), // مساحة لإظهار الـ Bottom Navigation
                  ],
                ),
              ),
            ),
            Settings(),
            SearchPage(), BasketTheScreen(),
            // الـ Bottom Navigation
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 20,
                      offset: Offset(0, -2.h),
                    ),
                  ],
                ),
                child: Menu(),
              ),
            ),

            // Overlays والإضافات (يُترك كما هو دون تعديل لضمان عدم تغيير الهيكل)
            OrderScreenBackGrouund(),
            OrderPage(),
            OrderTheScreen(),
            BasketOrder(),

            InfoAccount(),
            MessagesList(),
            CodePage(),
            WalltePage(),
            authPage(),
            BillsPage(),
            LocationShow(),
            ShowTheLocationInMap(),
            Terms(),
            StoresTerms(),
            ViewPackaget(),
            WalletCharging(),
            DetailsBusinessPage(),
            DetilasProduct(),
            DetailsAuctionPage(),
            ConvList(),
            MessageNoAccount(),
            BanModel(),
            CreateAuth(),
            MessageStatus(),
            ChatConv(),
          ],
        ),
      ),
    );
  }
}

/// دالة لبناء عنوان القسم مع أيقونة بشكل أنيق
Widget _buildSectionHeader({required IconData icon, required String title}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.balckColorTypeFour.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 24.sp,
            color: AppColors.balckColorTypeFour,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.bold,
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.balckColorTypeFour,
          ),
        ),
      ],
    ),
  );
}
