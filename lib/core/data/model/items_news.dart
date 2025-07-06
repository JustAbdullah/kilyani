import 'package:get/get.dart';
import 'package:kilyani_app/core/data/model/list_of_news.dart';
import '../../constant/images_path.dart';

final List<NewsModel> newsStatic = [
  // الخبر الأول: سحر التنوع يفوق الخيال!
  NewsModel(
    title: "ستصاب بالحيرة!!".tr,
    body:
        "أسرنا لك تشكيلة استثنائية من المنتجات المتنوعة، فأصنافنا الرائعة ستبهرك وتغير نظرتك للتسوق."
            .tr,
    image: ImagesPath.ManFour,
  ),
  // الخبر الثاني: تجربة تسوق لا تُنسى!
  NewsModel(
    title: "تجربة تسوق لا تُنسى!!".tr,
    body:
        "انطلق في رحلة استثنائية مع تطبيقنا؛ حيث تجمع كل نقرة بين الأناقة والحداثة لتمنحك تجربة تسوق فريدة تستحق الفخر."
            .tr,
    image: ImagesPath.ManFive,
  ),
  // الخبر الثالث: وفر بذكاء وعش برفاهية!
  NewsModel(
    title: "وفر بذكاء، عش برفاهية!!".tr,
    body:
        "مع عروضنا الحصرية وأسعارنا المبهرة، أصبح التوفير أسلوب حياة يمزج بين الذكاء والرفاهية – خيارك الأمثل لكل مشترياتك."
            .tr,
    image: ImagesPath.ManSix,
  ),
];
