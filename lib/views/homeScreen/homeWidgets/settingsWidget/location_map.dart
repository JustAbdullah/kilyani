// ShowTheLocationInMap.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../controllers/home_controller.dart';

class ShowTheLocationInMap extends StatelessWidget {
  const ShowTheLocationInMap({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        // إذا كان false، لا نعرض أي واجهة
        if (!controller.showTheLocationInTheMap.value) {
          return const SizedBox.shrink();
        }

        return Stack(
          children: [
            // 1) الخلفية نصف شفافة
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  controller.showTheLocationInTheMap.value = false;
                },
                child: Container(color: Colors.black38),
              ),
            ),

            // 2) النافذة المنبثقة متمركزة
            Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 320.w,
                  height: 520.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // ======= رأس الواجهة: زر الإغلاق + العنوان =======
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // مساحة فارغة لنوازن المساحة
                            SizedBox(width: 24.w),

                            // عنوان الواجهة
                            Text(
                              "موقعك على الخريطة".tr,
                              style: TextStyle(
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.balckColorTypeFour,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            // زر الإغلاق الدائري
                            InkWell(
                              onTap: () {
                                controller.showTheLocationInTheMap.value =
                                    false;
                              },
                              borderRadius: BorderRadius.circular(12.r),
                              child: Container(
                                width: 24.w,
                                height: 24.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.redColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: 16.w,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // فاصل خفيف
                      Divider(height: 1, color: Colors.grey[300]),

                      SizedBox(height: 8.h),

                      // ======= الجزء الخاص بالخريطة =======
                      Container(
                        width: double.infinity,
                        height: 300.h,
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border:
                              Border.all(color: Colors.grey[300]!, width: 1),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: FlutterMap(
                          // =================================================
                          // الملاحظة الأهم: هنا هتأكّد من أنَّ حقل longitude اسمه فعلاً
                          // “lng” في الـ users model. إذا كان مختلفًا، عوّض هنا نفس الاسم.
                          // =================================================
                          options: MapOptions(
                            initialCenter: LatLng(
                              controller.users!.value.lat,
                              controller.users!.value
                                  .log, // تأكد أنّ الاسم هنا مطابق للنموذج
                            ),
                            initialZoom: 15.0,
                          ),
                          children: [
                            // طبقة البلاط (Tiles) من OSM
                            TileLayer(
                              urlTemplate:
                                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: const ['a', 'b', 'c'],
                            ),

                            // طبقة الماركر
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(
                                    controller.users!.value.lat,
                                    controller.users!.value.log,
                                  ),
                                  width: 40.w,
                                  height: 40.h,
                                  // هنا استخدمنا child بدل builder
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 32.w,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                      // ======= نص إرشادي أسفل الخريطة =======
                     

                      SizedBox(height: 8.h),

                      // ======= زر تأكيد الموقع =======
                    
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
