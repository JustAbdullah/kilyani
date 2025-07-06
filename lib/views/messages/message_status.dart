import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/views/accountScreen/sign.dart';
import 'package:lottie/lottie.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class MessageStatus extends StatelessWidget {
  const MessageStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.statusAuthAccount.value,
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
              color: Colors.black38,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black54,
            ),
            Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(ImagesPath.safeAccount,
                        width: 200.w, height: 200.h))),
            Padding(
              padding: EdgeInsets.only(bottom: 175.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.w),
                  child: Text(
                    "!..تنبية شديد الخطورة",
                    style: TextStyle(
                      height: 1.2.h,
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.yellowColor,
                      fontSize: 18.2.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 85.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.w),
                  child: Text(
                    "عزيزي العــميل إن حسابك غير موثق عليك تأمين وتوثيق حسابك..إن عدم القيام بذلك قد يؤدي إلى فقدان بياناتك وعدم القدرة على إستعادة حسابك او تاكيد ملكيتك له",
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
                padding: EdgeInsets.only(bottom: 15.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      controller.statusAuthAccount.value = false;
                      controller.isSendMessageAuthAccount.value = true;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 220.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: AppColors.TheMain,
                          borderRadius: BorderRadius.circular(30)),
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
                )),
          ],
        ),
      ),
    );
  }
}
