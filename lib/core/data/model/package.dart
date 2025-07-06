import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class Package {
  var packageId;
  var packageName;
  var packageDescription;
  var packagePrice;
  var limitProduct;
  var editProduct;
  var addAuction;
  var colorsSizes;

  Package(
      {required this.packageId,
      required this.packageName,
      required this.packageDescription,
      required this.packagePrice,
      required this.limitProduct,
      required this.editProduct,
      required this.addAuction,
      required this.colorsSizes});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageId: json['package_id'] ?? 0,
      packageName: json['package_name'] ?? 0,
      packageDescription: json['package_description'] ?? 'Default Title',
      packagePrice: json['package_price'] ?? 0.0,
      limitProduct: json['limit_product'] ?? 'Default Title',
      editProduct: json['edit_product'] ?? 'Default Title',
      addAuction: json['add_auction'] ?? 'Default Title',
      colorsSizes: json['colors_sizes'] ?? '0',
    );
  }
}
