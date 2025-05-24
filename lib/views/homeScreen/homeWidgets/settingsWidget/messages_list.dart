import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.messageList.value,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Column(
            children: [
              // Header with Gradient and Shadow
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.TheMain,
                      AppColors.TheMain.withOpacity(0.8)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Back Button with Icon
                    InkWell(
                      onTap: () {
                        controller.messageList.value = false;
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.whiteColor,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    // Title
                    Text(
                      "الرسائل والتنبيهات",
                      style: TextStyle(
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.whiteColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Messages List
              Expanded(
                child: Obx(() {
                  if (controller.listofMessages.value.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            ImagesPath.empty,
                            width: 200.w,
                            height: 200.h,
                          ),
                          Text(
                            "لا توجد رسائل",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.blackColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      itemCount: controller.listofMessages.value.length,
                      itemBuilder: (context, index) {
                        final message = controller.listofMessages.value[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () {
                              // Add any action when a message is tapped
                            },
                            child: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Message Header (Title and Date)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        message.message_name,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.blackColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        message.date_message,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  // Message Description
                                  Text(
                                    message.message_description,
                                    style: TextStyle(
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  // Read Status Indicator
                                  Container(
                                    width: double.infinity,
                                    height: 2.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          message.is_read == "2"
                                              ? Colors.green
                                              : AppColors.yellowColor,
                                          message.is_read == "2"
                                              ? Colors.green.withOpacity(0.5)
                                              : AppColors.yellowColor
                                                  .withOpacity(0.5),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
