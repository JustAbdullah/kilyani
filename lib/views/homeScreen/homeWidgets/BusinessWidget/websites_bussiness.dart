import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/data/model/StoreWebview.dart';

class WebsitesBussiness extends StatelessWidget {
  const WebsitesBussiness({super.key});

  @override
  Widget build(BuildContext context) {  
      final HomeController controller = Get.put(HomeController());

    return  Stack(
      children: [
        SizedBox(
      width: double.infinity,
      height: 220.h,
      child:Expanded(
                    child: controller.webviews.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.public, size: 50.w, color: AppColors.balckColorTypeFour),
                                SizedBox(height: 16.h),
                                Text(
                                  "لا توجد مواقع متاحة",
                                  style: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSize: 20.sp,
                                    color: AppColors.balckColorTypeFour,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : GridView.builder(
                            padding: EdgeInsets.only(bottom: 20.h),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // إثنين في كل سطر
                              crossAxisSpacing: 20.w,
                              mainAxisSpacing:20.h,
                              childAspectRatio: 0.60, // جعل الكروت أوسع
                            ),
                            itemCount: controller.webviews.length,
                            itemBuilder: (context, index) {
                              return _buildWebsiteCard(
                                  controller.webviews[index], context);
                            },
                          ),
                  ),
        )
      ],
    );
  }
}
  // Professional website card design with larger size
  Widget _buildWebsiteCard(StoreWebview website, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.balckColorTypeFour.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        child: InkWell(
          onTap: () => _showWebsitePopup(context, website.url),
          borderRadius: BorderRadius.circular(20.r),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Favicon with fallback
                Center(
                  child: Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: AppColors.TheMain,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.TheMain.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: _buildFavicon(website.url),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                
                // Website name
                Text(
                  website.siteName,
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                
                // Domain name
                Text(
                  _getDomainName(website.url),
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.balckColorTypeFour,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.h),
                
                // Large view button
                Container(
                  width: double.infinity,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.balckColorTypeFour,
                   
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15.r),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.r),
                      onTap: () => _showWebsitePopup(context, website.url),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.visibility, size: 12.w, color: Colors.white),
                            SizedBox(width: 8.w),
                            Text(
                              "مشاهدة الموقع",
                              style: TextStyle(
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build favicon with better error handling
  Widget _buildFavicon(String url) {
    try {
      final uri = Uri.parse(url);
      final faviconUrl = "https://www.google.com/s2/favicons?domain=${uri.host}&sz=256";
      
      return CachedNetworkImage(
        imageUrl: faviconUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) => Center(
          child: Icon(Icons.public, size: 35.w, color: AppColors.TheMain),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(Icons.public, size: 35.w, color: AppColors.TheMain),
        ),
      );
    } catch (e) {
      return Center(
        child: Icon(Icons.public, size: 35.w, color: AppColors.TheMain),
      );
    }
  }

  // Helper function to extract domain name
  String _getDomainName(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.host.replaceFirst('www.', '');
    } catch (e) {
      return url;
    }
  }

  // Professional website popup with enhanced UI
  void _showWebsitePopup(BuildContext context, String url) {
    bool isLoading = true;
    bool hasError = false;
    bool timedOut = false;
    InAppWebViewController? webViewController;
    Timer? timeoutTimer;
    
    // Start timeout timer
    timeoutTimer = Timer(Duration(seconds: 30), () {
      if (isLoading && context.mounted) {
        timedOut = true;
        isLoading = false;
      }
    });

    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
              horizontal: 0.w, 
              vertical: 0.h,
            ),
            
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              height: MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Professional header
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.TheMain,
                          AppColors.TheMain,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Icon(Icons.public, color: Colors.white, size: 24.w),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            _getDomainName(url),
                            style: TextStyle(
                              fontFamily: AppTextStyles.Almarai,
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        IconButton(
                          icon: Icon(Icons.close, size: 24.w, color: Colors.white),
                          onPressed: () {
                            timeoutTimer?.cancel();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  
                  // Webview content
                  Expanded(
                    child: Stack(
                      children: [
                        InAppWebView(
                          initialUrlRequest: URLRequest(url: Uri.parse(url)),
                          initialOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                              javaScriptEnabled: true,
                              useShouldOverrideUrlLoading: true,
                              transparentBackground: true,
                            ),
                            android: AndroidInAppWebViewOptions(
                              useHybridComposition: true,
                            ),
                            ios: IOSInAppWebViewOptions(
                              allowsInlineMediaPlayback: true,
                            ),
                          ),
                          onWebViewCreated: (controller) {
                            webViewController = controller;
                          },
                          onLoadStart: (controller, url) {
                            setState(() {
                              isLoading = true;
                              hasError = false;
                              timedOut = false;
                            });
                          },
                          onLoadStop: (controller, url) {
                            setState(() => isLoading = false);
                            timeoutTimer?.cancel();
                          },
                          onLoadError: (controller, url, code, message) {
                            setState(() {
                              isLoading = false;
                              hasError = true;
                            });
                            timeoutTimer?.cancel();
                          },
                          onProgressChanged: (controller, progress) {
                            if (progress > 50) {
                              setState(() => isLoading = false);
                              timeoutTimer?.cancel();
                            }
                          },
                        ),
                        
                        // Loading overlay
                        if (isLoading && !timedOut)
                          Positioned.fill(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 70.w,
                                      height: 70.w,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 6.w,
                                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.TheMain),
                                      ),
                                    ),
                                    SizedBox(height: 25.h),
                                    Text(
                                      'جاري تحميل الموقع...',
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        fontSize: 20.sp,
                                        color: AppColors.TheMain,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      'قد تستغرق العملية بضع ثواني',
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        fontSize: 16.sp,
                                        color: AppColors.balckColorTypeFour,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        
                        // Error overlay
                        if (hasError || timedOut)
                          Positioned.fill(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(30.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        size: 80.w,
                                        color: Colors.red,
                                      ),
                                      SizedBox(height: 30.h),
                                      Text(
                                        timedOut 
                                            ? 'تجاوز الوقت المسموح لتحميل الموقع'
                                            : 'حدث خطأ أثناء تحميل الموقع',
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 22.sp,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        'سيتم المحاولة تلقائيًا خلال 5 ثواني',
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 18.sp,
                                          color: AppColors.balckColorTypeFour,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 40.h),
                                      // Auto retry after 5 seconds
                                      TweenAnimationBuilder(
                                        tween: Tween(begin: 5.0, end: 0.0),
                                        duration: Duration(seconds: 5),
                                        builder: (context, value, child) {
                                          return Column(
                                            children: [
                                              CircularProgressIndicator(
                                                value: (5 - value) / 5,
                                                strokeWidth: 8.w,
                                                color: AppColors.TheMain,
                                              ),
                                              SizedBox(height: 20.h),
                                              Text(
                                                'إعادة المحاولة بعد: ${value.toInt()} ثانية',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyles.Almarai,
                                                  fontSize: 18.sp,
                                                  color: AppColors.TheMain,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        onEnd: () {
                                          if (context.mounted) {
                                            setState(() {
                                              isLoading = true;
                                              hasError = false;
                                              timedOut = false;
                                            });
                                            webViewController?.reload();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
