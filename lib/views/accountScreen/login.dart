import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/views/accountScreen/forget_password.dart';
import 'package:kilyani_app/views/accountScreen/sign.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/settingsWidget/terms.dart';
import 'package:kilyani_app/views/messages/message_successfully.dart';
import 'package:kilyani_app/views/messages/message_wait.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/custome_textfiled.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                  padding: EdgeInsets.symmetric(horizontal: 00.w),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 150.h,
                            child: Image.asset(
                              ImagesPath.logo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: TextCustom(
                              fontWeight: FontWeight.bold,
                              theText: "مرحبًا بك",
                              fontSizeWidth: 17.sp,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.TheMain,
                            )),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "عزيزي المستخدم,هذه صفحة تسجيل الدخول",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeThree,
                              ),
                            )),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "قم من فضلك بملاء البيانات التالية ",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeThree,
                              ),
                            )),
                        SizedBox(
                          height: 50.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextFormFiledCustom(
                                    labelData: "اسم المستخدم".tr,
                                    hintData: "لطفًا أدخل اسمك هنا".tr,
                                    iconData: Icons.person,
                                    controllerData:
                                        homeController.nameInSingUPTextEdit,
                                    value: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.nameInSingUp =
                                          value.toString();
                                      return value;
                                    },
                                    fillColor:
                                        Color.fromARGB(255, 244, 244, 244),
                                    hintColor: AppColors.TheMain,
                                    iconColor: AppColors.TheMain,
                                    borderSideColor:
                                        Color.fromARGB(255, 244, 244, 244),
                                    fontColor: AppColors.TheMain,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    autofillHints: [AutofillHints.name],
                                    onChanged: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.nameInSingUp =
                                          value.toString();
                                      return value;
                                    },
                                    validator: (value) {},
                                  ),
                                ))),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextFormFiledCustom(
                                    labelData: "كلمة المرور".tr,
                                    hintData: "لطفًا أدخل كلمة المرور هنا".tr,
                                    iconData: Icons.lock,
                                    controllerData:
                                        homeController.passwordInSingUPTextEdit,
                                    value: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.passwordInSing =
                                          value.toString();
                                      return value;
                                    },
                                    fillColor:
                                        Color.fromARGB(255, 244, 244, 244),
                                    hintColor: AppColors.TheMain,
                                    iconColor: AppColors.TheMain,
                                    borderSideColor:
                                        Color.fromARGB(255, 244, 244, 244),
                                    fontColor: AppColors.TheMain,
                                    obscureText: true,
                                    keyboardType: TextInputType.name,
                                    autofillHints: [AutofillHints.name],
                                    onChanged: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.passwordInSing =
                                          value.toString();
                                      return value;
                                    },
                                    validator: (value) {},
                                  ),
                                ))),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "لاتمتلك حساب؟",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeThree,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            InkWell(
                              onTap: () {
                                homeController.clearLoginOrSignUp();
                                Get.to(Sign());
                              },
                              child: Text(
                                textAlign: TextAlign.center,
                                "قم بإنشاء واحد الان",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 255, 166, 0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.w),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: InkWell(
                                onTap: () {
                                  homeController.loginUser(
                                      homeController.nameInSingUp,
                                      homeController.passwordInSing);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 290.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColorTypeTeo,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "عزيزي العميل نوصيك دائمًا بقراءة",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeThree,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: InkWell(
                                onTap: () {
                                  homeController.terms.value = true;
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "شروط واحكام",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        homeController.terms.value = true;
                                      },
                                      child: Text(
                                        "منصة كليانى",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.TheMain,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ))),
                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "نسيت كلمة المرور؟",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.redColor,
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            InkWell(
                              onTap: () {
                                homeController.ForgetThePasswordPage.value =
                                    true;
                              },
                              child: Text(
                                textAlign: TextAlign.center,
                                "إجراء عملية الإستعادة",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: Color.fromARGB(255, 255, 166, 0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black54,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black26,
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
                          ))
                    ],
                  ))),
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black54,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black26,
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
                          ))
                    ],
                  ))),
          ForgetThePassword(),
          Terms(),
        ],
      ),
    );
  }
}
