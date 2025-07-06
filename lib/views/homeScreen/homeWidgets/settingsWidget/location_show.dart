import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class LocationShow extends StatelessWidget {
  const LocationShow({super.key});

  @override
  Widget build(BuildContext context) {

    return GetX<HomeController>(
      builder: (controller) {
        if (!controller.locationShow.value) return const SizedBox.shrink();

        return _buildLocationDialog(context, controller);
      },
    );
  }

  Widget _buildLocationDialog(BuildContext context, HomeController controller) {
    return Stack(
      children: [
        // طبقة التعتيم الخلفية
        _buildBackgroundOverlay(),

        // محتوى النافذة الرئيسية
        _buildMainContent(context, controller),

        // حالات التحميل والرسائل
        _buildLoadingState(controller, context),
        _buildNoLocationState(controller, context),
        _buildServiceDisabledState(controller, context),
        _buildPermissionDeniedState(controller, context),
        _buildSuccessState(controller, context),
      ],
    );
  }

  Widget _buildBackgroundOverlay() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.7),
    );
  }

  Widget _buildMainContent(BuildContext context, HomeController controller) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.95,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // رأس النافذة
              _buildHeader(controller),
              SizedBox(height: 20.h),

              // عنوان الصفحة
              _buildTitle(),
              SizedBox(height: 30.h),

              // نص التوجيهات
              _buildInstructions(),
              SizedBox(height: 20.h),

              // رسائل التنبيه
              _buildWarningMessages(),
              SizedBox(height: 30.h),

              // صورة التحريك
              _buildLocationAnimation(),
              SizedBox(height: 30.h),

              // زر الحصول على الموقع
              _buildGetLocationButton(controller),
              SizedBox(height: 20.h),

              // زر عرض الموقع
              _buildShowLocationButton(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(HomeController controller) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(Icons.close, size: 30.sp, color: AppColors.TheMain),
        onPressed: () => controller.locationShow.value = false,
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.TheMain,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "موقعك الجغرافي",
        style: TextStyle(
          fontFamily: AppTextStyles.Almarai,
          color: AppColors.whiteColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInstructions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Text(
        "يتم تحديد موقعك الجغرافي تلقائيًا وبشكل فوري لضمان وصول الطلبات إليك بدقة",
        style: TextStyle(
          fontFamily: AppTextStyles.Almarai,
          color: AppColors.balckColorTypeFour,
          fontSize: 16.sp,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildWarningMessages() {
    return Column(
      children: [
        _buildWarningMessage(
          "ملاحظة: نحن نحترم خصوصيتك ولا نخزن أو نستخدم بيانات موقعك لأي أغراض أخرى غير توصيل الطلبات",
          AppColors.redColor,
        ),
        SizedBox(height: 15.h),
        _buildWarningMessage(
          "إذا كان الموقع غير دقيق، يرجى المحاولة لاحقًا مع التأكد من تواجدك في المكان الصحيح",
          AppColors.redColor,
        ),
      ],
    );
  }

  Widget _buildWarningMessage(String text, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_rounded, size: 18.sp, color: color),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                color: color,
                fontSize: 14.sp,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationAnimation() {
    return SizedBox(
      height: 200.h,
      child: Lottie.asset(
        ImagesPath.locationAni,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildGetLocationButton(HomeController controller) {
    return Obx(() {
      return controller.isLoadingLocation.value
          ? CircularProgressIndicator(
              color: AppColors.TheMain,
              strokeWidth: 3.w,
            )
          : ElevatedButton(
              onPressed: () async {
                final hasPermission =
                    await controller.ensureLocationPermission();
                if (!hasPermission) return;

                final serviceEnabled =
                    await controller.isLocationServiceEnabled();
                if (!serviceEnabled) {
                  await Get.dialog(
                    AlertDialog(
                      title: Text("تفعيل خدمة الموقع"),
                      content: Text("يجب تفعيل خدمة الموقع للمتابعة"),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text("إلغاء"),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                            Geolocator.openLocationSettings();
                          },
                          child: Text("فتح الإعدادات"),
                        ),
                      ],
                    ),
                  );
                  return;
                }

                await controller.fetchCurrentLocation();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellowColor,
                minimumSize: Size(200.w, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 5,
                shadowColor: AppColors.TheMain.withOpacity(0.3),
              ),
              child: Text(
                "تحديد الموقع الحالي",
                style: TextStyle(
                  fontFamily: AppTextStyles.Cairo,
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
    });
  }

  Widget _buildShowLocationButton(HomeController controller) {
    return TextButton(
      onPressed: () {
        if (controller.address.value == 'لايوجد عنوان') {
          controller.noLocation.value = true;
        } else {
          controller.showTheLocationInTheMap.value = true;
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: AppColors.balckColorTypeFour,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        "عرض الموقع على الخريطة",
        style: TextStyle(
          fontFamily: AppTextStyles.Almarai,
          color: AppColors.whiteColor,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  // --- حالات الرسائل المختلفة ---

  Widget _buildLoadingState(HomeController controller, BuildContext context) {
    return Visibility(
      visible: controller.checkTheLocation.value,
      child: _buildMessageDialog(
          Lottie.asset(ImagesPath.loading, width: 100.w, height: 100.h),
          "جاري تحديد موقعك... يرجى الانتظار",
          null,
          context),
    );
  }

  Widget _buildNoLocationState(
      HomeController controller, BuildContext context) {
    return Visibility(
      visible: controller.noLocation.value,
      child: _buildMessageDialog(
          Lottie.asset(ImagesPath.wearing, width: 100.w, height: 100.h),
          "لم يتم تحديد موقعك بعد، يرجى تحديد الموقع أولاً",
          () => controller.noLocation.value = false,
          context),
    );
  }

  Widget _buildServiceDisabledState(
      HomeController controller, BuildContext context) {
    return Visibility(
      visible: controller.MessageAboutLocationServiceEnable.value,
      child: _buildMessageDialog(
          Lottie.asset(ImagesPath.wearing, width: 100.w, height: 100.h),
          "خدمة الموقع غير مفعلة على جهازك، يرجى تفعيلها أولاً",
          () => controller.MessageAboutLocationServiceEnable.value = false,
          context),
    );
  }

  Widget _buildPermissionDeniedState(
      HomeController controller, BuildContext context) {
    return Visibility(
      visible: controller.IsrequestPermissionDenied.value,
      child: _buildMessageDialog(
          Lottie.asset(ImagesPath.error, width: 100.w, height: 100.h),
          "يجب منح إذن الوصول إلى الموقع لتتمكن من استخدام هذه الميزة",
          () => controller.IsrequestPermissionDenied.value = false,
          context),
    );
  }

  Widget _buildSuccessState(HomeController controller, BuildContext context) {
    return Visibility(
      visible: controller.isVerificationLocationCompleted.value,
      child: _buildMessageDialog(
          Lottie.asset(ImagesPath.successfully, width: 100.w, height: 100.h),
          "تم تحديد موقعك بنجاح! يمكنك الآن متابعة طلبك", () {
        controller.isVerificationLocationCompleted.value = false;
        controller.locationShow.value = false;
      }, context),
    );
  }

  Widget _buildMessageDialog(Widget animation, String message,
      VoidCallback? onClose, BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            animation,
            SizedBox(height: 20.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTextStyles.Almarai,
                fontSize: 16.sp,
                height: 1.5,
              ),
            ),
            if (onClose != null) ...[
              SizedBox(height: 25.h),
              ElevatedButton(
                onPressed: onClose,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.TheMain,
                  minimumSize: Size(150.w, 45.h),
                ),
                child: Text("حسناً", style: TextStyle(fontSize: 16.sp)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
