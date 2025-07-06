import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../homeScreen/homeWidgets/search_box.dart';
import '../homeScreen/homeWidgets/view_maintype.dart';
import '../homeScreen/homeWidgets/view_subtype.dart';
import 'list_business_search.dart';
import 'list_of_auction_searching.dart';
import 'list_product_searching.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: controller.showSearching.value
            ? Scaffold(
                backgroundColor: AppColors.whiteColor,
                body: SafeArea(
                  child: Column(
                    children: [
                      _buildHeaderTitle(),
                      SizedBox(height: 12.h),
                      _buildAnimatedCategorySection(controller),
                      SizedBox(height: 12.h),
                      SearchBox(),
                      Expanded(
                        child: KeyboardDismissOnScroll(
                          child: CustomScrollView(
                            slivers: [
                              _buildHeaderText(),
                              _buildSearchContent(controller),
                              SliverToBoxAdapter(
                                child: SizedBox(height: 32.h),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  /// عنوان الصفحة مع أيقونة بحث جميلة
  Widget _buildHeaderTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 8.w),
        Text(
          'مرحبًا! ابحث عن كل ما تريده هنا',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Almarai',
            color: AppColors.TheMain,
          ),
        ),
      ],
    );
  }

  /// عرض التصنيفات الرئيسية والفرعية
  Widget _buildAnimatedCategorySection(HomeController controller) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: [
          ViewMainType(),
          if (controller.showTheProduct.value)
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12.r),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: ViewSubType(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// عنوان توضيحي أعلى القائمة
  Widget _buildHeaderText() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'نتائج البحث',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarai',
                color: AppColors.TheMain,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            Text(
              'اكتب اسم المنتج، المتجر أو المزاد الذي تبحث عنه',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// عرض نتائج البحث بناءً على الفئة المختارة
  Widget _buildSearchContent(HomeController controller) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _getActiveList(controller),
        ),
      ),
    );
  }

  /// تحديد القائمة النشطة (متاجر، منتجات، مزادات)
  Widget _getActiveList(HomeController controller) {
    if (controller.showTheBussines.value) {
      return _buildResponsiveList(const ListBusinessSearch());
    } else if (controller.showTheProduct.value) {
      return _buildResponsiveList(const ListProductSearching());
    } else if (controller.showTheAuction.value) {
      return _buildResponsiveList(const ListOfAuctionSearching());
    }
    return const SizedBox.shrink();
  }

  /// غلاف احترافي للقائمة مع تأثيرات جمالية
  Widget _buildResponsiveList(Widget list) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        child: list,
      ),
    );
  }
}

/// تساعد على إخفاء لوحة المفاتيح عند التمرير داخل شاشة البحث
class KeyboardDismissOnScroll extends StatelessWidget {
  final Widget child;

  const KeyboardDismissOnScroll({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
