import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class InfoAccount extends StatelessWidget {
  const InfoAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.infoAccount.value,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.black.withOpacity(0.5),
            body: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // البطاقة الرئيسية مع تأثيرات الظل والتدرج
                  Container(
                    margin: EdgeInsets.only(
                        top: 50.h), // ترك مساحة للأيقونة الدائرية
                    width: 350.w,
                    padding: EdgeInsets.only(
                      top: 60.h,
                      left: 20.w,
                      right: 20.w,
                      bottom: 20.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.TheMain,
                          AppColors.TheMain.withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10.h),
                        Text(
                          "المعلومات العامة",
                          style: TextStyle(
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Divider(
                          color: Colors.white70,
                          thickness: 1.5,
                          height: 20.h,
                          indent: 20.w,
                          endIndent: 20.w,
                        ),
                        _buildInfoRow(
                          "اسم المستخدم:",
                          controller.users!.value.user_name ?? "",
                        ),
                        SizedBox(height: 12.h),
                        _buildInfoRow(
                          "رقم الهاتف:",
                          controller.users!.value.user_phone,
                        ),
                        SizedBox(height: 12.h),
                        _buildInfoRow(
                          "كود التسويق:",
                          controller.users!.value.code,
                        ),
                        SizedBox(height: 12.h),
                        _buildInfoRow(
                          "إجمالي المبالغ:",
                          controller.users!.value.amount.toString(),
                        ),
                      ],
                    ),
                  ),
                  // أيقونة صورة المستخدم (شعار ثابت) تظهر في أعلى البطاقة
                  Positioned(
                    top: 0,
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundColor: AppColors.TheMain,
                      child:
                          Icon(Icons.person, color: Colors.white, size: 38.sp),
                    ),
                  ),
                  // زر الإغلاق في أعلى اليمين لإغلاق البطاقة
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: InkWell(
                      onTap: () {
                        controller.infoAccount.value = false;
                      },
                      child: Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.close,
                          color: AppColors.TheMain,
                          size: 20.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// دالة لبناء صف المعلومات بشكل متناسق
  Widget _buildInfoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            value,
            style: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
