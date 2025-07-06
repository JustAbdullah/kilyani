import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../customWidgets/search_text_filed.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: GetX<HomeController>(
        builder: (controller) => TextFormFiledCustomSearch(
          labelData: "ابحث عن الاسم هنا".tr,
          hintData: "قم لطفًا بإدخال الاسم".tr,
          iconData: controller.isSearching.value ? Icons.close : Icons.search,
          controllerData: controller.searchingControllr,
          value: (value) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: []);
            controller.searching = value.toString();
            return value;
          },
          fillColor: const Color.fromARGB(255, 244, 244, 244),
          hintColor: AppColors.TheMain,
          iconColor: AppColors.TheMain,
          borderSideColor: const Color.fromARGB(255, 244, 244, 244),
          fontColor: AppColors.TheMain,
          obscureText: false,
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.name],
          onChanged: (value) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: []);
            controller.searching = value.toString();
            return value;
          },
          validator: (value) {},
          onTap: () {
            // إذا كانت حالة البحث نشطة، قم بمسح القيمة وإعادة القائمة بالكامل
            if (controller.isSearching.value) {
              controller.searching = "";
              controller.searchingControllr.clear();
              controller.getDataBusinessesDatabaseSearch("");
              controller.getDataAuctionsDatabaseSearch("");
              controller.makeSearchingReady("");
            } else {
              // إذا لم تكن حالة البحث نشطة، قم بإجراء البحث بناءً على القيمة المدخلة
              controller.getDataBusinessesDatabaseSearch(
                  controller.searching.toString());
              controller.getDataAuctionsDatabaseSearch(
                  controller.searching.toString());
              controller.makeSearchingReady(controller.searching.toString());
            }
          },
        ),
      ),
    );
  }
}
