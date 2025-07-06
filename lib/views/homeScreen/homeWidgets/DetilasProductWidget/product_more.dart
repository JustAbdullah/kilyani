import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/data/model/products.dart';
import '../../../../customWidgets/custom_text.dart';

class ProductMore extends StatelessWidget {
  const ProductMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return SizedBox(
      height: 140.h,
      child: FutureBuilder<List<Products>>(
        future: homeController.getDataProductsDatabaseBussinesMan(homeController.bussinesId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                width: 32.w,
                height: 32.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.8,
                  color: AppColors.TheMain,
                  backgroundColor: AppColors.TheMain.withOpacity(0.2),
                ),
              ),
            );
          } else if (snapshot.hasError ) {
            return Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.info_outline, size: 20.sp, color: AppColors.grey),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: TextCustom(
                        theText: "لا توجد منتجات أخرى متاحة",
                        fontSizeWidth: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            final products = snapshot.data!;
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: products.length,
              separatorBuilder: (context, index) => SizedBox(width: 18.w),
              itemBuilder: (context, index) {
                return ProductItem(
                  product: products[index],
                  controller: homeController,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Products product;
  final HomeController controller;

  const ProductItem({
    Key? key,
    required this.product,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {
            controller.clearInDetilasProduct();
            controller.viewProducDetails(product);
          },
          borderRadius: BorderRadius.circular(14),
          splashColor: AppColors.TheMain.withOpacity(0.1),
          highlightColor: AppColors.TheMain.withOpacity(0.05),
          child: Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.1),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // عرض صورة المنتج مع إطار أنيق
                Container(
                  width: 72.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.grey.withOpacity(0.15),
                      width: 0.8,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.img.toString(),
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: AppColors.grey.withOpacity(0.05),
                            child: Center(
                              child: Icon(
                                Icons.photo_library_outlined,
                                size: 26.sp,
                                color: AppColors.grey.withOpacity(0.3),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.grey.withOpacity(0.05),
                            child: Center(
                              child: Icon(
                                Icons.broken_image_outlined,
                                size: 26.sp,
                                color: AppColors.grey.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                        // طبقة التدرج للصورة
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.02),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // عرض اسم المنتج مع تنسيق أنيق
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Text(
                    product.name.toString(),
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.balckColorTypeFour,
                      height: 1.35,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4.h),
                // عرض سعر المنتج مع العملة (أوقية)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Text(
                    '${product.price.toString()} أوقية',
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.TheMain,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
