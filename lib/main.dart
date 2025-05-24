import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kilyani_app/core/constant/appcolors.dart';
import 'firebase_options.dart';
import 'core/constant/color_primary.dart';
import 'core/localization/changelanguage.dart';
import 'core/localization/translation.dart';
import 'core/services/appservices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/loadingScreen/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();
  FirebaseMessaging.instance.subscribeToTopic("all");
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

// ...

ChangeLanguageToLocale chagnelangcontroller = Get.put(ChangeLanguageToLocale());

class MyApp extends StatelessWidget {
  final width;
  const MyApp({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ModeColor.mode,
    ));
    AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.TheMain,
        statusBarIconBrightness: Brightness.dark, // لأيقونات الحالة (اختياري)
        statusBarBrightness: Brightness.light, // لنص الحالة (اختياري)
      ),
      // باقي خصائص الـ AppBar...
    );

    // ignore: deprecated_member_use
    WidgetsBinding.instance.window.physicalSize.height;
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window.physicalSize.width;
    // ignore: deprecated_member_use

    return GetMaterialApp(
      //  initialBinding: initBindings(),
      debugShowCheckedModeBanner: false,
      locale: chagnelangcontroller.language,
      translations: AppTranslation(),
      title: "كليانى",
      home: Scaffold(
          body: SafeArea(
              child: ScreenUtilInit(
                  designSize: Size(360, 690), child: LoadingScreen()))),
      theme: ThemeData(primarySwatch: ModeColor.mode),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        // ignore: deprecated_member_use
        final scale = mediaQueryData.textScaleFactor.clamp(0.9, 0.9);
        return MediaQuery(
            // ignore: deprecated_member_use
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: child!);
      },
    );
  }
}
