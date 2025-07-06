import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/OrdersWidget/order_status_three.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/appcolors.dart';
import 'order_status_one.dart';
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
              child: Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: (){
                          controller.showDetialsOrder.value= false;
                        },
                        child: Icon(Icons.arrow_back_ios,color: AppColors.TheMain,size: 32.sp,),
                      ),
                      
                    ),
                  ),


               Padding(
                 padding:  EdgeInsets.symmetric(vertical: 25.h),
                 child: controller.currentOrder.value?.order_status.toString() == 1
                    ? OrdersStausOne()
                    : controller.currentOrder.value?.order_status.toString() == 2
                        ? OrdersStausTwo()
                        : OrdersStausThree(),
               ),
            ]))));
  }
}
