import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/views/messages/message_successfully.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../core/data/model/rating.dart';
import '../../../messages/message_wait.dart';

class RatingListBuss extends StatelessWidget {
  const RatingListBuss({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheRatingBuss.value,
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                    color: AppColors.whiteColor,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Container(
                            color: AppColors.whiteColor,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .showTheRatingBuss
                                                              .value = false;
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 40.w,
                                                          height: 30.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .TheMain,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: Image.asset(
                                                              ImagesPath.arrow,
                                                              width: 45.w,
                                                              height: 45.h,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]))))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    controller.currentBusiness.value?.nameBuss
                                            .toString() ??
                                        "no",
                                    style: TextStyle(
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.blackColorTypeTeo,
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "تقييمات ومراجعات المتجر",
                                  style: TextStyle(
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 500.h,
                                  child: FutureBuilder<List<Rating>>(
                                      future: controller.getRatingBuss(
                                          controller.currentBusiness.value!
                                              .business_account_id),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child: CircularProgressIndicator(
                                            color: AppColors.TheMain,
                                          ));
                                        } else if (snapshot.hasError) {
                                          print('Error: ${snapshot.error}');
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 00.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Lottie.asset(ImagesPath.empty,
                                                    width: 150.w,
                                                    fit: BoxFit.cover,
                                                    height: 150.h),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  "لاتوجد مراجعات وتقييمات لهذا المتجر",
                                                  style: TextStyle(
                                                    fontSize: 12.2.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .blackColorTypeTeo,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return ListView.builder(
                                              itemCount: snapshot.data!.length,
                                              itemBuilder: (context, index) {
                                                Rating rating =
                                                    snapshot.data![index];

                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.h),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 10.w,
                                                        ),
                                                        child: Directionality(
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: AppColors
                                                                  .whiteColor,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.1), // لون الظل
                                                                  spreadRadius:
                                                                      2, // انتشار الظل
                                                                  blurRadius:
                                                                      2, // انعكاس الظل
                                                                  offset: Offset(
                                                                      0,
                                                                      3), // انحراف الظل (الاتجاه)
                                                                ),
                                                              ],
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10.w),
                                                                  child: Row(
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        ImagesPath
                                                                            .account,
                                                                        width:
                                                                            10.w,
                                                                        height:
                                                                            15.h,
                                                                        fit: BoxFit
                                                                            .fitHeight,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            3.w,
                                                                      ),
                                                                      ConstrainedBox(
                                                                        constraints:
                                                                            BoxConstraints(maxWidth: 140.w),
                                                                        child:
                                                                            Text(
                                                                          rating
                                                                              .user_name,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14.2.sp,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily:
                                                                                AppTextStyles.Almarai,
                                                                            color:
                                                                                AppColors.TheMain,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            4.w,
                                                                      ),
                                                                      Text(
                                                                        ":",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          color:
                                                                              AppColors.blackColorTypeTeo,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            4.w,
                                                                      ),
                                                                      Text(
                                                                        rating
                                                                            .rating
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              13.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          color:
                                                                              AppColors.balckColorTypeFour,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            4.w,
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        ImagesPath
                                                                            .rating,
                                                                        width:
                                                                            15.w,
                                                                        height:
                                                                            15.h,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            7.w),
                                                                    child: Text(
                                                                      rating
                                                                          .text_rating,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontFamily:
                                                                            AppTextStyles.Almarai,
                                                                        color: AppColors
                                                                            .blackColorTypeTeo,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 15.h,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                );
                                              });
                                        }
                                      }),
                                )
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () {
                                controller.addRatintProduct.value = true;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 250.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                    color: AppColors.TheMain,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Text(
                                  "التقييم الان",
                                  style: TextStyle(
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: controller.addRatintProduct.value,
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.black45,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.black45,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 320.w,
                                      height: 300.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10.h),
                                                      child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w),
                                                          child: Directionality(
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .addRatintProduct
                                                                            .value = false;

                                                                        controller
                                                                            .numberOfRating
                                                                            .value = 0;
                                                                        controller.theRatingText =
                                                                            "a";
                                                                        controller
                                                                            .controllerTheOne
                                                                            .clear();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        width:
                                                                            40.w,
                                                                        height:
                                                                            30.h,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              AppColors.TheMain,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Image.asset(
                                                                            ImagesPath.arrow,
                                                                            width:
                                                                                45.w,
                                                                            height:
                                                                                45.h,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]))))),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "الــتقييم والمراجعة  الأن",
                                                  style: TextStyle(
                                                    fontSize: 15.2.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .blackColorTypeTeo,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Text(
                                                    "قم بإضافة التقييم والمراجعة لهذا المتجر",
                                                    style: TextStyle(
                                                      fontSize: 13.2.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .balckColorTypeFour,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Text(
                                                    "يؤدي تقييمك الصادق إلى إعطاء تغذية ومرجع مفيد للغير",
                                                    style: TextStyle(
                                                      fontSize: 13.2.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .balckColorTypeFour,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 17.h,
                                              ),
                                              Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .numberOfRating
                                                              .value = 1;
                                                        },
                                                        child: Image.asset(
                                                          controller.numberOfRating
                                                                      .value >=
                                                                  1
                                                              ? ImagesPath
                                                                  .rating
                                                              : ImagesPath
                                                                  .ratingEmpty,
                                                          width: 30.w,
                                                          height: 30.h,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 4.w,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .numberOfRating
                                                              .value = 2;
                                                        },
                                                        child: Image.asset(
                                                          controller.numberOfRating
                                                                      .value >=
                                                                  2
                                                              ? ImagesPath
                                                                  .rating
                                                              : ImagesPath
                                                                  .ratingEmpty,
                                                          width: 30.w,
                                                          height: 30.h,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 4.w,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .numberOfRating
                                                              .value = 3;
                                                        },
                                                        child: Image.asset(
                                                          controller.numberOfRating
                                                                      .value >=
                                                                  3
                                                              ? ImagesPath
                                                                  .rating
                                                              : ImagesPath
                                                                  .ratingEmpty,
                                                          width: 30.w,
                                                          height: 30.h,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 4.w,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .numberOfRating
                                                              .value = 4;
                                                        },
                                                        child: Image.asset(
                                                          controller.numberOfRating
                                                                      .value >=
                                                                  4
                                                              ? ImagesPath
                                                                  .rating
                                                              : ImagesPath
                                                                  .ratingEmpty,
                                                          width: 30.w,
                                                          height: 30.h,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 4.w,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .numberOfRating
                                                              .value = 5;
                                                        },
                                                        child: Image.asset(
                                                          controller.numberOfRating
                                                                      .value >=
                                                                  5
                                                              ? ImagesPath
                                                                  .rating
                                                              : ImagesPath
                                                                  .ratingEmpty,
                                                          width: 30.w,
                                                          height: 30.h,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.w),
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: Material(
                                                      elevation: 5,
                                                      shadowColor:
                                                          AppColors.TheMain,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                      child: TextFormField(
                                                        controller: controller
                                                            .controllerTheOne,
                                                        onChanged: (value) {
                                                          SystemChrome
                                                              .setEnabledSystemUIMode(
                                                                  SystemUiMode
                                                                      .manual,
                                                                  overlays: []);
                                                          controller
                                                                  .theRatingText =
                                                              value.toString();
                                                        },
                                                        onSaved: (newValue) {
                                                          SystemChrome
                                                              .setEnabledSystemUIMode(
                                                                  SystemUiMode
                                                                      .manual,
                                                                  overlays: []);
                                                          controller
                                                                  .theRatingText =
                                                              newValue
                                                                  .toString();
                                                        },
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    'اكتب المراجعة هنا'
                                                                        .tr,
                                                                // important line
                                                                // control your hints text size
                                                                hintStyle: TextStyle(
                                                                    fontFamily:
                                                                        AppTextStyles
                                                                            .Almarai,
                                                                    letterSpacing:
                                                                        0.8,
                                                                    color: AppColors
                                                                        .balckColorTypeFour
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                fillColor: Colors
                                                                    .white54,
                                                                filled: true,
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none)),
                                                        maxLines: 3,
                                                        minLines: 3,
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "تجنب إستخدام الألفاظ المسيئة والتجريح والتشهير,,",
                                                  style: TextStyle(
                                                    fontSize: 13.2.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors.redColor,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: InkWell(
                                              onTap: () {
                                                controller.addRatingBuss(
                                                    controller
                                                        .numberOfRating.value
                                                        .toString(),
                                                    controller.theRatingText,
                                                    controller
                                                            .currentBusiness
                                                            .value
                                                            ?.business_account_id
                                                            .toString() ??
                                                        "no");
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                  color: AppColors.TheMain,
                                                ),
                                                child: Text(
                                                  "التــقييم الان",
                                                  style: TextStyle(
                                                    fontSize: 15.2.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors.whiteColor,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            )),
                        MessageWait(),
                        MessageSuccessfully(),
                        GetX<HomeController>(
                            builder: (controller) => Visibility(
                                visible: controller.errorRating.value,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      color: Colors.black54,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      color: Colors.black54,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      color: Colors.black26,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 48.h),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Lottie.asset(ImagesPath.error,
                                            width: 70.w, height: 70.h),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 115.h),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 45.w),
                                          child: Text(
                                            "هنالك خطا في العملية,,الرجاء المحاولة لاحقًا",
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
                                        padding: EdgeInsets.only(bottom: 38.h),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: InkWell(
                                            onTap: () {
                                              controller.errorRating.value =
                                                  false;
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 250.w,
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  color: AppColors.TheMain,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Text(
                                                "إخفاء",
                                                style: TextStyle(
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
                                        ))
                                  ],
                                ))),
                      ],
                    )))));
  }
}
