import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../core/data/model/chat.dart';
import '../../../../core/data/model/order.dart';
import '../../../messages/message_error.dart';
import '../../../messages/message_successfully.dart';

class ChatWindowUser extends StatefulWidget {
  const ChatWindowUser({super.key});

  @override
  State<ChatWindowUser> createState() => _ChatWindowUserState();
}

class _ChatWindowUserState extends State<ChatWindowUser> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheChat.value,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: AppColors.whiteColor,
                child: SafeArea(
                    child: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.showTheChat.value = false;
                                      homeController.listOfTheChat.value
                                          .clear();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, top: 10.h),
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
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        "المحادثة مع:",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour,
                                          fontSize: 13.2.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        controller
                                                .currentBusiness.value?.nameBuss
                                                .toString() ??
                                            "",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.TheMain,
                                          fontSize: 16.2.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.72,
                                child: SingleChildScrollView(
                                    child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: Obx(() {
                                        if (homeController
                                            .listOfTheChat.value.isEmpty) {
                                          return Center(
                                            child:
                                                Lottie.asset(ImagesPath.empty),
                                          );
                                        } else {
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: homeController
                                                  .listOfTheChat.value.length,
                                              itemBuilder: (context, index) {
                                                final chat = homeController
                                                    .listOfTheChat.value[index];
                                                return Align(
                                                    alignment: Alignment
                                                        .topRight,
                                                    child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.w,
                                                                vertical: 5.h),
                                                        child: Directionality(
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          child: Column(
                                                            mainAxisAlignment: chat
                                                                        .howIsSend ==
                                                                    2
                                                                ? MainAxisAlignment
                                                                    .start
                                                                : MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                chat.howIsSend ==
                                                                        2
                                                                    ? CrossAxisAlignment
                                                                        .start
                                                                    : CrossAxisAlignment
                                                                        .end,
                                                            children: [
                                                              Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        10.w,
                                                                  ),
                                                                  child: Text(
                                                                    chat.howIsSend ==
                                                                            2
                                                                        ? chat.BussName
                                                                            .toString()
                                                                        : "انا"
                                                                            .toString(),
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
                                                                  )),
                                                              SizedBox(
                                                                height: 3.h,
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    color: chat.howIsSend ==
                                                                            2
                                                                        ? AppColors
                                                                            .whiteColorTypeThree
                                                                        : AppColors
                                                                            .TheMain,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10.w,
                                                                      vertical:
                                                                          10.h),
                                                                  child: Text(
                                                                    chat.chatText
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      color: chat.howIsSend == 2
                                                                          ? AppColors
                                                                              .balckColorTypeFour
                                                                          : AppColors
                                                                              .whiteColor,
                                                                      fontSize:
                                                                          16.2.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    textAlign: chat.howIsSend ==
                                                                            2
                                                                        ? TextAlign
                                                                            .right
                                                                        : TextAlign
                                                                            .left,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 5.h,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: chat
                                                                            .howIsSend ==
                                                                        2
                                                                    ? MainAxisAlignment
                                                                        .start
                                                                    : MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment: chat
                                                                            .howIsSend ==
                                                                        2
                                                                    ? CrossAxisAlignment
                                                                        .start
                                                                    : CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 2.w,
                                                                  ),
                                                                  Text(
                                                                    "تم التسليم في:",
                                                                    style:
                                                                        TextStyle(
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
                                                                    textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 1.w,
                                                                  ),
                                                                  Text(
                                                                    chat.day
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      color: AppColors
                                                                          .balckColorTypeFour,
                                                                      fontSize:
                                                                          12.2.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 2.w,
                                                                  ),
                                                                  Text(
                                                                    "-",
                                                                    style:
                                                                        TextStyle(
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
                                                                  SizedBox(
                                                                    width: 2.w,
                                                                  ),
                                                                  Text(
                                                                    chat.time
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      color: AppColors
                                                                          .balckColorTypeFour,
                                                                      fontSize:
                                                                          12.2.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 4.w,
                                                                  ),
                                                                  Image.asset(
                                                                    ImagesPath
                                                                        .theTrue,
                                                                    width: 10.w,
                                                                    height:
                                                                        15.h,
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  ),
                                                                  Image.asset(
                                                                    ImagesPath
                                                                        .theTrue,
                                                                    width: 10.w,
                                                                    height:
                                                                        15.h,
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )));
                                              });
                                        }
                                      })),
                                )))),
                        Padding(
                            padding: EdgeInsets.only(bottom: 9.h),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor: AppColors.TheMain,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: TextFormField(
                                          controller:
                                              homeController.controllerTheOne,
                                          onChanged: (value) {
                                            homeController.chatText =
                                                value.toString();
                                          },
                                          onSaved: (newValue) {
                                            homeController.chatText =
                                                newValue.toString();
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              hintText: 'اكتب الرسالة هنا'.tr,
                                              // important line
                                              // control your hints text size
                                              hintStyle: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  letterSpacing: 0.8,
                                                  color: AppColors
                                                      .balckColorTypeFour
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.bold),
                                              fillColor: Colors.white54,
                                              suffixIcon: InkWell(
                                                  onTap: () async {
                                                    homeController
                                                        .addChat(
                                                      homeController.chatText,
                                                      controller
                                                              .currentBusiness
                                                              .value
                                                              ?.business_account_id ??
                                                          "",
                                                    )
                                                        .then((_) {
                                                      setState(() {
                                                        // قم بتحديث الواجهة هنا فوراً بعد إضافة الرسالة
                                                        homeController
                                                            .getChatData(
                                                          controller
                                                                  .currentBusiness
                                                                  .value
                                                                  ?.business_account_id ??
                                                              "",
                                                        );
                                                      });
                                                    }).catchError((error) {
                                                      print(
                                                          "Error adding chat: $error");
                                                    });

                                                    Future.delayed(
                                                        Duration(
                                                            milliseconds: 400),
                                                        () {
                                                      setState(() {
                                                        homeController
                                                            .getChatData(
                                                          controller
                                                                  .currentBusiness
                                                                  .value
                                                                  ?.business_account_id ??
                                                              "",
                                                        );
                                                      });
                                                    });

                                                    Future.delayed(
                                                        Duration(
                                                            milliseconds: 800),
                                                        () {
                                                      setState(() {
                                                        homeController
                                                            .getChatData(
                                                          controller
                                                                  .currentBusiness
                                                                  .value
                                                                  ?.business_account_id ??
                                                              "",
                                                        );
                                                      });
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.TheMain,
                                                  )),
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide.none)),
                                          maxLines: 2,
                                          minLines: 2,
                                        ),
                                      ),
                                    )))),
                      ]),
                    ),
                  ),
                ])))));
  }
}
