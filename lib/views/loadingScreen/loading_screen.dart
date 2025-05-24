import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.WhereGoingTheApp();
    return Scaffold(
      backgroundColor: AppColors.TheMain,
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 150.w,
            height: 150.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(ImagesPath.logoLoading),
                fit: BoxFit.cover, // لضبط الصورة داخل الدائرة
              ),
            ),
          ),
        ),
        PaddingCustom(
          theTop: 0,
          theBottom: 30,
          theLeft: 0,
          theRight: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextCustom(
              theText: "أنتظر قليلًا".tr,
              fontSizeWidth: 20,
              fontFamily: AppTextStyles.Almarai,
              fontColor: AppColors.whiteColor,
            ),
          ),
        )
      ]),
    );
  }
}
