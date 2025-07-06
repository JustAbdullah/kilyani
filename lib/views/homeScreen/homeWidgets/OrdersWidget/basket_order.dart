import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../core/data/model/basket.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_text.dart';

class BasketOrder extends StatelessWidget {
  const BasketOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showBasketOrder.value,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          controller.listofBasketOrder.value.clear();
                          controller.showBasketOrder.value = false;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Container(
                            alignment: Alignment.center,
                            width: 40.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: AppColors.TheMain,
                              borderRadius: BorderRadius.circular(10),
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
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 220.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: AppColors.blackColorTypeTeo,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "محــتويات السلة",
                      style: TextStyle(
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.whiteColor,
                        fontSize: 17.2.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 420.h,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Obx(() {
                          if (controller.listofBasketOrder.value.isEmpty) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return Shimmer.fromColors(
                                      baseColor: Color.fromARGB(31, 83, 82, 82),
                                      highlightColor: AppColors.whiteColor,
                                      enabled: true,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 5.h),
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100.h,
                                          child: SingleChildScrollView(
                                            child: Stack(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.7,
                                                      height: 120.h,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 15.h,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        45.w),
                                                            child: SizedBox(
                                                              width: 140.w,
                                                              child: Text(
                                                                "يتم التحمـيل",
                                                                // ignore: deprecated_member_use
                                                                style:
                                                                    TextStyle(
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
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2.h,
                                                          ),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          50.w),
                                                              child: Text(
                                                                "يتم التحمـيل",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      AppTextStyles
                                                                          .Almarai,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          74,
                                                                          73,
                                                                          73),
                                                                  fontSize:
                                                                      12.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              )),
                                                          SizedBox(
                                                            height: 2.h,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.8,
                                                      height: 120.h,
                                                      child: CachedNetworkImage(
                                                          width: 30.w,
                                                          height: 30.h,
                                                          fit: BoxFit.contain,
                                                          imageUrl: "",
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                          placeholder: (context, url) => SizedBox(
                                                              child: ContainerCustom(
                                                                  colorContainer: AppColors.TheMain,
                                                                  heigthContainer: 30.h,
                                                                  widthContainer: 30.w,
                                                                  child: TextCustom(
                                                                    theText:
                                                                        "كليانى",
                                                                    fontSizeWidth:
                                                                        10,
                                                                    fontFamily:
                                                                        AppTextStyles
                                                                            .Marhey,
                                                                    fontColor:
                                                                        AppColors
                                                                            .whiteColor,
                                                                  )))),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 0.w),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                          width: 40.w,
                                                          height: 30.h,
                                                          fit: BoxFit.cover,
                                                          imageUrl: "",
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                          placeholder: (context, url) => SizedBox(
                                                              child: ContainerCustom(
                                                                  colorContainer: AppColors.TheMain,
                                                                  heigthContainer: 30.h,
                                                                  widthContainer: 30.w,
                                                                  child: TextCustom(
                                                                    theText:
                                                                        "كليانى",
                                                                    fontSizeWidth:
                                                                        10,
                                                                    fontFamily:
                                                                        AppTextStyles
                                                                            .Marhey,
                                                                    fontColor:
                                                                        AppColors
                                                                            .whiteColor,
                                                                  )))),
                                                      SizedBox(
                                                        width: 50.w,
                                                        child: Text(
                                                          "يتم التحمـيل",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                AppTextStyles
                                                                    .Almarai,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                236, 185, 0),
                                                            fontSize: 12.2.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 29.w, top: 7.h),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 80.w,
                                                        height: 20.h,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .TheMain,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "يتم التحمـيل",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    AppTextStyles
                                                                        .Almarai,
                                                                color: AppColors
                                                                    .whiteColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    15.2.sp,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            SizedBox(
                                                              width: 1.2.w,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 3.h),
                                                              child: Text(
                                                                "يتم التحمـيل",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      AppTextStyles
                                                                          .Almarai,
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                  fontSize:
                                                                      10.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                });
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    controller.listofBasketOrder.value.length,
                                itemBuilder: (context, index) {
                                  Basket basket =
                                      controller.listofBasketOrder.value[index];

                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 210.w,
                                                        child: Text(
                                                          basket.productName,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                AppTextStyles
                                                                    .Almarai,
                                                            color: AppColors
                                                                .TheMain,
                                                            fontSize: 17.2.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            "الكمية:",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .blackColorTypeTeo,
                                                              fontSize: 15.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            width: 2.4.w,
                                                          ),
                                                          Text(
                                                            basket.quantity
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .blackColorTypeTeo,
                                                              fontSize: 15.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            "السعر:",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .blackColorTypeTeo,
                                                              fontSize: 15.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            width: 2.4.w,
                                                          ),
                                                          Text(
                                                            basket.price
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: Colors
                                                                  .green[700],
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            width: 2.4.w,
                                                          ),
                                                          Text(
                                                            "أوقية",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .blackColorTypeTeo,
                                                              fontSize: 12.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            width: 1.4.w,
                                                          ),
                                                          Text(
                                                            "-",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeThree,
                                                              fontSize: 10.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Text(
                                                            "لايشمل التخفيض",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeThree,
                                                              fontSize: 10.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            if (controller
                                                                    .showMoreDetails
                                                                    .value ==
                                                                false) {
                                                              controller
                                                                  .showMoreDetails
                                                                  .value = true;

                                                              controller
                                                                      .idShowMordeDetails
                                                                      .value =
                                                                  basket
                                                                      .shoppingId
                                                                      .toString();
                                                            } else {
                                                              controller
                                                                  .showMoreDetails
                                                                  .value = false;
                                                            }
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "المزيد من التفاصيل",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      AppTextStyles
                                                                          .Almarai,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      72,
                                                                      74,
                                                                      75),
                                                                  fontSize:
                                                                      14.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              SizedBox(
                                                                width: 13.4.w,
                                                              ),
                                                              GetX<
                                                                  HomeController>(
                                                                builder:
                                                                    (controllerns) =>
                                                                        InkWell(
                                                                  onTap: () {
                                                                    if (controllerns
                                                                            .showMoreDetails
                                                                            .value ==
                                                                        false) {
                                                                      controllerns
                                                                          .showMoreDetails
                                                                          .value = true;

                                                                      controllerns
                                                                              .idShowMordeDetails
                                                                              .value =
                                                                          basket
                                                                              .shoppingId
                                                                              .toString();
                                                                    } else {
                                                                      controllerns
                                                                          .showMoreDetails
                                                                          .value = false;
                                                                    }
                                                                  },
                                                                  child: Image
                                                                      .asset(
                                                                    controllerns.showMoreDetails.value &&
                                                                            (basket.shoppingId.toString() ==
                                                                                controllerns.idShowMordeDetails.value
                                                                                    .toString())
                                                                        ? ImagesPath
                                                                            .ArrowTop
                                                                        : ImagesPath
                                                                            .ArrowDown,
                                                                    width: controllerns.showMoreDetails.value &&
                                                                            (basket.shoppingId.toString() ==
                                                                                controllerns.idShowMordeDetails.value.toString())
                                                                        ? 20.w
                                                                        : 10.w,
                                                                    height: controllerns.showMoreDetails.value &&
                                                                            (basket.shoppingId.toString() ==
                                                                                controllerns.idShowMordeDetails.value.toString())
                                                                        ? 20.h
                                                                        : 10.h,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      GetX<HomeController>(
                                                          builder: (controllern) =>
                                                              Visibility(
                                                                  visible: controllern
                                                                          .showMoreDetails
                                                                          .value &&
                                                                      (basket.shoppingId
                                                                              .toString() ==
                                                                          controllern
                                                                              .idShowMordeDetails
                                                                              .value
                                                                              .toString()),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        "الحجم:",
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          color:
                                                                              AppColors.blackColorTypeTeo,
                                                                          fontSize:
                                                                              15.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            2.4.w,
                                                                      ),
                                                                      Text(
                                                                        basket
                                                                            .size_name,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          color:
                                                                              AppColors.blackColorTypeTeo,
                                                                          fontSize:
                                                                              15.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ],
                                                                  ))),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      GetX<HomeController>(
                                                          builder:
                                                              (controllern) =>
                                                                  Visibility(
                                                                    visible: controllern
                                                                            .showMoreDetails
                                                                            .value &&
                                                                        (basket.shoppingId.toString() ==
                                                                            controllern.idShowMordeDetails.value.toString()),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          "اللون:",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                AppTextStyles.Almarai,
                                                                            color:
                                                                                AppColors.blackColorTypeTeo,
                                                                            fontSize:
                                                                                15.2.sp,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              2.4.w,
                                                                        ),
                                                                        basket.color_code ==
                                                                                "0xFFF0EFEF"
                                                                            ? Text(
                                                                                "لايوجد لون",
                                                                                style: TextStyle(
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  color: AppColors.redColor,
                                                                                  fontSize: 15.2.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                              )
                                                                            : Container(
                                                                                width: 50.w,
                                                                                height: 10.h,
                                                                                decoration: BoxDecoration(color: Color(int.parse(basket.color_code)), borderRadius: BorderRadius.circular(10)),
                                                                              ),
                                                                      ],
                                                                    ),
                                                                  ))
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      CachedNetworkImage(
                                                          width: 50.w,
                                                          height: 50.h,
                                                          fit: BoxFit.contain,
                                                          imageUrl: basket
                                                              .product_image,
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                          placeholder: (context, url) => SizedBox(
                                                              child: ContainerCustom(
                                                                  colorContainer: AppColors.TheMain,
                                                                  heigthContainer: 30.h,
                                                                  widthContainer: 30.w,
                                                                  child: TextCustom(
                                                                    theText:
                                                                        "كليانى",
                                                                    fontSizeWidth:
                                                                        10,
                                                                    fontFamily:
                                                                        AppTextStyles
                                                                            .Marhey,
                                                                    fontColor:
                                                                        AppColors
                                                                            .whiteColor,
                                                                  )))),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 0.5.h,
                                                color: Color.fromARGB(
                                                    255, 114, 113, 113),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                        }),
                      )),
                ],
              ),
            )));
  }
}
