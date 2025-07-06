import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  //FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    /* NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
    // Stripe.publishableKey = ApiKeysStripe.Publishablekey;*/

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
