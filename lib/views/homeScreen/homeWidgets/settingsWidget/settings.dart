import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/views/WelcomeScreen/welcome.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeInOutCubic,
        switchOutCurve: Curves.easeInOutCubic,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: controller.theSettings.value
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  backgroundColor: AppColors.whiteColor,
                  body: CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      // Modern minimalist app bar
                      SliverAppBar(
                        expandedHeight: 0,
                        floating: true,
                        pinned: true,
                        centerTitle: true,
                        backgroundColor: AppColors.whiteColor,
                        elevation: 0,
                        title: Text(
                          "الإعدادت",
                          style: TextStyle(
                            fontFamily: AppTextStyles.Almarai,
                            color: AppColors.TheMain,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 20.w,
                            color: AppColors.TheMain,
                          ),
                          onPressed: () {
                            controller.theSettings.value = false;
                          },
                        ),
                      ),

                      // Settings content
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            // Account Settings
                            _buildSectionHeader("الحساب"),
                            SizedBox(height: 10.h),
                            _buildSettingsGrid([
                              _buildSettingTile(
                                icon: Icons.person_outline,
                                title: "معلوماتي",
                                color: Colors.blue[100]!,
                                iconColor: Colors.blue,
                                onTap: () =>
                                    controller.infoAccount.value = true,
                              ),
                              _buildSettingTile(
                                icon: Icons.verified_user_outlined,
                                title: "التوثيق",
                                color: Colors.green[100]!,
                                iconColor: Colors.green,
                                onTap: () => controller.authPage.value = true,
                              ),
                              _buildSettingTile(
                                icon: Icons.location_on_outlined,
                                title: "موقعي",
                                color: Colors.orange[100]!,
                                iconColor: Colors.orange,
                                onTap: () =>
                                    controller.locationShow.value = true,
                              ),
                            ]),

                            // Financial Settings
                            SizedBox(height: 25.h),
                            _buildSectionHeader("المالية"),
                            SizedBox(height: 10.h),
                            _buildSettingsGrid([
                              _buildSettingTile(
                                icon: Icons.account_balance_wallet_outlined,
                                title: "المحفظة",
                                color: Colors.purple[100]!,
                                iconColor: Colors.purple,
                                onTap: () {
                                  controller.getWalletHistory();
                                  controller.walletShow.value = true;
                                },
                              ),
                              _buildSettingTile(
                                icon: Icons.credit_card_outlined,
                                title: "شحن المحفظة",
                                color: Colors.teal[100]!,
                                iconColor: Colors.teal,
                                onTap: () {
                                  controller.getWalletHistory();
                                  controller.walletCharge.value = true;
                                },
                              ),
                              _buildSettingTile(
                                icon: Icons.receipt_long_outlined,
                                title: "الفواتير",
                                color: Colors.indigo[100]!,
                                iconColor: Colors.indigo,
                                onTap: () => controller.checkBills(),
                              ),
                            ]),

                            // Shopping Settings
                            SizedBox(height: 25.h),
                            _buildSectionHeader("التسوق"),
                            SizedBox(height: 10.h),
                            _buildSettingsGrid([
                              _buildSettingTile(
                                icon: Icons.shopping_cart_outlined,
                                title: "السلة",
                                color: Colors.amber[100]!,
                                iconColor: Colors.amber[700]!,
                                onTap: () {
                                  controller
                                      .getDataBasket(controller.specilcode);
                                  controller.theSettings.value = false;
                                  controller.showTheBasket.value = true;
                                },
                              ),
                              _buildSettingTile(
                                icon: Icons.shopping_bag_outlined,
                                title: "الطلبيات",
                                color: Colors.deepOrange[100]!,
                                iconColor: Colors.deepOrange,
                                onTap: () {
                                  controller.getDataOrders();
                                  controller.showTheOrder.value = true;
                                  controller.theSettings.value = false;
                                  controller.homeView.value = false;
                                  controller.showTheBasket.value = false;
                                },
                              ),
                              _buildSettingTile(
                                icon: Icons.local_offer_outlined,
                                title: "التسويق",
                                color: Colors.pink[100]!,
                                iconColor: Colors.pink,
                                onTap: () => controller.codeShow.value = true,
                              ),
                            ]),

                            // Communication Settings
                            SizedBox(height: 25.h),
                            _buildSectionHeader("التواصل"),
                            SizedBox(height: 10.h),
                            _buildSettingsGrid([
                              _buildSettingTile(
                                icon: Icons.chat_bubble_outline,
                                title: "المحادثات",
                                color: Colors.lightBlue[100]!,
                                iconColor: Colors.lightBlue,
                                onTap: () {
                                  controller.getConvData();
                                  controller.pageConv.value = true;
                                },
                              ),
                              _buildSettingTile(
                                icon: Icons.notifications_none_outlined,
                                title: "الرسائل",
                                color: Colors.lime[100]!,
                                iconColor: Colors.lime[700]!,
                                onTap: () {
                                  controller.getDataMessages();
                                  controller.messageList.value = true;
                                },
                              ),
                            ]),

                            // Legal Settings
                            SizedBox(height: 25.h),
                            _buildSectionHeader("القانونية"),
                            SizedBox(height: 10.h),
                            _buildSettingsGrid([
                              _buildSettingTile(
                                icon: Icons.gavel_outlined,
                                title: "الشروط",
                                color: Colors.blueGrey[100]!,
                                iconColor: Colors.blueGrey,
                                onTap: () => controller.terms.value = true,
                              ),
                              _buildSettingTile(
                                icon: Icons.assignment_outlined,
                                title: "اتفاقية المتاجر",
                                color: Colors.brown[100]!,
                                iconColor: Colors.brown,
                                onTap: () =>
                                    controller.storesTerms.value = true,
                              ),
                              _buildSettingTile(
                                icon: Icons.business_center_outlined,
                                title: "باقات الأعمال",
                                color: Colors.cyan[100]!,
                                iconColor: Colors.cyan,
                                onTap: () =>
                                    controller.showThePackage.value = true,
                              ),
                            ]),

                            // Logout button
                            SizedBox(height: 30.h),
                            _buildLogoutButton(context),
                            SizedBox(height: 70.h),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  // Build section header
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: AppTextStyles.Almarai,
          color: AppColors.TheMain,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // Build settings grid
  Widget _buildSettingsGrid(List<Widget> children) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,
      childAspectRatio: 0.9,
      children: children,
    );
  }

  // Build setting tile
  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 26.w,
                  color: iconColor,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.balckColorTypeFour,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Logout button
  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: InkWell(
        onTap: () => Get.to(const WelcomeScreen()),
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              )
            ],
            border: Border.all(color: Colors.red.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                size: 20.w,
                color: Colors.red,
              ),
              SizedBox(width: 10.w),
              Text(
                "تسجيل الخروج",
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: Colors.red,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
