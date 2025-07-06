import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/data/model/products.dart';
import '../../../../customWidgets/custom_text.dart';

class BusinessPageProductMore extends StatelessWidget {
  const BusinessPageProductMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 170.h,
      child: FutureBuilder<List<Products>>(
        future: homeController.getDataProductsDatabaseBussinesMan(
            homeController.idBusinessInPage),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.TheMain,
              ),
            );
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return Center(
              child: TextCustom(
                theText: "لا يملك هذا المتجر أي منتجات",
                fontSizeWidth: 13.2.sp,
                fontWeight: FontWeight.bold,
                fontFamily: AppTextStyles.Almarai,
                fontColor: AppColors.redColor,
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final Products product = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    homeController.clearInDetilasProduct();
                    homeController.viewProducDetails(product);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: _ProductCard(product: product),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Products product;

  const _ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // عرض صورة المنتج مع تأثير Hero لجعل الانتقال سلساً وإبداعياً
          Hero(
            tag: 'product-${product.id}', // تأكد أن للموديل الخاص بك حقل (id)
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: product.img.toString(),
                width: 90.w,
                height: 90.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 90.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: AppColors.TheMain.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextCustom(
                      theText: "تحميل...",
                      fontSizeWidth: 10,
                      fontFamily: AppTextStyles.Marhey,
                      fontColor: AppColors.whiteColor,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 90.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // عرض اسم المنتج بنص واضح ومركز
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              product.name.toString(),
              style: TextStyle(
                fontSize: 12.2.sp,
                fontWeight: FontWeight.bold,
                fontFamily: AppTextStyles.Almarai,
                color: AppColors.balckColorTypeFour,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4.h),
          // إذا كان السعر موجودًا، يمكن عرضه بوسم بسيط (يمكنك إزالته إن لم يكن ضروريًا)
          if (product.price != null)
            Container(
              margin: EdgeInsets.only(top: 4.h),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.TheMain,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "${product.price} أوقية",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: AppTextStyles.Almarai,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
