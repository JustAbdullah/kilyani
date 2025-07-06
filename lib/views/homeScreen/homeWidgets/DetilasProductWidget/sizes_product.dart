import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/DetilasProductWidget/list_of_sizes.dart';

import '../../../../controllers/home_controller.dart';

class SizesProduct extends StatelessWidget {
  const SizesProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (controller) => Visibility(
            visible: controller.showTheSizeProduct.value,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35.h,
                  child: ListOFSizes(),
                ),
                SizedBox(
                  height: 5.h,
                )
              ],
            )));
  }
}
