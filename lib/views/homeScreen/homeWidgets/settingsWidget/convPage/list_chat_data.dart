import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import '../../../../../core/constant/images_path.dart';

// ignore: must_be_immutable
class ListChatData extends StatelessWidget {
  ListChatData({super.key});

  @override
  HomeController homeController = Get.put(HomeController());

  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.74,
        child: SingleChildScrollView(
            child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Obx(() {
                if (homeController.listOfTheChat.value.isEmpty) {
                  return Center(
                    child: Lottie.asset(ImagesPath.empty),
                  );
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.listOfTheChat.value.length,
                      itemBuilder: (context, index) {
                        final chat = homeController.listOfTheChat.value[index];
                        return Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.h),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    mainAxisAlignment: chat.howIsSend == 2
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                    crossAxisAlignment: chat.howIsSend == 2
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                          ),
                                          child: Text(
                                            chat.howIsSend == 2
                                                ? chat.BussName.toString()
                                                : "انا".toString(),
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.TheMain,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: chat.howIsSend == 2
                                                ? AppColors.whiteColorTypeThree
                                                : AppColors.TheMain,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 10.h),
                                          child: Text(
                                            chat.chatText.toString(),
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color: chat.howIsSend == 2
                                                  ? AppColors.balckColorTypeFour
                                                  : AppColors.whiteColor,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: chat.howIsSend == 2
                                                ? TextAlign.right
                                                : TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: chat.howIsSend == 2
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.end,
                                        crossAxisAlignment: chat.howIsSend == 2
                                            ? CrossAxisAlignment.start
                                            : CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            "تم التسليم في:",
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 12.2.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            chat.day.toString(),
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 12.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            "-",
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 12.2.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            chat.time.toString(),
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 12.2.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Image.asset(
                                            ImagesPath.theTrue,
                                            width: 10.w,
                                            height: 15.h,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Image.asset(
                                            ImagesPath.theTrue,
                                            width: 10.w,
                                            height: 15.h,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )));
                      });
                }
              })),
        )));
  }
}
