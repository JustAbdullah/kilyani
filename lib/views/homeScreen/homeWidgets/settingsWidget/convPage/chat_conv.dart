import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import 'list_chat_data.dart';
import 'top_chat.dart';

class ChatConv extends StatefulWidget {
  const ChatConv({super.key});

  @override
  State<ChatConv> createState() => _ChatConvState();
}

class _ChatConvState extends State<ChatConv> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
              visible: controller.chatInConv.value,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: AppColors.whiteColor,
                child: SafeArea(
                  child: Stack(children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            TopChat(),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 15.h),
                              child: ListChatData(),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 9.h),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                                              fontFamily: AppTextStyles.Almarai,
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
                                                  homeController
                                                          .currentConv
                                                          .value
                                                          ?.business_account_id ??
                                                      "1",
                                                )
                                                    .then((_) {
                                                  setState(() {
                                                    // قم بتحديث الواجهة هنا فوراً بعد إضافة الرسالة
                                                    homeController.getChatData(
                                                      homeController
                                                              .currentConv
                                                              .value
                                                              ?.business_account_id ??
                                                          "1",
                                                    );
                                                  });
                                                }).catchError((error) {
                                                  print(
                                                      "Error adding chat: $error");
                                                });

                                                Future.delayed(
                                                    Duration(milliseconds: 400),
                                                    () {
                                                  setState(() {
                                                    homeController.getChatData(
                                                      homeController
                                                              .currentConv
                                                              .value
                                                              ?.business_account_id ??
                                                          "1",
                                                    );
                                                  });
                                                });

                                                Future.delayed(
                                                    Duration(milliseconds: 800),
                                                    () {
                                                  setState(() {
                                                    homeController.getChatData(
                                                      homeController
                                                              .currentConv
                                                              .value
                                                              ?.business_account_id ??
                                                          "1",
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
            ));
  }
}
