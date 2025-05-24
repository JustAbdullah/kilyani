import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/data/model/products.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_text.dart';

class ProductMore extends StatelessWidget {
  const ProductMore({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90.h,
      child: FutureBuilder<List<Products>>(
          future: homeController
              .getDataProductsDatabaseBussinesMan(homeController.bussinesId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.TheMain,
              ));
            } else if (snapshot.hasError) {
              return Center(
                child: TextCustom(
                  theText: "لايمتلك هذا التجر اي منتجات اخرى",
                  fontSizeWidth: 13.2.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTextStyles.Almarai,
                  fontColor: AppColors.redColor,
                ),
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Products products = snapshot.data![index];

                    return InkWell(
                      onTap: () {
                        homeController.clearInDetilasProduct();
                        homeController.viewProducDetails(products);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          width: 70.w,
                          height: 90.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                  width: 50.w,
                                  height: 50.h,
                                  fit: BoxFit.contain,
                                  imageUrl: products.img.toString(),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                  placeholder: (context, url) => SizedBox(
                                      child: ContainerCustom(
                                          colorContainer: AppColors.TheMain,
                                          heigthContainer: 30.h,
                                          widthContainer: 30.w,
                                          child: TextCustom(
                                            theText: "كليانى",
                                            fontSizeWidth: 10,
                                            fontFamily: AppTextStyles.Marhey,
                                            fontColor: AppColors.whiteColor,
                                          )))),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                products.name.toString(),
                                style: TextStyle(
                                  fontSize: 14.2.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
