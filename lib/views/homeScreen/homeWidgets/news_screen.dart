import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/data/model/items_news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ScrollController _scrollController = ScrollController();

  /// دالة التمرير التلقائي للبطاقات مع ضمان ظهور البطاقة الأخيرة
  void _startAutoScroll() {
    const autoScrollDuration = Duration(seconds: 5);
    Timer.periodic(autoScrollDuration, (timer) {
      if (!_scrollController.hasClients) return;

      final screenWidth = MediaQuery.of(context).size.width;
      // العرض الجديد للبطاقة: 70% من عرض الشاشة بالإضافة لهوامش (8.w لكل جانب)
      final cardWidth = screenWidth * 0.7 + 16.w;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      if (currentScroll + cardWidth < maxScroll) {
        // التمرير بمقدار عرض البطاقة إذا لم نتجاوز الحد الأقصى
        _scrollController.animateTo(
          currentScroll + cardWidth,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      } else if (currentScroll < maxScroll) {
        // إذا لم نصل بعد للنهاية، نتحرك حتى النهاية
        _scrollController.animateTo(
          maxScroll,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      } else {
        // عند الوصول للنهاية نعود للبداية
        _scrollController.animateTo(
          0.0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// دالة بناء بطاقة الخبر باستخدام Stack لعرض الصورة والخطوط
  Widget _buildNewsItem(BuildContext context, int index) {
    final newsItem = newsStatic[index];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      width: MediaQuery.of(context).size.width * 0.7, // تم تقليص حجم البطاقة
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // الصورة الخلفية التي تملأ البطاقة بالكامل
            Image.asset(
              newsItem.image,
              fit: BoxFit.cover,
            ),
            // تراكب لوني خفيف لتحسين وضوح النص
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // النصوص الموضوعة فوق الصورة
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsItem.title,
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.yellowColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    newsItem.body,
                    style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.whiteColorTypeOne,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      height: 200.h,
      width: double.infinity,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newsStatic.length,
        itemBuilder: (context, index) => _buildNewsItem(context, index),
      ),
    );
  }
}
