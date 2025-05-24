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

class BusinessPageProductMore extends StatelessWidget {
  const BusinessPageProductMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130.h,
      child: FutureBuilder<List<Products>>(
        future: homeController.getDataProductsDatabaseBussinesMan(
            homeController.idBusinessInPage),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.TheMain,
              ),
            );
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return Center(
              child: TextCustom(
                theText: "لا يملك هذا المتجر أي منتجات",
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
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Products product = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    homeController.clearInDetilasProduct();
                    homeController.viewProducDetails(product);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SizedBox(
                      width: 100.w,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// صورة المنتج داخل حاوية ذات أبعاد متساوية وحواف دائرية
                            Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: product.img.toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.TheMain.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: TextCustom(
                                      theText: "تحميل...",
                                      fontSizeWidth: 10,
                                      fontFamily: AppTextStyles.Marhey,
                                      fontColor: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),

                            /// اسم المنتج
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Text(
                                product.name.toString(),
                                style: TextStyle(
                                  fontSize: 12.2.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
