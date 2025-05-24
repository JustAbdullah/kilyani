import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:kilyani_app/views/WelcomeScreen/welcome.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
              visible: controller.theSettings.value,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: AppColors.whiteColor,
                  child: Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text("الإعدادت والتخصيص",
                                  // ignore: deprecated_member_use
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.blackColor,
                                    fontSize: 20.2.sp,
                                    fontWeight: FontWeight.bold,
                                  )))),
                      Padding(
                        padding: EdgeInsets.only(top: 60.h),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: InkWell(
                                    onTap: () {
                                      controller.infoAccount.value = true;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "معلوماتي",
                                          // ignore: deprecated_member_use
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.balckColorTypeFour,
                                            fontSize: 16.2.sp,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                        Image.asset(
                                          ImagesPath.account,
                                          width: 25.w,
                                          height: 25.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: InkWell(
                                      onTap: () {
                                        controller.getDataMessages();
                                        controller.messageList.value = true;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "التنبيهات والرسائل",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.message,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: InkWell(
                                      onTap: () {
                                        controller.authPage.value = true;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "التوثيق",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.auth,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: InkWell(
                                      onTap: () {
                                        controller.locationShow.value = true;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "موقعي",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.location,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: InkWell(
                                      onTap: () {
                                        controller.codeShow.value = true;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "التسويق",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.market,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: InkWell(
                                      onTap: () {
                                        controller.getDataBasket(
                                            controller.specilcode);
                                        controller.theSettings.value = false;
                                        controller.showTheBasket.value = true;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "السلة",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.CartShopIconOrange,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: InkWell(
                                      onTap: () {
                                        controller.getWalletHistory();
                                        controller.walletShow.value = true;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "المحفظة",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.wallet,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.getDataOrders();
                                    controller.showTheOrder.value = true;
                                    controller.theSettings.value = false;
                                    controller.homeView.value = false;
                                    controller.showTheBasket.value = false;
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الطلبيات",
                                          // ignore: deprecated_member_use
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.balckColorTypeFour,
                                            fontSize: 16.2.sp,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                        Image.asset(
                                          ImagesPath.OrderBoxIconOrange,
                                          width: 25.w,
                                          height: 25.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.getConvData();
                                    controller.pageConv.value = true;
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "المحادثات",
                                          // ignore: deprecated_member_use
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.balckColorTypeFour,
                                            fontSize: 16.2.sp,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                        Image.asset(
                                          ImagesPath.chat,
                                          width: 25.w,
                                          height: 25.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.checkBills();
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الفواتير",
                                          // ignore: deprecated_member_use
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.balckColorTypeFour,
                                            fontSize: 16.2.sp,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                        Image.asset(
                                          ImagesPath.bills,
                                          width: 25.w,
                                          height: 25.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: InkWell(
                                      onTap: () {
                                        controller.getWalletHistory();
                                        controller.walletCharge.value = true;
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "شحن المحفظة",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.wallet,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.showThePackage.value = true;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "باقات الاعمال",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.business,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.terms.value = true;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "القواعد والشروط",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.terms,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.storesTerms.value = true;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "إتفاقية المتاجر",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.agreement,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3.h,
                                    color: AppColors.blackColorTypeTeo,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                    onTap: () {
                                      Get.to(WelcomeScreen());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "تسجيل الخروج",
                                            // ignore: deprecated_member_use
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                          Image.asset(
                                            ImagesPath.logout,
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 97.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
