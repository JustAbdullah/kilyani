// widgets/product_image_section.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constant/appcolors.dart';

class ProductImageSection extends StatelessWidget {
  final String imageUrl;
  const ProductImageSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: MediaQuery.of(context).size.width,
      height: 200.h, // Increased height for better visual
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => _buildShimmerPlaceholder(),
      errorWidget: (context, url, error) => _buildErrorWidget(),
      imageBuilder: (context, imageProvider) =>
          _buildImageContainer(imageProvider),
    );
  }

  Widget _buildImageContainer(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade100,
      child: Container(color: AppColors.whiteColor),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey.shade50,
      child: Icon(
        Icons.error_outline,
        size: 50.w,
        color: Colors.grey.shade400,
      ),
    );
  }
}
