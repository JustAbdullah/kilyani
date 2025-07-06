import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_text.dart';

class OrdersStausThree extends StatelessWidget {
  const OrdersStausThree({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Stack(children: [
      Align(
          alignment: Alignment.topCenter,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1), // لون الظل
                              spreadRadius: 2, // انتشار الظل
                              blurRadius: 2, // انعكاس الظل
                              offset: Offset(0, 3), // انحراف الظل (الاتجاه)
                            ),
                          ],
                        ),
                        height: 70.h,
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 25.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            color: Colors.green[700],
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            "1",
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
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "السلة",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.blackColorTypeTeo,
                                          fontSize: 14.2.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 7.h),
                                    child: Container(
                                      width: 30.w,
                                      height: 1.7.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.TheMain,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 25.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            color: Colors.green[700],
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            "2",
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
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "الطلبية",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.blackColorTypeTeo,
                                          fontSize: 14.2.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 7.h),
                                    child: Container(
                                      width: 30.w,
                                      height: 1.7.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.TheMain,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 25.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            color: Colors.green[700],
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            "3",
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
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "موعد الوصول",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.blackColorTypeTeo,
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 7.h),
                                    child: Container(
                                      width: 30.w,
                                      height: 1.7.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.TheMain,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 25.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.yellowColor,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            "4",
                                            style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "الإنهاء",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.blackColorTypeTeo,
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )
                                ])),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 220.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: AppColors.blackColorTypeTeo,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "تــفاصيل موعد الإيصال",
                      style: TextStyle(
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.whiteColor,
                        fontSize: 17.2.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "رقم الطــلبية:",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            controller.currentOrder.value?.order_number
                                    .toString() ??
                                "",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.TheMain,
                              fontSize: 19.2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "تاريخ الطــلبية:",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            controller.currentOrder.value?.date_order_user
                                    .toString() ??
                                "",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "وقت الطلبية:",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            controller.currentOrder.value?.time_order_user
                                    .toString() ??
                                "",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "إجمالي السعر:",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            controller.currentOrder.value?.total.toString() ??
                                "",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.TheMain,
                              fontSize: 19.2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text(
                              "أوقية",
                              style: TextStyle(
                                fontFamily: AppTextStyles.Almarai,
                                color: Color.fromARGB(255, 83, 82, 82),
                                fontSize: 12.2.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "موقع التسليم :",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            controller.address.value.toString(),
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.TheMain,
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "موعد تسليم الطلبية:",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            controller.currentOrder.value?.day_get_order
                                    .toString() ??
                                "",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.TheMain,
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1.1.h,
                      color: const Color.fromARGB(255, 80, 80, 80),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "تــفاصيل المتجر",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 48, 48, 48),
                              fontSize: 18.2.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "هوية المـتجر:",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CachedNetworkImage(
                                  width: 40.w,
                                  height: 40.h,
                                  fit: BoxFit.cover,
                                  imageUrl: controller
                                          .currentOrder.value?.logoBuss
                                          .toString() ??
                                      "",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                  placeholder: (context, url) => SizedBox(
                                      child: ContainerCustom(
                                          colorContainer: AppColors.TheMain,
                                          heigthContainer: 30.h,
                                          widthContainer: 30.w,
                                          child: TextCustom(
                                            theText: "كليانى",
                                            fontSizeWidth: 10,
                                            fontFamily: AppTextStyles.Marhey,
                                            fontColor: AppColors.whiteColor,
                                          )))),
                              Text(
                                controller.currentOrder.value?.nameBuss
                                        .toString() ??
                                    "no",
                                style: TextStyle(
                                  fontFamily: AppTextStyles.Almarai,
                                  color: const Color.fromARGB(255, 236, 185, 0),
                                  fontSize: 12.2.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "وصف المتجر:",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Color.fromARGB(255, 83, 82, 82),
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      controller.currentOrder.value?.description.toString() ??
                          "",
                      style: TextStyle(
                        fontFamily: AppTextStyles.Almarai,
                        color: Color.fromARGB(255, 83, 82, 82),
                        fontSize: 13.2.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1.1.h,
                      color: const Color.fromARGB(255, 80, 80, 80),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "سيتم تسليم الطلبية في اليوم المحدد,,احرص على التواجد وإستلام الطلبية",
                      style: TextStyle(
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.redColor,
                        fontSize: 15.2.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                ]),
              ))),
      Padding(
        padding: EdgeInsets.only(bottom: 0.0.h),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              controller.getDataBasketOrder(
                  controller.currentOrder.value?.specialCode);
              controller.showBasketOrder.value = true;
            },
            child: Container(
              alignment: Alignment.center,
              width: 280.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: AppColors.TheMain,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "إظهار محتويات الطـلبية",
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
      ),
    ]);
  }
}
