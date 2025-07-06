import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import '../core/constant/appcolors.dart';
class SendNo extends StatelessWidget {
  const SendNo({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                homeController.sendTheNotification(
                    "إرسال إشعار", "تجربة إرسال الإشعار");
              },
              child: Container(
                width: 100.w,
                height: 200.h,
                decoration: BoxDecoration(
                  color: AppColors.TheMain,
                ),
                child: Text("Send"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
