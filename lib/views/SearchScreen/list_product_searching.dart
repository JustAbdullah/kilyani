import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/images_path.dart';
import '../../core/data/model/products.dart';
import '../homeScreen/homeWidgets/view_new_product.dart';

class ListProductSearching extends StatelessWidget {
  const ListProductSearching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return _buildProductListSection(controller);
  }

  Widget _buildProductListSection(HomeController controller) {
    return GetX<HomeController>(
      builder: (_) => FutureBuilder<List<Products>>(
        future: _getProductsData(controller),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerLoader();
          }
          return _handleSnapshot(snapshot, controller);
        },
      ),
    );
  }

  Future<List<Products>> _getProductsData(HomeController controller) {
    return controller.isSearching.value
        ? controller.getDataProductsDatabaseSearch(
            controller.typeIdProduct.value.toString(),
            controller.searching,
          )
        : controller.getDataProductsDatabase(
            controller.typeIdProduct.value.toString(),
          );
  }

  Widget _handleSnapshot(
      AsyncSnapshot<List<Products>> snapshot, HomeController controller) {
    if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
      return _buildErrorWidget();
    }
    return _buildGridProductList(snapshot.data!, controller);
  }

  Widget _buildGridProductList(
      List<Products> products, HomeController controller) {
    return GridView.builder(
      shrinkWrap: true, // يسمح بحساب ارتفاع القائمة تلقائيًا بناءً على محتواها
      physics:
          const NeverScrollableScrollPhysics(), // منع تمرير القائمة بشكل مستقل
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        mainAxisSpacing: 10.h, // التباعد الرأسي
        crossAxisSpacing: 10.w, // التباعد الأفقي
        childAspectRatio: 0.8, // نسبة الطول إلى العرض لجميع الكروت
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
        controller: controller,
      ),
    );
  }

  Widget _buildShimmerLoader() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.8,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: const ShimmerProductCard(),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            ImagesPath.empty,
            width: 250.w,
            height: 250.h,
          ),
          SizedBox(height: 10.h),
          Text(
            'لا توجد منتجات متاحة',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Almarai',
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
