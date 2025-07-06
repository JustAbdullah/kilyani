import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kilyani_app/controllers/home_controller.dart';
import 'package:kilyani_app/views/accountScreen/forget_password.dart';
import 'package:kilyani_app/views/accountScreen/sign.dart';
import 'package:kilyani_app/views/homeScreen/homeWidgets/settingsWidget/terms.dart';
import 'package:kilyani_app/views/messages/message_successfully.dart';
import 'package:kilyani_app/views/messages/message_wait.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20.h),
                    
                    // Logo with elegant animation
                    Hero(
                      tag: 'login-logo',
                      child: Container(
                        height: 140.h,
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImagesPath.logo,
                          fit: BoxFit.cover,
                          height: 150.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    
                    // Welcome header
                    Text(
                      "مرحبًا بعودتك",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.TheMain,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),
                    
                    // Subtitle
                    Text(
                      "سجل الدخول للوصول إلى حسابك واستئناف تجربتك",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.balckColorTypeThree,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                 
                    // Username field
                    _buildInputField(
                      label: "اسم المستخدم",
                      hint: "أدخل اسم المستخدم",
                      icon: Icons.person_outline_rounded,
                      controller: homeController.nameInSingUPTextEdit,
                      onChanged: (value) {
                        homeController.nameInSingUp = value;
                      },
                      keyboardType: TextInputType.name,
                      autofillHints: [AutofillHints.username],
                    ),
                    SizedBox(height: 24.h),
                    
                    // Password field with toggle
                    _buildPasswordField(),
                    SizedBox(height: 16.h),
                    
                    // Forgot password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          homeController.ForgetThePasswordPage.value = true;
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "هل نسيت كلمة المرور؟",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppTextStyles.Almarai,
                            color: AppColors.TheMain,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    
                    // Login button
                    _buildLoginButton(),
                    SizedBox(height: 32.h),
                    
                    // Sign up prompt
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ليس لديك حساب؟",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: AppTextStyles.Almarai,
                            color: AppColors.balckColorTypeThree,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        InkWell(
                          onTap: () {
                            homeController.clearLoginOrSignUp();
                            Get.to(() => const Sign());
                          },
                          child: Text(
                            "إنشاء حساب",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.TheMain,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    
                    // Terms and conditions
                    _buildTermsSection(),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
          
          // Overlay components
          const MessageWait(),
          const MessageSuccessfully(),
          ForgetThePassword(),
          Terms(),
          _buildErrorDialogs(),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    required Function(String) onChanged,
    required TextInputType keyboardType,
    required List<String> autofillHints,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.balckColorTypeFour,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboardType,
            autofillHints: autofillHints,
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.balckColorTypeFour,
              fontFamily: AppTextStyles.Almarai,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.grey,
                fontFamily: AppTextStyles.Almarai,
              ),
              prefixIcon: Icon(
                icon,
                color: AppColors.TheMain,
                size: 22.sp,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 18.h,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "كلمة المرور",
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.balckColorTypeFour,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: homeController.passwordInSingUPTextEdit,
            obscureText: _obscurePassword,
            onChanged: (value) {
              homeController.passwordInSing = value;
            },
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.balckColorTypeFour,
              fontFamily: AppTextStyles.Almarai,
            ),
            decoration: InputDecoration(
              hintText: "أدخل كلمة المرور",
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.grey,
                fontFamily: AppTextStyles.Almarai,
              ),
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                color: AppColors.TheMain,
                size: 22.sp,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.grey,
                  size: 22.sp,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 18.h,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        homeController.loginUser(
          homeController.nameInSingUp,
          homeController.passwordInSing,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.TheMain,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        textStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
          fontFamily: AppTextStyles.Almarai,
        ),
        shadowColor: AppColors.TheMain.withOpacity(0.4),
      ),
      child: Text("تسجيل الدخول"),
    );
  }

  Widget _buildTermsSection() {
    return Column(
      children: [
        Text(
          "بالنقر على تسجيل الدخول، فإنك توافق على",
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: AppTextStyles.Almarai,
            color: AppColors.balckColorTypeThree,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4.h),
        InkWell(
          onTap: () {
            homeController.terms.value = true;
          },
          child: Text(
            "شروط الاستخدام وسياسة الخصوصية",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: AppTextStyles.Almarai,
              color: AppColors.TheMain,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorDialogs() {
    return GetX<HomeController>(
      builder: (controller) {
        return Stack(
          children: [
            // Empty login dialog
            if (controller.emptyLogin.value)
              _buildErrorDialog(
                animation: ImagesPath.wearing,
                message: "عزيزي المستخدم، يرجى ملء جميع الحقول المطلوبة",
              ),
            
            // Login error dialog
            if (controller.errorLogin.value)
              _buildErrorDialog(
                animation: ImagesPath.error,
                message: "بيانات الدخول غير صحيحة، يرجى المحاولة مرة أخرى",
              ),
          ],
        );
      },
    );
  }

  Widget _buildErrorDialog({required String animation, required String message}) {
    return Container(
      color: Colors.black54,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 300.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(animation, width: 100.w, height: 100.h),
                SizedBox(height: 20.h),
                Text(
                  message,
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.balckColorTypeFour,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: () {
                    if (animation == ImagesPath.wearing) {
                      homeController.emptyLogin.value = false;
                    } else {
                      homeController.errorLogin.value = false;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.TheMain,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                  ),
                  child: Text(
                    "حسنًا",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
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
}