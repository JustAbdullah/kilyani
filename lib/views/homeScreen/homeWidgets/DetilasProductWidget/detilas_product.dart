// main_product_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/button_add.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/colors_product.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/colors_product_arrow.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/product_details.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/product_more.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/sizes_product.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/sizes_product_arrow.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/totail_price.dart';

import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import 'app_bar_section.dart';
import 'message_business.dart';
import 'message_erorr.dart';
import 'message_wearing_colors.dart';
import 'message_wearing_sizes.dart';
import 'product_image_section.dart';
import 'rating_list.dart';
import 'wait_add.dart';
import 'add_done.dart';

class DetilasProduct extends StatelessWidget {
  const DetilasProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Visibility(
          visible: controller.showDetialsProduct.value,
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const AppBarSection(),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductImageSection(
                                  imageUrl:
                                      controller.currentProduct.value?.img ??
                                          ""),
                              const ProductDetailsSection(),
                              const SizesProductArrow(),
                              const SizesProduct(),
                              SizedBox(
                                height: 5.h,
                              ),
                              const ColorsProsuctArrow(),
                              const ColorsProduct(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text(
                                      "منتـجات هذا المتجر",
                                      style: TextStyle(
                                        fontSize: 16.2.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.blackColor,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              const ProductMore(),
                            ],
                          ),
                        ),
                      ),
                      ButtonAdd(),
                    ],
                  ),
                  const OverlayMessagesSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OverlayMessagesSection extends StatelessWidget {
  const OverlayMessagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        MessageWearingSizes(),
        MessageWearingColors(),
        WaitAdd(),
        AddDone(),
        MessageError(),
        MessageBussines(),
        RatingList(),
      ],
    );
  }
}
