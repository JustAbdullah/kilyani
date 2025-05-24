import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:kilyani_app/core/data/model/products.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class ViewNewProduct extends StatelessWidget {
  const ViewNewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return _buildProductListSection(controller);
  }

  Widget _buildProductListSection(HomeController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
      child: FutureBuilder<List<Products>>(
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
    return controller.getDataProductsDatabaseLastest();
  }

  Widget _handleSnapshot(
      AsyncSnapshot<List<Products>> snapshot, HomeController controller) {
    if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
      return _buildErrorWidget();
    }
    return _buildHorizontalProductList(snapshot.data!, controller);
  }

  Widget _buildHorizontalProductList(
      List<Products> products, HomeController controller) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
        controller: controller,
      ),
    );
  }

  Widget _buildShimmerLoader() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
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

class ProductCard extends StatelessWidget {
  final Products product;
  final HomeController controller;

  const ProductCard({
    super.key,
    required this.product,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.viewProducDetails(product),
      child: Container(
        width: 150.w,
        height: 120.h, // تحديد ارتفاع الكرت
        margin: EdgeInsets.only(right: 10.w),
        decoration: _cardDecoration(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(imageUrl: product.img.toString()),
                ProductDetails(product: product),
              ],
            ),
            _PriceTag(price: product.price.toString()),
            _BusinessLogo(logoUrl: product.logoBuss),
            if (product.status == 2) const _StatusOverlay(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      );
}

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 80.h,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => const _ImagePlaceholder(),
        errorWidget: (context, url, error) => const _ImageError(),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Products product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductName(),
          SizedBox(height: 4.h),
          _buildProductDescription(),
        ],
      ),
    );
  }

  Widget _buildProductName() => Text(
        product.name.toString(),
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget _buildProductDescription() => Text(
        product.about.toString(),
        style: TextStyle(
          fontSize: 12.sp,
          fontFamily: 'Almarai',
          color: Colors.grey[600],
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );

  Widget _buildBusinessInfo() => Row(
        children: [
          Icon(Icons.store, size: 14.w, color: Colors.amber),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              product.nameBuss.toString(),
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Almarai',
                color: Colors.grey[600],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
}

class _PriceTag extends StatelessWidget {
  final String price;

  const _PriceTag({required this.price});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 10.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              price,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Almarai',
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(width: 2.w),
            Text(
              'أوقية',
              style: TextStyle(
                fontSize: 10.sp,
                fontFamily: 'Almarai',
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BusinessLogo extends StatelessWidget {
  final String logoUrl;

  const _BusinessLogo({required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      right: 10.w,
      child: CircleAvatar(
        radius: 16.r,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: logoUrl,
            width: 28.w,
            height: 28.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: Colors.grey[200]),
            errorWidget: (context, url, error) => Icon(
              Icons.business,
              size: 16.w,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusOverlay extends StatelessWidget {
  const _StatusOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Text(
            'غير متوفر',
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Almarai',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Icon(
          Icons.image,
          size: 40.w,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}

class _ImageError extends StatelessWidget {
  const _ImageError();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Icon(
          Icons.broken_image,
          size: 40.w,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}

class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            width: double.infinity,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 12.h, width: 100.w, color: Colors.white),
                SizedBox(height: 4.h),
                Container(height: 10.h, width: 80.w, color: Colors.white),
                SizedBox(height: 8.h),
                Container(height: 14.h, width: 60.w, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
