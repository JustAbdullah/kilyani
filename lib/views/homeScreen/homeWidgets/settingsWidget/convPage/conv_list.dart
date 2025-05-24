import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../controllers/home_controller.dart';
import '../../../../../core/constant/app_text_styles.dart';
import '../../../../../core/constant/appcolors.dart';
import '../../../../../core/constant/images_path.dart';

class ConvList extends StatefulWidget {
  const ConvList({super.key});

  @override
  State<ConvList> createState() => _ConvListState();
}

class _ConvListState extends State<ConvList> {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.pageConv.value,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.TheMain,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {
                  controller.pageConv.value = false;
                },
              ),
              title: Text(
                "المحادثات",
                style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.whiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(10.w),
              child: Obx(() {
                if (controller.listOfConv.value.isEmpty) {
                  return Center(
                    child: Lottie.asset(ImagesPath.empty),
                  );
                } else {
                  return ListView.separated(
                    itemCount: controller.listOfConv.value.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h),
                    itemBuilder: (context, index) {
                      final conv = controller.listOfConv.value[index];
                      return InkWell(
                        onTap: () {
                          // تنظيف القائمة الحالية للمحادثات ومن ثم الانتقال للمحادثة
                          controller.listOfTheChat.value.clear();
                          Future.delayed(const Duration(milliseconds: 10), () {
                            setState(() {});
                            controller.viewConv(conv);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.whiteColor,
                                AppColors.TheMain.withOpacity(0.1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 12.h),
                            child: Row(
                              children: [
                                // الصورة الدائرية مع تأثير الحدود والظل
                                CachedNetworkImage(
                                  imageUrl: conv.logoBuss,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 60.w,
                                    height: 60.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                      border: Border.all(
                                        color: AppColors.TheMain,
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  placeholder: (context, url) => CircleAvatar(
                                    radius: 30.w,
                                    backgroundColor: AppColors.TheMain,
                                    child: Text(
                                      conv.nameBuss
                                          .substring(0, 1)
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        fontSize: 20.sp,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      CircleAvatar(
                                    radius: 30.w,
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.error,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        conv.nameBuss,
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.balckColorTypeFour,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        "رسالة جديدة", // يمكن استبدالها بمحتوى الرسالة إن وُجد
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[600],
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18.w,
                                  color: AppColors.TheMain,
                                )
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
          ),
        ),
      ),
    );
  }
}
