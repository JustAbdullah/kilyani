import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/views/loadingScreen/loading_screen.dart';

import 'package:lottie/lottie.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../customWidgets/custom_container_api.dart';
import '../../../../customWidgets/custom_text.dart';
import '../../controllers/home_controller.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../accountScreen/login.dart';
import '../homeScreen/homeWidgets/settingsWidget/stores_terms.dart';
import '../messages/message_successfully.dart';
import '../messages/message_wait.dart';

class CreateNewAcccountBuseinss extends StatelessWidget {
  const CreateNewAcccountBuseinss({super.key});

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
                            height: 140.h,
                            child: Image.asset(
                              ImagesPath.logo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
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
                              "صفحة طلب الإنضمام كمتجر خاص",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: AppTextStyles.Almarai,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            )),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "رجاءًا قم بملا النموذج التالي للبيانات,,من أجل إنضمامك كمتجر رسمي في منصة كليانى",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeThree,
                              ),
                            )),
                        SizedBox(
                          height: 5.h,
                        ),
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
                                    labelData: "اسم المتجر".tr,
                                    hintData: "لطفًا ادخل اسم المتجر هنا".tr,
                                    iconData: Icons.person,
                                    controllerData:
                                        homeController.controllerTheOne,
                                    value: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.controllerTheOneText =
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
                                      homeController.controllerTheOneText =
                                          value.toString();
                                      return value;
                                    },
                                    validator: (value) {},
                                  ),
                                ))),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Material(
                                    elevation: 4,
                                    shadowColor: AppColors.TheMain,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      controller:
                                          homeController.controllerTheTwo,
                                      onChanged: (value) {
                                        SystemChrome.setEnabledSystemUIMode(
                                            SystemUiMode.manual,
                                            overlays: []);
                                        homeController.controllerTheTwoText =
                                            value.toString();
                                      },
                                      onSaved: (newValue) {
                                        SystemChrome.setEnabledSystemUIMode(
                                            SystemUiMode.manual,
                                            overlays: []);
                                        homeController.controllerTheOneText =
                                            newValue.toString();
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'اضف هنا وصف المتجر'.tr,
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
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide.none)),
                                      maxLines: 7,
                                      minLines: 5,
                                    ),
                                  ),
                                ))),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextCustom(
                                  theText: "إضافة لوجو المتجر:".tr,
                                  fontSizeWidth: 17,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontColor: AppColors.blackColorsTypeOne),
                              InkWell(
                                onTap: () async {
                                  homeController.pickImage();
                                },
                                child: GetX<HomeController>(
                                  builder: (controller) => ContainerCustomApi(
                                      colorContainer:
                                          controller.addImageWork.value == true
                                              ? Colors.green
                                              : AppColors.redColor,
                                      theBorderRadius: 35,
                                      heigthContainer: 30.h,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 37.h),
                                        child: Text(
                                          controller.addImageWork.value == true
                                              ? "تم إختيار صورة".tr
                                              : "لم يتم إختيار اي صورة".tr,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextFormFiledCustom(
                                    labelData: "اسم الدخول".tr,
                                    hintData: "لطفًا ادخل اسم الدخول".tr,
                                    iconData: Icons.person,
                                    controllerData:
                                        homeController.controllerTheThree,
                                    value: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.controllerTheThreeText =
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
                                      homeController.controllerTheThreeText =
                                          value.toString();
                                      return value;
                                    },
                                    validator: (value) {},
                                  ),
                                ))),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextFormFiledCustom(
                                    labelData: "رمز الدخول".tr,
                                    hintData: "لطفًا ادخل رمز الدخول".tr,
                                    iconData: Icons.lock,
                                    controllerData:
                                        homeController.controllerTheFour,
                                    value: (value) {
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: []);
                                      homeController.controllerTheFourText =
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
                                      homeController.controllerTheFourText =
                                          value.toString();
                                      return value;
                                    },
                                    validator: (value) {},
                                  ),
                                ))),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextCustom(
                                  theText: " الرخصة التجارية للمتجر:".tr,
                                  fontSizeWidth: 14,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontColor: AppColors.blackColorsTypeOne),
                              InkWell(
                                onTap: () async {
                                  homeController.pickImageOne();
                                },
                                child: GetX<HomeController>(
                                  builder: (controller) => ContainerCustomApi(
                                      colorContainer:
                                          controller.addImageWorkOne.value ==
                                                  true
                                              ? Colors.green
                                              : AppColors.redColor,
                                      theBorderRadius: 35,
                                      heigthContainer: 30.h,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 37.h),
                                        child: Text(
                                          controller.addImageWorkOne.value ==
                                                  true
                                              ? "تم إختيار صورة".tr
                                              : "لم يتم إختيار اي صورة".tr,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.w),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: InkWell(
                                onTap: () {
                                  homeController.uploadImageToServer();
                                  homeController.uploadImageToServerOne();
                                  homeController.askCreateAccountBusiness(
                                      homeController.controllerTheOneText,
                                      homeController.controllerTheTwoText,
                                      homeController.imageName,
                                      homeController.controllerTheThreeText,
                                      homeController.controllerTheFourText,
                                      homeController.imageNameOne);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 290.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.TheMain,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    "رفع طلب الإنضمام",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "بمجرد رفع طلبك فإنك توافق على",
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
                                homeController.storesTerms.value = true;
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
                                  Text(
                                    "اتفاقية المتاجر",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.TheMain,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          StoresTerms(),
          MessageWait(),
          MessageSuccessfully(),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Get.offAll(Login());
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Container(
                    alignment: Alignment.center,
                    width: 40.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: AppColors.TheMain,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        ImagesPath.arrow,
                        width: 45.w,
                        height: 45.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.waitAskBusiness.value,
                  child: Stack(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black45),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black45,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Lottie.asset(ImagesPath.loading,
                              width: 70.w, height: 70.h),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 70.h),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              "العملية تَتِم في الإرجاء..إنتظر قليلاً",
                              style: TextStyle(
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor,
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAskDone.value,
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
                          child: Lottie.asset(ImagesPath.successfully,
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
                              "عزيزي العميل تم بنجاح إتمام طلبك للإنضمام إلى منصة كليانى كمتجر رسمي,يتم مراجعة الطلب الان وسيتم إبلاغك في أقرب وقتم ممكن",
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
                                controller.isAskDone.value = false;

                                controller.clearController();
                                Get.offAll(LoadingScreen());
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
                  visible: controller.isNotAskDone.value,
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
                              "عزيزي العميل هنالك خطا في إتمام الطلب,الرجاء المحاولة لاحقًا",
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
                                controller.isNotAskDone.value = false;
                                controller.addImageWork.value = false;
                                controller.clearController();
                                //   Get.offAll(WelcomeScreen());
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
          StoresTerms(),
        ],
      ),
    );
  }
}
