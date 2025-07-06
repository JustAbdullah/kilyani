import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/core/constant/appcolors.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.addRatintProduct.value
              ? _buildRatingOverlay(controller)
              : const SizedBox.shrink(),
        ));
  }

  Widget _buildRatingOverlay(HomeController controller) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.black54,
          dismissible: false,
        ),
        Center(
          child: Material(
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              width: 320.w,
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDialogHeader(controller),
                  SizedBox(height: 24.h),
                  _buildStarRating(controller),
                  SizedBox(height: 24.h),
                  _buildReviewInput(controller),
                  SizedBox(height: 24.h),
                  _buildSubmitButton(controller),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDialogHeader(HomeController controller) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.close, size: 24.w),
          onPressed: () => _resetRatingForm(controller),
        ),
        Expanded(
          child: Text(
            "شاركنا رأيك",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStarRating(HomeController controller) {
    return Column(
      children: [
        Text(
          "كم نجمة تعطي لهذا المنتج؟",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              iconSize: 32.w, // حجم النجوم
              icon: Icon(
                controller.numberOfRating.value > index
                    ? Icons.star
                    : Icons.star_border,
                color: AppColors.yellowColor, // لون النجوم
              ),
              onPressed: () => controller.numberOfRating.value = index + 1,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildReviewInput(HomeController controller) {
    return TextFormField(
      controller: controller.controllerTheOne,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: "اكتب مراجعتك هنا...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.TheMain),
        ),
      ),
      onChanged: (value) => controller.theRatingText = value,
    );
  }

  Widget _buildSubmitButton(HomeController controller) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.TheMain,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: () => controller.addRating(
          controller.numberOfRating.value.toString(),
          controller.theRatingText,
          controller.currentProduct.value?.id.toString() ?? "",
        ),
        child: Text(
          "نشر التقييم",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  void _resetRatingForm(HomeController controller) {
    controller.addRatintProduct.value = false;
    controller.numberOfRating.value = 0;
    controller.theRatingText = "";
    controller.controllerTheOne.clear();
  }
}
