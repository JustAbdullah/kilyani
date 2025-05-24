import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class Products {
  var id;
  var name;
  var img;
  var about;
  var price;
  var status;
  var product_business_account;
  var nameBuss;
  var logoBuss;
  var business_account_id;

  Products(
      {required this.id,
      required this.name,
      required this.img,
      required this.about,
      required this.price,
      required this.status,
      required this.product_business_account,
      required this.nameBuss,
      required this.logoBuss,
      required this.business_account_id});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['product_id'] ?? 0,
      name: json['product_name'] ?? 'Default Title',
      img: json['product_image'] ?? 'Default image',
      about: json['product_description'] ?? 'Default about',
      price: json['product_price'] ?? 00,
      status: json['status_product'] ?? 00,
      product_business_account: json['product_business_account'] ?? 00,
      nameBuss: json['business']['business_account_name'] ?? "",
      logoBuss: json['business']['business_account_logo'] ?? 'Default about',
      business_account_id:
          json['business']['business_account_id'] ?? 'Default about',
    );
  }
}
