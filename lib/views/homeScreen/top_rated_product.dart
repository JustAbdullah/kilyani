import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:kilyani_app/core/data/model/products.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedProduct extends StatelessWidget {
  const TopRatedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
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
    return controller.getDataProductsDatabaseTopRated();
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
    return SizedBox(
      height: 170.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          controller: controller,
        ),
      ),
    );
  }

  Widget _buildShimmerLoader() {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: const ShimmerProductCard(),
        ),
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

class ProductCard extends StatelessWidget {
  final Products product;
  final HomeController controller;

  const ProductCard({
    Key? key,
    required this.product,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.viewProducDetails(product),
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: 170.w,
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

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 4.h),
        ),
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 100.h,
        width: double.infinity,
        fit: BoxFit.contain,
        placeholder: (context, url) => const _ImagePlaceholder(),
        errorWidget: (context, url, error) => const _ImageError(),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Products product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name.toString(),
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Almarai',
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            product.about.toString(),
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'Almarai',
              color: Colors.grey[600],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final String price;

  const _PriceTag({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 10.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              price,
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Almarai',
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              'أوقية',
              style: TextStyle(
                fontSize: 12.sp,
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

  const _BusinessLogo({Key? key, required this.logoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      right: 10.w,
      child: CircleAvatar(
        radius: 18.r,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: logoUrl,
            width: 32.w,
            height: 32.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: Colors.grey[200]),
            errorWidget: (context, url, error) => Icon(
              Icons.business,
              size: 18.w,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusOverlay extends StatelessWidget {
  const _StatusOverlay({Key? key}) : super(key: key);

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
  const _ImagePlaceholder({Key? key}) : super(key: key);

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
  const _ImageError({Key? key}) : super(key: key);

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
  const ShimmerProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
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
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 12.h, width: 100.w, color: Colors.grey[300]),
                SizedBox(height: 4.h),
                Container(height: 10.h, width: 80.w, color: Colors.grey[300]),
                SizedBox(height: 8.h),
                Container(height: 14.h, width: 60.w, color: Colors.grey[300]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
