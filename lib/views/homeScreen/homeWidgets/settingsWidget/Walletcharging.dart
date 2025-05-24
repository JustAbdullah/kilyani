import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class WalletCharging extends StatelessWidget {
  const WalletCharging({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.walletCharge.value,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            // خلفية بسيطة بتدرج لوني خفيف
            body: Stack(
              children: [
                // الخلفية بتدرج لوني لطيف من أعلى لتحت
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
                ),

                // المحتوى الرئيسي في ScrollView
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // زر الإغلاق في أعلى اليمين
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              controller.walletCharge.value = false;
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.TheMain,
                                    AppColors.TheMain.withOpacity(0.8)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.close,
                                color: AppColors.whiteColor,
                                size: 24.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        // عنوان الصفحة
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            "شحن المحفظة",
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.TheMain,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        // بطاقة تفاصيل التحويل مع أيقونات لطيفة
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "تفاصيل التحويل",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.TheMain,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Icon(Icons.account_balance,
                                        color: AppColors.TheMain, size: 20.w),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "اسم البنك: بنكلي",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    Icon(Icons.account_balance_wallet,
                                        color: AppColors.TheMain, size: 20.w),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "رقم الحساب: 1011101110",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        // حقل إدخال رقم الحساب المحول منه مع تأثير Card
                        _buildTextField(
                          onChanged: (Value) {
                            controller.NumberOfAccount.text = Value;
                          },
                          label: "رقم الحساب المحول منه",
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 20.h),
                        // حقل إدخال المبلغ مع تصميم مشابه
                        _buildTextField(
                          onChanged: (Value) {
                            controller.priceCharge.text = Value;
                          },
                          label: "المبلغ",
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20.h),
                        // بطاقة تحميل صورة السند مع تأثير الضغط
                        Obx(() {
                          // إذا تم اختيار الصورة وتم تحميل بياناتها
                          if (controller.addImageWork.value &&
                              controller.imageBytes != null) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // عرض الصورة داخل بطاقة مع تقويس الحواف
                                Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.memory(
                                      controller.imageBytes!,
                                      height: 200.h,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                // أزرار تعديل وحذف الصورة
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // تعديل الصورة: إعادة اختيار صورة جديدة
                                        controller.pickImage();
                                      },
                                      icon: Icon(Icons.edit),
                                      label: Text("تعديل الصورة"),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // حذف الصورة: إعادة تعيين القيم
                                        controller.imageBytes = null;
                                        controller.addImageWork.value = false;
                                      },
                                      icon: Icon(Icons.delete),
                                      label: Text("حذف الصورة"),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                    ),
                                  ],
                                )
                              ],
                            );
                          } else {
                            // إذا لم يتم اختيار صورة، عرض البطاقة الأصلية مع أيقونة تحميل الصورة
                            return GestureDetector(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 30.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color: AppColors.TheMain.withOpacity(0.5),
                                    ),
                                    color: AppColors.TheMain.withOpacity(0.05),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.upload_file,
                                        color: AppColors.TheMain,
                                        size: 40.w,
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "تحميل صورة السند",
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.TheMain,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }),

                        SizedBox(height: 30.h),
                        // زر الإرسال بتصميم جذاب
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              // عرض مؤشر التحميل باستخدام rootNavigator
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierColor: Colors.black.withOpacity(0.3),
                                builder: (BuildContext dialogContext) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.TheMain,
                                    ),
                                  );
                                },
                              );

                              try {
                                // رفع الصورة أولاً
                                await controller.uploadImageToServer();

                                // ثم إضافة شحنة المحفظة
                                await controller.addCharge(
                                  accountNumber:
                                      controller.NumberOfAccount.text.trim(),
                                  transferredAmount: int.parse(
                                      controller.priceCharge.text.trim()),
                                  receiptPicture: controller.imageName,
                                );
                              } catch (error) {
                                // عرض رسالة خطأ باستخدام Get.snackbar
                                Get.snackbar(
                                  "خطأ",
                                  error.toString(),
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              } finally {
                                // إخفاء مؤشر التحميل باستخدام rootNavigator لضمان إخفاء الـ dialog فقط
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                // أو بدلاً من ذلك إذا كنت تستخدم GetX:
                                // Get.back();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              backgroundColor: AppColors.TheMain,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              elevation: 5,
                            ),
                            child: Text(
                              "إرسال",
                              style: TextStyle(
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// دالة لإنشاء حقل نصي داخل بطاقة مع تأثير ظل وحدود ناعمة
  Widget _buildTextField({
    required void Function(String)? onChanged,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextField(
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: AppColors.TheMain,
              fontSize: 16.sp,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
