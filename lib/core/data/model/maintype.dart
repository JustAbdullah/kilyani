import '../../localization/changelanguage.dart';
import 'package:get/get.dart';

ChangeLanguageToLocale homeController = Get.put(ChangeLanguageToLocale());

class maintype {
  var id;
  var name;
  var img;
  var idType;

  maintype(
      {required this.id,
      required this.name,
      required this.img,
      required this.idType});

  factory maintype.fromJson(Map<String, dynamic> json) {
    return maintype(
      id: json['type_id'] ?? 1,
      name: json['type_name'] ?? 'Default Title',
      img: json['type_image'] ?? 'Default image',
      idType: json['type_id'] ?? 'Default image',
    );
  }
}
