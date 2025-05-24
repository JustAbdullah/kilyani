import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:kilyani_app/core/data/model/basket.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_text.dart';
import '../../../../customWidgets/custome_textfiled.dart';

class BasketTheScreen extends StatelessWidget {
  const BasketTheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheBasket.value,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.90,
                color: Colors.white,
                child: Stack(children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withOpacity(0.1), // لون الظل
                                          spreadRadius: 2, // انتشار الظل
                                          blurRadius: 2, // انعكاس الظل
                                          offset: Offset(
                                              0, 3), // انحراف الظل (الاتجاه)
                                        ),
                                      ],
                                    ),
                                    height: 70.h,
                                    child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 25.w,
                                                    height: 25.h,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .yellowColor,
                                                        shape: BoxShape.circle),
                                                    child: Center(
                                                      child: Text(
                                                        "1",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .balckColorTypeFour,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    "السلة",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .blackColorTypeTeo,
                                                      fontSize: 15.2.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 7.h),
                                                child: Container(
                                                  width: 30.w,
                                                  height: 1.7.h,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.TheMain,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 25.w,
                                                    height: 25.h,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 66, 65, 65),
                                                        shape: BoxShape.circle),
                                                    child: Center(
                                                      child: Text(
                                                        "2",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    "الطلبية",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .blackColorTypeTeo,
                                                      fontSize: 14.2.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 7.h),
                                                child: Container(
                                                  width: 30.w,
                                                  height: 1.7.h,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.TheMain,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 25.w,
                                                    height: 25.h,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 66, 65, 65),
                                                        shape: BoxShape.circle),
                                                    child: Center(
                                                      child: Text(
                                                        "3",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    "موعد الوصول",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .blackColorTypeTeo,
                                                      fontSize: 14.2.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 7.h),
                                                child: Container(
                                                  width: 30.w,
                                                  height: 1.7.h,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.TheMain,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 25.w,
                                                    height: 25.h,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 66, 65, 65),
                                                        shape: BoxShape.circle),
                                                    child: Center(
                                                      child: Text(
                                                        "4",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    "الإنهاء",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .blackColorTypeTeo,
                                                      fontSize: 14.2.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              )
                                            ])),
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
                                  height: 300.h,
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Obx(() {
                                      if (controller
                                          .listofBasket.value.isEmpty) {
                                        controller.checkTheBasket();
                                        return controller.isTheBasketReadyEmpty
                                                    .value ==
                                                true
                                            ? Center(
                                                child: Lottie.asset(
                                                    ImagesPath.empty,
                                                    width: 300.w,
                                                    height: 300.h),
                                              )
                                            : ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: 3,
                                                shrinkWrap: true,
                                                itemBuilder: (context, i) {
                                                  return Shimmer.fromColors(
                                                      baseColor: Color.fromARGB(
                                                          31, 83, 82, 82),
                                                      highlightColor:
                                                          AppColors.whiteColor,
                                                      enabled: true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 5.h),
                                                        child: Container(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .whiteColor,
                                                          ),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 100.h,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Stack(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          1.7,
                                                                      height:
                                                                          120.h,
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                15.h,
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(right: 45.w),
                                                                            child:
                                                                                SizedBox(
                                                                              width: 140.w,
                                                                              child: Text(
                                                                                "يتم التحمـيل",
                                                                                // ignore: deprecated_member_use
                                                                                style: TextStyle(
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  color: AppColors.TheMain,
                                                                                  fontSize: 16.2.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.center,
                                                                                maxLines: 1,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                2.h,
                                                                          ),
                                                                          Padding(
                                                                              padding: EdgeInsets.only(right: 50.w),
                                                                              child: Text(
                                                                                "يتم التحمـيل",
                                                                                style: TextStyle(
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  color: Color.fromARGB(255, 74, 73, 73),
                                                                                  fontSize: 12.2.sp,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                maxLines: 3,
                                                                                overflow: TextOverflow.ellipsis,
                                                                              )),
                                                                          SizedBox(
                                                                            height:
                                                                                2.h,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2.8,
                                                                      height:
                                                                          120.h,
                                                                      child: CachedNetworkImage(
                                                                          width: 30.w,
                                                                          height: 30.h,
                                                                          fit: BoxFit.contain,
                                                                          imageUrl: "",
                                                                          imageBuilder: (context, imageProvider) => Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                  image: DecorationImage(
                                                                                    image: imageProvider,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          placeholder: (context, url) => SizedBox(
                                                                              child: ContainerCustom(
                                                                                  colorContainer: AppColors.TheMain,
                                                                                  heigthContainer: 30.h,
                                                                                  widthContainer: 30.w,
                                                                                  child: TextCustom(
                                                                                    theText: "كليانى",
                                                                                    fontSizeWidth: 10,
                                                                                    fontFamily: AppTextStyles.Marhey,
                                                                                    fontColor: AppColors.whiteColor,
                                                                                  )))),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              0.w),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CachedNetworkImage(
                                                                          width: 40
                                                                              .w,
                                                                          height: 30
                                                                              .h,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          imageUrl:
                                                                              "",
                                                                          imageBuilder: (context, imageProvider) =>
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                  image: DecorationImage(
                                                                                    image: imageProvider,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          placeholder: (context, url) => SizedBox(
                                                                              child: ContainerCustom(
                                                                                  colorContainer: AppColors.TheMain,
                                                                                  heigthContainer: 30.h,
                                                                                  widthContainer: 30.w,
                                                                                  child: TextCustom(
                                                                                    theText: "كليانى",
                                                                                    fontSizeWidth: 10,
                                                                                    fontFamily: AppTextStyles.Marhey,
                                                                                    fontColor: AppColors.whiteColor,
                                                                                  )))),
                                                                      SizedBox(
                                                                        width:
                                                                            50.w,
                                                                        child:
                                                                            Text(
                                                                          "يتم التحمـيل",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                AppTextStyles.Almarai,
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                236,
                                                                                185,
                                                                                0),
                                                                            fontSize:
                                                                                12.2.sp,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(left: 29.w, top: 7.h),
                                                                      child: Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        width:
                                                                            80.w,
                                                                        height:
                                                                            20.h,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                AppColors.TheMain,
                                                                            borderRadius: BorderRadius.circular(10)),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "يتم التحمـيل",
                                                                              style: TextStyle(
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.whiteColor,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 15.2.sp,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 1.2.w,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: 3.h),
                                                                              child: Text(
                                                                                "يتم التحمـيل",
                                                                                style: TextStyle(
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  color: AppColors.whiteColor,
                                                                                  fontSize: 10.2.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                                textAlign: TextAlign.center,
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
                                            itemCount: controller
                                                .listofBasket.value.length,
                                            itemBuilder: (context, index) {
                                              Basket basket = controller
                                                  .listofBasket.value[index];

                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.h),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20.w),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                        210.w,
                                                                    child: Text(
                                                                      basket
                                                                          .productName,
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            AppTextStyles.Almarai,
                                                                        color: AppColors
                                                                            .TheMain,
                                                                        fontSize:
                                                                            17.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
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
                                                                            .quantity
                                                                            .toString(),
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
                                                                            .price
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          color:
                                                                              Colors.green[700],
                                                                          fontSize:
                                                                              14.2.sp,
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
                                                                        "أوقية",
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          color:
                                                                              AppColors.blackColorTypeTeo,
                                                                          fontSize:
                                                                              12.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        if (controller.showMoreDetails.value ==
                                                                            false) {
                                                                          controller
                                                                              .showMoreDetails
                                                                              .value = true;

                                                                          controller
                                                                              .idShowMordeDetails
                                                                              .value = basket.shoppingId.toString();
                                                                        } else {
                                                                          controller
                                                                              .showMoreDetails
                                                                              .value = false;
                                                                        }
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "المزيد من التفاصيل",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: AppTextStyles.Almarai,
                                                                              color: const Color.fromARGB(255, 72, 74, 75),
                                                                              fontSize: 14.2.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                13.4.w,
                                                                          ),
                                                                          GetX<
                                                                              HomeController>(
                                                                            builder: (controllerns) =>
                                                                                InkWell(
                                                                              onTap: () {
                                                                                if (controllerns.showMoreDetails.value == false) {
                                                                                  controllerns.showMoreDetails.value = true;

                                                                                  controllerns.idShowMordeDetails.value = basket.shoppingId.toString();
                                                                                } else {
                                                                                  controllerns.showMoreDetails.value = false;
                                                                                }
                                                                              },
                                                                              child: Image.asset(
                                                                                controllerns.showMoreDetails.value && (basket.shoppingId.toString() == controllerns.idShowMordeDetails.value.toString()) ? ImagesPath.ArrowTop : ImagesPath.ArrowDown,
                                                                                width: controllerns.showMoreDetails.value && (basket.shoppingId.toString() == controllerns.idShowMordeDetails.value.toString()) ? 20.w : 10.w,
                                                                                height: controllerns.showMoreDetails.value && (basket.shoppingId.toString() == controllerns.idShowMordeDetails.value.toString()) ? 20.h : 10.h,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  GetX<HomeController>(
                                                                      builder: (controllern) => Visibility(
                                                                          visible: controllern.showMoreDetails.value && (basket.shoppingId.toString() == controllern.idShowMordeDetails.value.toString()),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                "الحجم:",
                                                                                style: TextStyle(
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  color: AppColors.blackColorTypeTeo,
                                                                                  fontSize: 15.2.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 2.4.w,
                                                                              ),
                                                                              Text(
                                                                                basket.size_name,
                                                                                style: TextStyle(
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  color: AppColors.blackColorTypeTeo,
                                                                                  fontSize: 15.2.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            ],
                                                                          ))),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  GetX<
                                                                          HomeController>(
                                                                      builder:
                                                                          (controllern) =>
                                                                              Visibility(
                                                                                visible: controllern.showMoreDetails.value && (basket.shoppingId.toString() == controllern.idShowMordeDetails.value.toString()),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Text(
                                                                                      "اللون:",
                                                                                      style: TextStyle(
                                                                                        fontFamily: AppTextStyles.Almarai,
                                                                                        color: AppColors.blackColorTypeTeo,
                                                                                        fontSize: 15.2.sp,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 2.4.w,
                                                                                    ),
                                                                                    basket.color_code == "0xFFF0EFEF"
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
                                                                      width:
                                                                          50.w,
                                                                      height:
                                                                          50.h,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      imageUrl:
                                                                          basket
                                                                              .product_image,
                                                                      imageBuilder:
                                                                          (context, imageProvider) =>
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                  image: DecorationImage(
                                                                                    image: imageProvider,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                      placeholder: (context, url) => SizedBox(
                                                                          child: ContainerCustom(
                                                                              colorContainer: AppColors.TheMain,
                                                                              heigthContainer: 30.h,
                                                                              widthContainer: 30.w,
                                                                              child: TextCustom(
                                                                                theText: "كليانى",
                                                                                fontSizeWidth: 10,
                                                                                fontFamily: AppTextStyles.Marhey,
                                                                                fontColor: AppColors.whiteColor,
                                                                              )))),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      controller.deleteBasket(basket
                                                                          .shoppingId
                                                                          .toString());
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      width:
                                                                          55.w,
                                                                      height:
                                                                          25.h,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              5),
                                                                          color:
                                                                              AppColors.redColor),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 2.w),
                                                                        child:
                                                                            TextCustom(
                                                                          theText:
                                                                              "الإزالة",
                                                                          fontSizeWidth:
                                                                              10.sp,
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          fontColor:
                                                                              AppColors.whiteColor,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 0.5.h,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    114,
                                                                    113,
                                                                    113),
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
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "إجمالي سعر السلة:",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color:
                                              Color.fromARGB(255, 83, 82, 82),
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GetX<HomeController>(
                                          builder: (controller) => Text(
                                                controller.totalPrice.value
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: const Color.fromARGB(
                                                      255, 229, 22, 22),
                                                  fontSize: 19.2.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              )),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: Text(
                                          "أوقية",
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                Color.fromARGB(255, 83, 82, 82),
                                            fontSize: 12.2.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.checkWallet();
                                        },
                                        child: Text(
                                          "موقع تسليم العملية:",
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                Color.fromARGB(255, 83, 82, 82),
                                            fontSize: 15.2.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      GetX<HomeController>(
                                          builder: (controller) => SizedBox(
                                                child: Text(
                                                  controller.address.value,
                                                  // ignore: deprecated_member_use
                                                  style: TextStyle(
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors.TheMain,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.normal),

                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                ),
                                              )),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.deleteAllBasket(
                                          controller.specilcode.toString());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 140.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.blackColorTypeTeo,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "حذف السلة",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: Colors.white,
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (controller.address.value ==
                                          "لايوجد عنوان") {
                                        controller.noLocation.value = true;
                                      } else {
                                        if (controller
                                                .listofBasket.value.length ==
                                            0) {
                                          controller.isTheBasketEmpty.value =
                                              true;
                                        } else {
                                          if (controller.users!.value.amount <=
                                              controller.totalPrice.value) {
                                            controller.isNoMoneyInWallet.value =
                                                true;
                                          } else if (controller
                                                  .users!.value.amount >=
                                              controller.totalPrice.value) {
                                            {
                                              controller.oldPriceBasket.value =
                                                  controller.totalPrice.value;
                                              controller.showCode.value = true;
                                            }
                                          }
                                        }
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 140.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.TheMain,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "إنشاء الطلبية",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: Colors.white,
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                  Visibility(
                      visible: controller.showCode.value,
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
                              height: 370.h,
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: InkWell(
                                          onTap: () {
                                            controller.showCode.value = false;
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
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.w),
                                          child: Text(
                                            "أدخل كود خصم للإستفاده مِن الخصم على إجمالي المبلغ",
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 18.2.sp,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          )),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 220.w,
                                                  child: TextFormFiledCustom(
                                                    labelData: "كود الخصم".tr,
                                                    hintData:
                                                        "لطفًا ادخل كود الخصم"
                                                            .tr,
                                                    iconData: Icons.numbers,
                                                    controllerData: controller
                                                        .controllerOne,
                                                    value: (value) {
                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      controller.codeEnter =
                                                          value.toString();
                                                      return value;
                                                    },
                                                    fillColor: Color.fromARGB(
                                                        255, 244, 244, 244),
                                                    hintColor:
                                                        AppColors.TheMain,
                                                    iconColor:
                                                        AppColors.TheMain,
                                                    borderSideColor:
                                                        Color.fromARGB(
                                                            255, 244, 244, 244),
                                                    fontColor:
                                                        AppColors.TheMain,
                                                    obscureText: false,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    autofillHints: [
                                                      AutofillHints.name
                                                    ],
                                                    onChanged: (value) {
                                                      SystemChrome
                                                          .setEnabledSystemUIMode(
                                                              SystemUiMode
                                                                  .manual,
                                                              overlays: []);
                                                      controller.codeEnter =
                                                          value.toString();
                                                      return value;
                                                    },
                                                    validator: (value) {},
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    controller.checkTheCode(
                                                        controller.codeEnter);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 110.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Text(
                                                      "التحقق من الكود",
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.70,
                                        height: 0.7.h,
                                        color: Color.fromARGB(255, 98, 96, 96),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                'إجمالي السعر قبل الخصم:',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: Color.fromARGB(
                                                      255, 83, 82, 82),
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                controller.oldPriceBasket.value
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: const Color.fromARGB(
                                                      255, 229, 22, 22),
                                                  fontSize: 16.2.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: 2.5.w,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.h),
                                                child: Text(
                                                  "أوقية",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: Color.fromARGB(
                                                        255, 83, 82, 82),
                                                    fontSize: 12.2.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                'إجمالي السعر بعد الخصم:',
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: Color.fromARGB(
                                                      255, 83, 82, 82),
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              GetX<HomeController>(
                                                  builder: (controller) => Text(
                                                        controller
                                                            .newPriceBasket
                                                            .value
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
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                              SizedBox(
                                                width: 2.5.w,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.h),
                                                child: Text(
                                                  "أوقية",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: Color.fromARGB(
                                                        255, 83, 82, 82),
                                                    fontSize: 12.2.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        height: 0.7.h,
                                        color: Color.fromARGB(255, 98, 96, 96),
                                      ),
                                      SizedBox(
                                        height: 17.h,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.w),
                                          child: Text(
                                            "في حال لم ترغب في إضافة كود خصم يمكنك تجاوز العملية والضغط على إنشاء الطلبية بشكل مباشر",
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          )),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 45.w),
                                          child: InkWell(
                                            onTap: () {
                                              controller.creaetOrder(
                                                  controller.totalPrice
                                                      .toString(),
                                                  controller.id_bussines
                                                      .toString(),
                                                  controller.codeEnter
                                                      .toString());
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
                                                "إنشاء الطلبية",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors.whiteColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: controller.waitCheckCode.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.h),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Lottie.asset(
                                                  ImagesPath.loading,
                                                  width: 70.w,
                                                  height: 70.h),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 70.h),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                child: Text(
                                                  "العملية تَتِم في الإرجاء..إنتظر قليلاً",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 15.2.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Visibility(
                                      visible: controller.isCodeNoTrue.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 48.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                  ImagesPath.error,
                                                  width: 70.w,
                                                  height: 70.h),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 115.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45.w),
                                                child: Text(
                                                  "كود التحقق الذي أدخلته خاطئ..حاول مجددًا",
                                                  style: TextStyle(
                                                    height: 1.5.h,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
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
                                              padding:
                                                  EdgeInsets.only(bottom: 38.h),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isCodeNoTrue
                                                        .value = false;
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 250.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.TheMain,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Text(
                                                      "إخفاء",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )),
                                  Visibility(
                                      visible:
                                          controller.isTheCodeTheUser.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 48.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                  ImagesPath.wearing,
                                                  width: 70.w,
                                                  height: 70.h),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 115.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45.w),
                                                child: Text(
                                                  "لايمكنك إستخدام كودك الخاص للحصول على خصم خاص..",
                                                  style: TextStyle(
                                                    height: 1.5.h,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
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
                                              padding:
                                                  EdgeInsets.only(bottom: 38.h),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isTheCodeTheUser
                                                        .value = false;
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 250.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.TheMain,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Text(
                                                      "إخفاء",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )),
                                  Visibility(
                                      visible: controller.isCodeTrue.value,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            color: Colors.black38,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 48.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                  ImagesPath.successfully,
                                                  width: 70.w,
                                                  height: 70.h),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 115.h),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45.w),
                                                child: Text(
                                                  "لقد ادخلت كود التحقق بنجاح يمكنك الان من إكمال إنشاء الطلبية مع التخفيض الخاص",
                                                  style: TextStyle(
                                                    height: 1.5.h,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
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
                                              padding:
                                                  EdgeInsets.only(bottom: 38.h),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isCodeTrue
                                                        .value = false;
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 250.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.TheMain,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Text(
                                                      "إخفاء",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  Visibility(
                      visible: controller.waitDeleteBasket.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black38,
                      )),
                  Visibility(
                      visible: controller.waitDeleteBasket.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black38,
                      )),
                  Visibility(
                      visible: controller.waitCreateOrder.value,
                      child: Stack(children: [
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Lottie.asset(ImagesPath.loading,
                                width: 70.w, height: 70.h),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 70.h),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                "العملية تَتِم في الإرجاء..إنتظر قليلاً",
                                style: TextStyle(
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.whiteColor,
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ])),
                  Visibility(
                      visible: controller.isCreateOrder.value,
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 130.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Lottie.asset(ImagesPath.successfully,
                                  width: 70.w, height: 70.h),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 120.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  "تم إنشاء الطلبية بنجاح",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor,
                                    fontSize: 15.2.sp,
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
                                  controller.isCreateOrder.value = false;
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
                      visible: controller.isNotCreateOrder.value,
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
                            padding: EdgeInsets.only(bottom: 125.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                child: Text(
                                  "لم يتم إنشاء الطلبية,هنالك خطا حاول مجددًا",
                                  style: TextStyle(
                                    height: 1.5.h,
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
                                  controller.waitCreateOrder.value = false;
                                  controller.isNotCreateOrder.value = false;
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
                                  "لاتمتلك رصيد كافي في المحفظة لإتمام الطلبية",
                                  style: TextStyle(
                                    height: 1.3.h,
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
                      visible: controller.isTheBasketEmpty.value,
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
                            padding: EdgeInsets.only(bottom: 125.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 45.w),
                                child: Text(
                                  "لايمكنك القيام بهذا الأمر ..السلة فارغة!",
                                  style: TextStyle(
                                    height: 1.5.h,
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
                                  controller.isTheBasketEmpty.value = false;
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
                      visible: controller.noLocation.value,
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
                                  "لم تقم بإضافة موقعك..أضف موقعك من أجل إنشاء الطلبية",
                                  style: TextStyle(
                                    height: 1.2.h,
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
                                  controller.noLocation.value = false;
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
                ]))));
  }
}
