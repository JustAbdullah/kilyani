import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../core/data/model/auctionUser.dart';
import '../../../../customWidgets/custome_textfiled.dart';

class DetailsAuctionPage extends StatelessWidget {
  const DetailsAuctionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      // إذا لم يكن عرض تفاصيل المزاد مفعلًا، إرجاع مساحة فارغة.
      if (!controller.showDetialsAuction.value) return const SizedBox.shrink();

      // التأكد من وجود المزاد الحالي.
      final auction = controller.currentAuction.value;
      if (auction == null) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.TheMain),
        );
      }

      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.blackColorTypeTeo,
                centerTitle: true,
                title: Text(
                  "تــفاصيل المزاد",
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  color: AppColors.whiteColor,
                  onPressed: () => controller.showDetialsAuction.value = false,
                ),
              ),
              body: Stack(
                children: [
                  SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 20.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            /// قسم الصورة مع تأثير التدرج وحواف مستديرة
                            Container(
                              height: 180.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: auction.auctionImage,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        color:
                                            AppColors.TheMain.withOpacity(0.3),
                                        child: Center(
                                          child: Text(
                                            "تحميل...",
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Marhey,
                                              fontSize: 12.sp,
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        color: Colors.grey[300],
                                        child: Icon(
                                          Icons.error,
                                          color: Colors.red,
                                          size: 30.sp,
                                        ),
                                      ),
                                    ),
                                    // تدرج أسفل الصورة لإبراز اسم المزاد
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Colors.black45
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12.h,
                                      left: 16.w,
                                      child: Text(
                                        auction.auctionName,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            /// بطاقة معلومات المتجر (الشعار والاسم)
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: auction.logoBuss,
                                      width: 50.w,
                                      height: 50.h,
                                      fit: BoxFit.cover,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: const BoxDecoration(
                                          color: AppColors.TheMain,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "تحميل...",
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Marhey,
                                              fontSize: 10.sp,
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                        radius: 25.r,
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(Icons.error,
                                            color: Colors.red, size: 24.sp),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Text(
                                        auction.nameBuss,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.TheMain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            /// وصف المزاد داخل بطاقة عصرية
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Text(
                                  auction.auctionDescription,
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSize: 15.sp,
                                    height: 1.3,
                                    color: Colors.grey[800],
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            /// قسم التواريخ (بدء وانتهاء المزاد)
                            Row(
                              children: [
                                Expanded(
                                  child: _buildInfoTile(
                                    label: "تاريخ بدء المزاد",
                                    value: auction.auctionBeginning,
                                    icon: Icons.play_arrow,
                                    iconColor: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: _buildInfoTile(
                                    label: "تاريخ انتهاء المزاد",
                                    value: auction.auctionEnd,
                                    icon: Icons.stop,
                                    iconColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),

                            /// قسم الأسعار: التأكيد على أن السعر هو "سعر بدء المزاد"
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blueAccent.shade100,
                                      Colors.blueAccent.shade200,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 16.w),
                                child: Column(
                                  children: [
                                    Text(
                                      "سعر بدء المزاد",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      "${auction.openingPrice.toString()} اوقية",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            ////////////////////////////////////////////////////////////////
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150.h,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: FutureBuilder<List<AuctionUser>>(
                                future: controller.getDataAcutionUser(controller
                                        .currentAuction.value?.auctionId
                                        .toString() ??
                                    "0"),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.TheMain,
                                      ),
                                    );
                                  } else if (snapshot.hasError ||
                                      !snapshot.hasData ||
                                      snapshot.data!.isEmpty) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Lottie.asset(
                                            ImagesPath.empty,
                                            width: 100.w,
                                            height: 100.h,
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            "لا توجد مزايدات حتى الآن",
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              fontSize: 14.sp,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        AuctionUser auctionUser =
                                            snapshot.data![index];

                                        /// حفظ أعلى سعر في حالة أول مزايدة
                                        if (index == 0) {
                                          controller.priceAuctionHigh =
                                              auctionUser.price;
                                        }

                                        return Card(
                                          elevation: 3,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 4.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                /// الصف الأول: عرض اليوم والوقت
                                                Row(
                                                  children: [
                                                    /// اليوم
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w,
                                                              vertical: 4.h),
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 233, 229, 229),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Text(
                                                        auctionUser.day,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .redColor,
                                                          fontSize: 14.2.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8.w),

                                                    /// الوقت
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w,
                                                              vertical: 4.h),
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 233, 229, 229),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Text(
                                                        auctionUser.time,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 14.2.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8.h),

                                                /// الصف الثاني: مبلغ المزايدة
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: RichText(
                                                        text: TextSpan(
                                                          text:
                                                              "تم رفع مبلغ المزايدة إلى: ",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                AppTextStyles
                                                                    .Almarai,
                                                            color: AppColors
                                                                .balckColorTypeFour,
                                                            fontSize: 15.2.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          children: [
                                                            TextSpan(
                                                              text: auctionUser
                                                                  .price
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    AppTextStyles
                                                                        .Almarai,
                                                                color: AppColors
                                                                    .TheMain,
                                                                fontSize:
                                                                    16.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: " أوقية",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    AppTextStyles
                                                                        .Almarai,
                                                                color: AppColors
                                                                    .balckColorTypeFour,
                                                                fontSize:
                                                                    12.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8.h),

                                                /// الصف الثالث: اسم المستخدم الذي قام بالمزايدة
                                                Row(
                                                  children: [
                                                    Text(
                                                      "تمت المزايدة من طرف: ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .balckColorTypeFour,
                                                        fontSize: 15.2.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    Expanded(
                                                      child: Text(
                                                        auctionUser.userName
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color:
                                                              AppColors.TheMain,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 4.h),
                                    );
                                  }
                                },
                              ),
                            ),

                            /// زر بدء المزايدة (موضَع أسفل الشاشة)
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 5.h, left: 20.w, right: 20.w),
                                    child: InkWell(
                                        onTap: () {
                                          if (controller.users!.value.amount <=
                                              controller.currentAuction.value
                                                  ?.openingPrice) {
                                            controller.isNoMoneyInWallet.value =
                                                true;
                                          } else {
                                            controller.addAuctionData.value =
                                                true;
                                            controller.isNoMoneyInWallet.value =
                                                false;
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                AppColors.TheMain,
                                                AppColors.TheMain.withOpacity(
                                                    0.8),
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.TheMain
                                                    .withOpacity(0.4),
                                                blurRadius: 8,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            "المزايدة على هذا المنتج",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )))),
                          ])),
                  Visibility(
                      visible: controller.addAuctionData.value,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black38,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black38,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 170.h,
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      onTap: () {
                                        controller.addAuctionData.value = false;
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.w, top: 5.h),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 40.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.TheMain,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              ImagesPath.arrow,
                                              width: 45.w,
                                              height: 45.h,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      child: Text(
                                        "ادخل مبلغ المزايدة",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour,
                                          fontSize: 18.2.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      )),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: TextFormFiledCustom(
                                              labelData: "مبلغ المزايدة".tr,
                                              hintData:
                                                  "لطفًا ادخل مبلغ المزايدة".tr,
                                              iconData: Icons.person,
                                              controllerData:
                                                  controller.controllerOne,
                                              value: (value) {
                                                SystemChrome
                                                    .setEnabledSystemUIMode(
                                                        SystemUiMode.manual,
                                                        overlays: []);
                                                controller.newPrice =
                                                    value.toString();
                                                return value;
                                              },
                                              fillColor: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              hintColor: AppColors.TheMain,
                                              iconColor: AppColors.TheMain,
                                              borderSideColor: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              fontColor: AppColors.TheMain,
                                              obscureText: false,
                                              keyboardType:
                                                  TextInputType.number,
                                              autofillHints: [
                                                AutofillHints.name
                                              ],
                                              onChanged: (value) {
                                                SystemChrome
                                                    .setEnabledSystemUIMode(
                                                        SystemUiMode.manual,
                                                        overlays: []);
                                                controller.newPrice =
                                                    value.toString();
                                                return value;
                                              },
                                              validator: (value) {},
                                            ),
                                          ))),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 45.w),
                                      child: InkWell(
                                        onTap: () {
                                          controller.addAuction(
                                              controller.currentAuction.value
                                                  ?.auctionId,
                                              controller.newPrice);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 220.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.TheMain,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Text(
                                            "المزايدة",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  Visibility(
                      visible: controller.isNoMoneyInWallet.value,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black54,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black54,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 158.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset(ImagesPath.error,
                                  width: 70.w, height: 70.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 105.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                child: Text(
                                  "لاتمتلك رصيد كافي في المحفظة للمزايدة",
                                  style: TextStyle(
                                    height: 1.1.h,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor,
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  controller.isNoMoneyInWallet.value = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 220.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.TheMain,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "إخفاء",
                                    style: TextStyle(
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor,
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Visibility(
                      visible: controller.isPriceLessTheHigh.value,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black54,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black54,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 158.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset(ImagesPath.error,
                                  width: 70.w, height: 70.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 105.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                child: Text(
                                  "المبلغ الذي ادخلته أقل من مبلغ المزايده الحالي",
                                  style: TextStyle(
                                    height: 1.1.h,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor,
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  controller.isPriceLessTheHigh.value = false;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 220.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.TheMain,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "إخفاء",
                                    style: TextStyle(
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor,
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )));
    });
  }

  ///////////////////////////////////////////////////////////

  /// ويدجت لعرض معلومات التواريخ مع أيقونة توضيحية
  Widget _buildInfoTile({
    required String label,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.balckColorTypeFour,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


                                /* 
                            
                    
                    ])))));
  }
}
*/