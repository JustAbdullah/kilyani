import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class ProductsSize {
  var productSizeId;
  var SizeId;

  var sizeName;

  ProductsSize(
      {required this.productSizeId,
      required this.sizeName,
      required this.SizeId});

  factory ProductsSize.fromJson(Map<String, dynamic> json) {
    return ProductsSize(
      productSizeId: json['products_sizes_id'] ?? 0,
      SizeId: json['size_id'] ?? 0,
      sizeName: json['sizes']['size_name'] ?? 'Default Title',
    );
  }
}
