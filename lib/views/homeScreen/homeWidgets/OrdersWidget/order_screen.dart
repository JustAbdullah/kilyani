import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/core/constant/images_path.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/OrdersWidget/order_status_one.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/OrdersWidget/order_status_three.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_text.dart';
import 'order_status_two.dart';

class OrderTheScreen extends StatelessWidget {
  const OrderTheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showDetialsOrder.value,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.90,
              color: Colors.white,
              child: controller.currentOrder.value?.order_status.toString() == 1
                  ? OrdersStausOne()
                  : controller.currentOrder.value?.order_status.toString() == 2
                      ? OrdersStausTwo()
                      : OrdersStausThree(),
            )));
  }
}
