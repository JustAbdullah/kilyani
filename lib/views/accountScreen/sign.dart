import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/views/accountScreen/login.dart';
import 'package:kilyani_app/views/messages/message_successfully.dart';
import 'package:kilyani_app/views/messages/message_wait.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../BuseinssAccountScreen/create_new_account_buseiness.dart';
import '../homeScreen/homeWidgets/settingsWidget/terms.dart';

class Sign extends StatelessWidget {
  const Sign({super.key});

  @override
  Widget build(BuildContext context) {

    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // تحسين منطقة الشعار
                      Container(
                        height: 180.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.whiteColor,
                              AppColors.whiteColor,
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            ImagesPath.logo,
                            height: 120.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 30.h),
                      
                      // تحسين منطقة النصوص الترحيبية
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustom(
                              fontWeight: FontWeight.bold,
                              theText: "مرحبًا بك في منصة كليانى",
                              fontSizeWidth: 19.sp,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.TheMain,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "عزيزي المستخدم، هذه صفحة إنشاء حساب جديد. قم من فضلك بملء البيانات التالية",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeThree,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 40.h),
                      
                      // حقل اسم المستخدم
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormFiledCustom(
                                labelData: "اسم المستخدم".tr,
                                hintData: "لطفًا أدخل اسمك هنا".tr,
                                iconData: Icons.person_outline_rounded,
                                controllerData:
                                    homeController.nameInSingUPTextEdit,
                                value: (value) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.nameInSingUp = value.toString();
                                  return value;
                                },
                                fillColor: Colors.transparent,
                                hintColor: AppColors.balckColorTypeFour,
                                iconColor: AppColors.TheMain,
                                borderSideColor: Colors.transparent,
                                fontColor: AppColors.balckColorTypeThree,
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                autofillHints: [AutofillHints.name],
                                onChanged: (value) {
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.manual,
                                      overlays: []);
                                  homeController.nameInSingUp = value.toString();
                                  return value;
                                },
                                validator: (value) {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 20.h),
                      
                      // حقل كلمة المرور مع زر الإظهار/الإخفاء
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Obx(
                                () => TextFormField(
                                  controller:
                                      homeController.passwordInSingUPTextEdit,
                                  obscureText: !homeController.showPassword.value,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "كلمة المرور".tr,
                                    labelStyle: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour,
                                    ),
                                    hintText: "لطفًا أدخل كلمة المرور هنا".tr,
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: AppColors.TheMain,
                                      size: 22.sp,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        homeController.showPassword.toggle();
                                      },
                                      child: Icon(
                                        homeController.showPassword.value
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded,
                                        color: AppColors.balckColorTypeFour,
                                        size: 22.sp,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeThree,
                                  ),
                                  onChanged: (value) {
                                    homeController.passwordInSing = value;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 25.h),
                      
                      // رابط تسجيل الدخول
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "لديك حساب بالفعل؟ ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeThree,
                                ),
                              ),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    homeController.clearLoginOrSignUp();
                                    Get.to(Login());
                                  },
                                  child: Text(
                                    "قم بتسجيل الدخول الان",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.TheMain,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 40.h),
                      
                      // أزرار الإنشاء
                      Column(
                        children: [
                          // زر إنشاء حساب عادي
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Material(
          borderRadius: BorderRadius.circular(12),
                              elevation: 4,
                              child: InkWell(
                                onTap: () {
                                  homeController.checkTheAccount(
                                      homeController.nameInSingUp,
                                      homeController.passwordInSing);
                                },
                                borderRadius: BorderRadius.circular(30.r),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.TheMain,
                                        AppColors.TheMain,
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
          borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "إنشاء حساب جديد",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(height: 15.h),
                          
                          // زر إنشاء حساب تجاري
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Material(
                              borderRadius: BorderRadius.circular(30.r),
                              elevation: 4,
                              child: InkWell(
                                onTap: () {
                                  Get.to(CreateNewAcccountBuseinss());
                                },
                                borderRadius: BorderRadius.circular(30.r),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(
                                      color: AppColors.TheMain,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    "طلب الإنضمام كمتجر خاص",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.TheMain,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 30.h),
                      
                      // شروط وأحكام
                     Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "عند قيامك بإنشاء حساب فإنك توافق على",
        style: TextStyle(
          fontSize: 13.sp,
          fontFamily: AppTextStyles.Almarai,
          color: AppColors.balckColorTypeThree,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 4.h), // مسافة صغيرة بين السطرين
      InkWell(
        onTap: () {
          homeController.terms.value = true;
        },
        child: Text(
          "شروط وأحكام منصة كليانى",
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.TheMain,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
),
                      
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // باقي المكونات (بدون تغيير)
          MessageWait(),
          MessageSuccessfully(),
          GetX<HomeController>(
            builder: (controller) => Visibility(
              visible: controller.emptyLogin.value,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black54,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 48.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: Lottie.asset(ImagesPath.wearing,
                          width: 70.w, height: 70.h),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 115.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 45.w),
                        child: Text(
                          "عزيزي العميل هنالك قيم فارغة الرجاء,ملا البيانات بشكل كامل",
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
                          controller.emptyLogin.value = false;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 250.w,
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
                    ),
                  )
                ],
              ),
            ),
          ),
          GetX<HomeController>(
            builder: (controller) => Visibility(
              visible: controller.checkAccount.value,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black54,
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
                        padding: EdgeInsets.symmetric(horizontal: 45.w),
                        child: Text(
                          "عزيزي العميل الاسم مستخدم..قم رجاءًا بتغيير الاسم",
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
                          controller.checkAccount.value = false;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 250.w,
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
                    ),
                  )
                ],
              ),
            ),
          ),
          GetX<HomeController>(
            builder: (controller) => Visibility(
              visible: controller.errorLogin.value,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black54,
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
                        padding: EdgeInsets.symmetric(horizontal: 45.w),
                        child: Text(
                          "هنالك خطا في العملية,,الرجاء التاكد من البيانات والمحاولة لاحقًا",
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
                          controller.errorLogin.value = false;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 250.w,
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
                    ),
                  )
                ],
              ),
            ),
          ),
          Terms(),
        ],
      ),
    );
  }
}