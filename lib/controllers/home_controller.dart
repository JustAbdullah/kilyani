//import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kilyani_app/core/data/model/ban.dart';

import '../core/class/class/crud.dart';
import '../core/data/model/StoreWebview.dart';
import '../core/data/model/auction.dart';
import '../core/data/model/auctionUser.dart';
import '../core/data/model/basket.dart';
import '../core/data/model/bills.dart';
import '../core/data/model/business.dart';
import '../core/data/model/chat.dart';
import '../core/data/model/colors.dart';
import '../core/data/model/conv.dart';
import '../core/data/model/maintype.dart';
import '../core/data/model/message.dart';
import '../core/data/model/order.dart';
import '../core/data/model/package.dart';
import '../core/data/model/products.dart';
import '../core/data/model/rating.dart';
import '../core/data/model/sizes.dart';
import '../core/data/model/users.dart';
import '../core/data/model/wallet_history.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/BuseinssAccountScreen/home_buseiness.dart';
import '../views/WelcomeScreen/welcome.dart';
import '../views/homeScreen/home_screen.dart';
import '../views/onBoardingScreen/onboarding.dart';

class HomeController extends GetxController {
  final crud = Crud();
  AppServices appServices = Get.find();
//////////////////////////////The Way In Loading..............//////////////////////
      var showPassword = false.obs;

  RxBool theWay = false.obs;
  WhereGoingTheApp() {
    Future.delayed(Duration(seconds: 5), () async {
      if (theWay.value == false) {
        if (appServices.sharedPreferences.containsKey('onBoarding')) {
          if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
            Get.to(HomeScreen());
            theWay.value = true;
          } else {
            Get.to(WelcomeScreen());
            theWay.value = true;
          }
        } else {
          Get.to(OnBoarding());
          theWay.value = true;
        }
      }
    });
  }

//////////////////////////////////////Sing Up.........................//////////////
  RxBool isNoHaveAccount = true.obs;
  GlobalKey<FormState> formSign = GlobalKey<FormState>();

  GlobalKey<FormState> formLogin = GlobalKey<FormState>();

  String nameInSingUp = "a";
  String passwordInSing = "a";
  TextEditingController nameInSingUPTextEdit = TextEditingController();
  TextEditingController passwordInSingUPTextEdit = TextEditingController();

  RxBool errorLogin = false.obs;
  RxBool emptyLogin = false.obs;

  Future<void> login(String name, String password) async {
    if (nameInSingUp == "a" || passwordInSing == "a") {
      emptyLogin.value = true;
    } else {
      final response = await http.post(
        Uri.parse(AppLinksApi.loginUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_name': name,
          'user_password': password,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          isNoHaveAccount.value = true;
          messageWait.value = false;
          messageSuccessfully.value = true;
          // إنشاء كائن المستخدم من البيانات المستجابة
          Users user = Users.fromJson(jsonResponse['data']);
          setUser(user);
          Future.delayed(Duration(seconds: 2), () async {
            saveDataUserInMemory(
              users!.value.user_id as int,
              users!.value.user_name.toString(),
              users!.value.code.toString(),
              users!.value.user_phone.toString(),
              users!.value.amount.toString(),
              users!.value.log,
              users!.value.lat,
              users!.value.status_auth.toString(),
            );
            initializeDateFormatting();
            Intl.defaultLocale = 'ar';
            DateTime now = DateTime.now();
            String format = 'hh:mm a';
            DateFormat formatter = DateFormat(format, 'ar');
            addMessage(" مرحبًا بك $name",
                "مرحبًا بك في منصة كليانى,,سعداء بتواجدك معنا ونحثك دائمًا وابدًا على قراءة الشروط والاحكام  للتعرف على المنصة بشكل أكبر..تحياتنا");

            addWalletHistory(
                "${DateFormat.MMM().format(DateTime.now()).toString()}-"
                    "${DateFormat.d().format(DateTime.now()).toString()}",
                "تم إنشاء محفظتك بنجاح  ....",
                "0");

            getDataUserInMemoeryForget();
            getDataUserInHomeForget();
            checkStatuAuthAccount();
            clearLoginOrSignUp();
            Get.offAll(HomeScreen());
          });
        } else {
          messageWait.value = false;
          errorLogin.value = true;
        }
      } else {
        messageWait.value = false;
        errorLogin.value = true;
      }
    }
  }

///////////////Check Account.................////////
  RxBool checkAccount = false.obs;

  Future<void> checkTheAccount(String name, String password) async {
    if (nameInSingUp == "a" || passwordInSing == "a") {
      emptyLogin.value = true;
    } else {
      messageWait.value = true;
      final response = await http.post(
        Uri.parse(AppLinksApi.checkName),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_name': name,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          messageWait.value = false;
          checkAccount.value = true;
        } else {
          SignUp(name, password);
        }
      } else {
        messageWait.value = false;
        errorLogin.value = true;
      }
    }
  }

  Future<void> SignUp(String name, String password) async {
    if (nameInSingUp == "a" || passwordInSing == "a") {
      emptyLogin.value = true;
    } else {
      codeUser = generateRandomString(4);

      final response = await http.post(
        Uri.parse(AppLinksApi.SignUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_name': name,
          'user_password': password,
          'code': codeUser.toString()
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          isNoHaveAccount.value = true;
          // إنشاء كائن المستخدم من البيانات المستجابة
          login(name, password);
        } else {
          messageWait.value = false;
          errorLogin.value = true;
        }
      } else {
        messageWait.value = false;
        errorLogin.value = true;
      }
    }
  }

  Future<void> loginUser(String name, String password) async {
    if (nameInSingUp == "a" || passwordInSing == "a") {
      emptyLogin.value = true;
    } else {
      messageWait.value = true;
      final response = await http.post(
        Uri.parse(AppLinksApi.loginUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_name': name,
          'user_password': password,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          isNoHaveAccount.value = true;
          messageWait.value = false;

          // إنشاء كائن المستخدم من البيانات المستجابة
          Users user = Users.fromJson(jsonResponse['data']);
          setUser(user);
          messageSuccessfully.value = true;
          Future.delayed(Duration(seconds: 1), () async {
            saveDataUserInMemory(
              users!.value.user_id as int,
              users!.value.user_name.toString(),
              users!.value.code.toString(),
              users!.value.user_phone.toString(),
              users!.value.amount.toString(),
              users!.value.log,
              users!.value.lat,
              users!.value.status_auth.toString(),
            );

            Get.offAll(HomeScreen());
            clearLoginOrSignUp();
            messageSuccessfully.value = false;
          });
        } else {
          messageWait.value = false;
          errorLogin.value = true;
        }
      } else {
        messageWait.value = false;
        errorLogin.value = true;
      }
    }
  }

//////////////////////////##############END OF SIGN UP.............................//

/////////////////Home Screen.........................................//////////////

  /////////////////////////////Data From API..............................////////////

  clearLoginOrSignUp() {
    messageSuccessfully.value = false;
    messageWait.value = false;
    errorLogin.value = false;
    nameInSingUp = "";
    passwordInSing = "";
    nameInSingUPTextEdit.clear();
    passwordInSingUPTextEdit.clear();
  }

  RxInt typeIdProduct = 0.obs;

  int bussinesId = 0;
  RxInt isTheProductGet = 0.obs;

  Future<List<Products>> getDataProductsDatabase(String ProductId) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getProducts),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'type_id': int.parse(ProductId),
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load  products');
    }
  }

  Future<List<Products>> getDataProductsDatabaseSearch(
      String ProductId, String search) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getProductsSearch),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'type_id': int.parse(ProductId),
        'search': search.toString(),
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load  products');
    }
  }

  Future<List<Products>> getDataProductsDatabaseBussinesMan(int id) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getProductsbussiness),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'product_business_account': int.parse(id.toString()),
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load  products');
    }
  }

  final listofMainType = Rx<List<maintype>>([]);

  Future<void> getDataMainTypesDatabase() async {
    final response = await http.get(Uri.parse(AppLinksApi.getMainTypes));

    if (response.statusCode == 200) {
      List<dynamic> MaintypeJson = json.decode(response.body)['data'];
      listofMainType.value =
          MaintypeJson.map((json) => maintype.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load mainType');
    }
  } /////////////////////////////############Visibility..............................////////////

  RxBool showDetialsProduct = false.obs;

  var currentProduct = Rxn<Products>();

  void viewProducDetails(Products products) {
    fetchColorProduct(products.id.toString());
    fetchSizesProduct(products.id.toString());
    currentProduct.value = products;
    priceProduct.value = int.parse(products.price.toString());
    totalPriceProcut.value = int.parse(products.price.toString());
    isTheProductGet.value = int.parse(products.id.toString());

    bussinesId = int.parse(products.business_account_id.toString());
    getRating(currentProduct.value!.id.toString());
    showDetialsProduct.value = true;
  }

  ////////////Get Products.. By Searching...................///////////
  TextEditingController searchingControllr = TextEditingController();
  String searching = "";
  RxBool isSearching = false.obs;
  makeSearchingReady(String searching) {
    if (isSearching.value == true) {
      makeSearchingClear();
    } else {
      //    fetchProductsDataSearching(searching.toString());
      isSearching.value = true;
    }
  }

  makeSearchingClear() {
    searchingControllr.clear();
    searching = "";
    isSearching.value = false;
    isNotEmptyProducrsSearching.value = false;
    // dataProductsListSearching.clear();
  }

  RxBool isNotEmptyProducrsSearching = false.obs;

  ///////////////////###########sizes And Colors Products.................//////////

  RxBool showTheColorsProduct = false.obs;
  RxBool showTheSizeProduct = false.obs;

  RxInt choesColorNumber = 1.obs;
  RxInt choesSizeNumber = 1.obs;

  RxInt priceProduct = 0.obs;
  RxInt totalPriceProcut = 0.obs;
  RxInt countTheQu = 1.obs;

  clearInDetilasProduct() {
    showTheColorsProduct.value = false;
    showTheSizeProduct.value = false;

    choesColorNumber.value = 1;
    choesSizeNumber.value = 1;

    priceProduct.value = 0;
    totalPriceProcut.value = 0;
    countTheQu.value = 1;
    checkIfTheProductHaveSize.value = 0;
    checkIfTheProductHaveColor.value = 0;
    showDetialsProduct.value = false;
    listofcolors.value.clear();
    listofSize.value.clear();
    averageRating.value = 0.0;
  }

  isAddIntoBasket() {
    showTheColorsProduct.value = false;
    showTheSizeProduct.value = false;
    choesColorNumber.value = 1;
    choesSizeNumber.value = 1;
    priceProduct.value;
    countTheQu.value = 1;
    totalPriceProcut.value = priceProduct.value;
    checkIfTheProductHaveSize.value = 0;
    checkIfTheProductHaveColor.value = 0;
  }

  plusThePrice() {
    countTheQu.value = countTheQu.value + 1;
    totalPriceProcut.value = totalPriceProcut.value + priceProduct.value;
  }

  minusThePrice() {
    if (countTheQu.value != 1) {
      countTheQu.value = countTheQu.value - 1;
      totalPriceProcut.value = totalPriceProcut.value - priceProduct.value;
    } else {}
  }

  checkTheColorProcut() {
    if (showTheColorsProduct.value == true) {
      showTheColorsProduct.value = false;
    } else {
      showTheColorsProduct.value = true;
    }
  }

  checkTheSizeProcut() {
    if (showTheSizeProduct.value == true) {
      showTheSizeProduct.value = false;
    } else {
      showTheSizeProduct.value = true;
    }
  }

  final listofcolors = Rx<List<ProductsColors>>([]);
  Future<void> fetchColorProduct(String ProductId) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getColorProduct),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'product_id': int.parse(ProductId),
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      listofcolors.value =
          jsonResponse.map((data) => ProductsColors.fromJson(data)).toList();

      listofcolors.value.isEmpty
          ? checkIfTheProductHaveColor.value = 0
          : checkIfTheProductHaveColor.value = 1;
    } else {
      throw Exception('Failed to load  products');
    }
  }

  final listofSize = Rx<List<ProductsSize>>([]);

  Future<void> fetchSizesProduct(String ProductId) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getSizeProduct),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'product_id': int.parse(ProductId),
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      listofSize.value =
          jsonResponse.map((data) => ProductsSize.fromJson(data)).toList();

      listofSize.value.isEmpty
          ? checkIfTheProductHaveSize.value = 0
          : checkIfTheProductHaveSize.value = 1;
    } else {
      throw Exception('Failed to load  products');
    }
  }

////////////////////////.................Messages......................//////////////
  RxBool messageWait = false.obs;
  RxBool messageSuccessfully = false.obs;
  RxBool messageError = false.obs;
  RxBool messageWearing = false.obs;

  /////////////////////////////////////////// .........Sign and Login...........////////////

  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();

  Rx<Users>? users = Rx<Users>(Users(
      user_id: 0,
      user_name: 'لايوجد مستخدم',
      code: '',
      user_phone: '',
      amount: 0,
      log: 0,
      lat: 0,
      status_auth: '0'));

  void setUser(Users newUser) {
    users!.value = newUser;
  }

  String codeUser = "a";
  String generateRandomStringUser(int length) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(length, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  RxBool checkIsGetData = false.obs;
  RxInt f = 0.obs;
  Future<void> getDataUserInHome() async {
    print("GetDataUserInHome");
    // if (appSer
    //vices.sharedPreferences.containsKey('isHaveAccount')) {
    final response = await http.post(
      Uri.parse(AppLinksApi.getdataUserId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': users!.value.user_id as int,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        Users user = Users.fromJson(jsonResponse['data']);

        setUser(user);
        f.value = users!.value.amount;
        saveDataUserInMemory(
            users!.value.user_id as int,
            users!.value.user_name.toString(),
            users!.value.code.toString(),
            users!.value.user_phone.toString(),
            users!.value.amount.toString(),
            users!.value.log,
            users!.value.lat,
            users!.value.status_auth.toString());
        ConvertIntoShortTextAddress();
      } else {}
    } else {}
    // }
  }
////////////////////////////.........................Menu........../////

  RxBool theSettings = false.obs;
  RxBool homeView = true.obs;
  RxBool showTheBasket = false.obs;
  RxBool showTheOrder = false.obs;

////////////////////////////................Settings........../////
  RxBool infoAccount = false.obs;
  RxBool messageList = false.obs;
  RxBool locationShow = false.obs;
  RxBool walletShow = false.obs;
  RxBool walletCharge = false.obs;

  RxBool codeShow = false.obs;
  RxBool termsShow = false.obs;
  RxBool packgeBussines = false.obs;
  RxBool terms = false.obs;
  RxBool authPage = false.obs;
  RxBool pageConv = false.obs;

  //////////////////////////////////// Save In MEMORY..................///////////////////
  Future<void> saveDataUserInMemory(
      int id,
      String name,
      String code,
      String phone,
      String amount,
      double log,
      double lat,
      String statusAuth) async {
    appServices.sharedPreferences.setString('isHaveAccount', 'HaveAccount');
    appServices.sharedPreferences.setInt("TheUserId", id);
    appServices.sharedPreferences.setString("TheUserName", name);
    appServices.sharedPreferences.setString("TheUserCode", code);
    appServices.sharedPreferences.setString("TheUserPhone", phone);
    appServices.sharedPreferences.setString("TheUserAmount", amount);
    appServices.sharedPreferences.setDouble("TheUserLog", log);
    appServices.sharedPreferences.setDouble("TheUserLat", lat);
    appServices.sharedPreferences.setString("statusAuth", statusAuth);
  }

  Future<void> getDataUserInMemoery() async {
    if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
      users!.value.user_id = appServices.sharedPreferences.getInt('TheUserId');
      users!.value.user_name =
          appServices.sharedPreferences.getString('TheUserName');
      users!.value.code =
          appServices.sharedPreferences.getString('TheUserCode');
      users!.value.user_phone =
          appServices.sharedPreferences.getString('TheUserPhone');
      users!.value.amount =
          appServices.sharedPreferences.getString('TheUserAmount');
      users!.value.log = appServices.sharedPreferences.getDouble('TheUserLog');
      users!.value.lat = appServices.sharedPreferences.getDouble('TheUserLat');
      users!.value.status_auth =
          appServices.sharedPreferences.getString('statusAuth');

      ConvertIntoShortTextAddress();

      addToken();
    } else {}
  }

  //////////////////////////////#################################OnInit The Main Void...............................................................
  //////////////////////////////#################################OnInit The Main Void...............................................................
  //////////////////////////////#################################OnInit The Main Void...............................................................
  //////////////////////////////#################################OnInit The Main Void...............................................................

  @override
  void onInit() {
    super.onInit();
    refreshStatuses();
    ConvertIntoShortTextAddress();
    getDataLastBusinessesDatabase();
    getDataLastAuctionDatabase();
    getDataBusinessesDatabaseSearch();
    getDataAuctionsDatabaseSearch();
    if (isNoHaveAccount.value == true) {
      ConvertIntoShortTextAddress();

      getDataUserInMemoery();
      getDataUserInHome();
      getDataMessages();
      getDataMainTypesDatabase();
      getCode();
      getIdBussinesFromMemroy();
      checkStatuAuthAccount();
      ConvertIntoShortTextAddress();
    } else {
      getDataMainTypesDatabase();
    }
  }

  //////////////////////////////#################################OnInit The Main Void...............................................................
  //////////////////////////////#################################OnInit The Main Void...............................................................
  //////////////////////////////#################################OnInit The Main Void...............................................................
  //////////////////////////////#################################OnInit The Main Void...............................................................

////////////////////////........############# BASKET........................///////
  String specilcode = "a";
  String generateRandomString(int length) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(length, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  createCode() {
    if (specilcode == "a") {
      specilcode = generateRandomString(5);
      appServices.sharedPreferences.setString('CodeBasket', specilcode);
      update();
    } else {}
  }

  getCode() {
    if (appServices.sharedPreferences.containsKey('CodeBasket')) {
      specilcode =
          appServices.sharedPreferences.getString('CodeBasket') as String;
    } else {}
  }

  clearCode() {
    specilcode = "a";
    appServices.sharedPreferences.setString('CodeBasket', "a");
  }

  bissineIdclear() {
    id_bussines = 0;
    appServices.sharedPreferences.setInt("IdBussines", 0);
  }

  RxBool messageWaitBasket = false.obs;
  RxBool messageSuccessfullyBasket = false.obs;
  RxBool messageErrorBasket = false.obs;

  Future<void> addIntoBasket(
      dynamic product_id,
      dynamic business_account_id,
      dynamic size_id,
      dynamic color_id,
      dynamic quantity,
      dynamic price,
      dynamic idBussineInBasket) async {
    if (isNotHaveAccount.value == true) {
      showMessageNotHaveAccount.value = true;
    } else if (checkIfTheProductHaveSize.value == 1) {
      showMessageWearingTheSizeProduct.value = true;
    } else if (checkIfTheProductHaveColor.value == 1) {
      showMessageWearingTheColorsProduct.value = true;
    } else {
      if (id_bussines != 0) {
        if (id_bussines != business_account_id) {
          isNotTheBussines.value = true;
          appServices.sharedPreferences.setInt("IdBussines", id_bussines);
        } else {
          id_bussines = business_account_id;
          appServices.sharedPreferences.setInt("IdBussines", id_bussines);

          createCode();
          messageWaitBasket.value = true;
          final response = await http.post(
            Uri.parse(AppLinksApi.addIntoBasket),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'user_id': users!.value.user_id,
              'business_account_id': business_account_id,
              'product_id': product_id,
              'size_id': size_id,
              'color_id': color_id,
              'quantity': quantity,
              'price': price,
              'special_code': specilcode,
            }),
          );

          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(response.body);
            if (jsonResponse['status'] == 'success') {
              messageWaitBasket.value = false;
              messageSuccessfullyBasket.value = true;
              Future.delayed(Duration(seconds: 1), () async {
                messageSuccessfullyBasket.value = false;
                isAddIntoBasket();
              });
              // إنشاء كائن المستخدم من البيانات المستجابة
            } else {
              messageWaitBasket.value = false;
              messageErrorBasket.value = true;
              Future.delayed(Duration(seconds: 2), () async {
                messageError.value = false;
                clearInDetilasProduct();
              });
            }
          } else {
            messageWaitBasket.value = false;
            messageErrorBasket.value = true;
            Future.delayed(Duration(seconds: 2), () async {
              messageErrorBasket.value = false;
              clearInDetilasProduct();
            });
          }
        }
      } else {
        id_bussines = business_account_id;
        appServices.sharedPreferences.setInt("IdBussines", id_bussines);
        createCode();
        messageWaitBasket.value = true;
        final response = await http.post(
          Uri.parse(AppLinksApi.addIntoBasket),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'user_id': users!.value.user_id,
            'business_account_id': business_account_id,
            'product_id': product_id,
            'size_id': size_id,
            'color_id': color_id,
            'quantity': quantity,
            'price': price,
            'special_code': specilcode,
          }),
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status'] == 'success') {
            messageWaitBasket.value = false;
            messageSuccessfullyBasket.value = true;
            Future.delayed(Duration(seconds: 1), () async {
              messageSuccessfullyBasket.value = false;
              isAddIntoBasket();
            });
            // إنشاء كائن المستخدم من البيانات المستجابة
          } else {
            messageWaitBasket.value = false;
            messageErrorBasket.value = true;
            Future.delayed(Duration(seconds: 2), () async {
              messageError.value = false;
              clearInDetilasProduct();
            });
          }
        } else {
          messageWaitBasket.value = false;
          messageErrorBasket.value = true;
          Future.delayed(Duration(seconds: 2), () async {
            messageErrorBasket.value = false;
            clearInDetilasProduct();
          });
        }
      }
    }
  }

  RxInt totalPrice = 0.obs;
  RxBool isHaveTotalPrice = false.obs;
  final listofBasket = Rx<List<Basket>>([]);

  Future<void> getDataBasket(String code) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getTheBasket),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'special_code': code,
        'user_id': users!.value.user_id as int
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      // حساب إجمالي سعر سلة المشتريات
      if (isHaveTotalPrice.value == true) {
      } else {
        totalPrice.value = 0;
        for (var data in jsonResponse) {
          final basketItem = Basket.fromJson(data);
          totalPrice += basketItem.price;
        }
      }

      listofBasket.value =
          jsonResponse.map((data) => Basket.fromJson(data)).toList();
    } else {
      throw Exception('فشل في تحميل سلة المشتريات');
    }
  }

  final listofBasketOrder = Rx<List<Basket>>([]);

  RxBool showBasketOrder = false.obs;
  Future<void> getDataBasketOrder(String code) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.basketOrder),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'special_code': code,
        'user_id': users!.value.user_id as int
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      listofBasketOrder.value =
          jsonResponse.map((data) => Basket.fromJson(data)).toList();
    } else {
      throw Exception('فشل في تحميل سلة المشتريات');
    }
  }

  RxBool waitDeleteBasket = false.obs;

  RxBool isTheBasketEmpty = false.obs;
  Future<void> deleteBasket(
    String id,
  ) async {
    waitDeleteBasket.value = true;
    final response = await http.post(
      Uri.parse(AppLinksApi.deleteFromBasket),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'shopping_basket_id': id,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        getDataBasket(specilcode);
        if (listofBasket.value.length == 0 || listofBasket.value.length == 1) {
          showTheBasket.value = false;
          waitDeleteBasket.value = false;
          listofBasket.value.clear;
          totalPrice.value = 0;
          listofBasket.value.length = 0;
          clearCode();
          bissineIdclear();
          showTheBasket.value = true;
        } else {
          showTheBasket.value = false;

          waitDeleteBasket.value = false;
          listofBasket.value.clear;
          totalPrice.value = 0;
          listofBasket.value.length = 0;
          getDataBasket(specilcode);
          showTheBasket.value = true;
        }

        update();
      } else {}
    } else {}
  }

  Future<void> deleteAllBasket(String code) async {
    if (listofBasket.value.length == 0) {
      isTheBasketEmpty.value = true;
    } else {
      waitDeleteBasket.value = true;
      final response = await http.post(
        Uri.parse(AppLinksApi.deleteFromBasketAll),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'special_code': code.toString(),
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          showTheBasket.value = false;
          waitDeleteBasket.value = false;
          listofBasket.value.clear;
          totalPrice.value = 0;
          listofBasket.value.length = 0;
          clearCode();
          bissineIdclear();
        } else {}
      } else {}
    }
  }

  ////////////////////////######################## ORDERS OPAERATION AND BASKET......................///////

  RxBool showMoreDetails = false.obs;
  RxString idShowMordeDetails = "0".obs;

///////////////////////////////////////////////#################Messages....................../////////////
  final listofMessages = Rx<List<messages>>([]);

  Future<void> getDataMessages() async {
    if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
      final response = await http.post(
        Uri.parse(AppLinksApi.getMessage),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': users!.value.user_id,
        }),
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body)['data'];

        listofMessages.value =
            jsonResponse.map((data) => messages.fromJson(data)).toList();
      } else {
        throw Exception('فشل في تحميل الرسائل');
      }
    }
  }

  Future<List<messages>> deleteMessage(String messageId) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.deleteMessage),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'message_id': messageId,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      return jsonResponse.map((data) => messages.fromJson(data)).toList();
    } else {
      throw Exception('فشل في حذف الرسالة');
    }
  }

  Future<List<messages>> updateMessage(String messageId) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.updateMessage),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'message_id': messageId,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      return jsonResponse.map((data) => messages.fromJson(data)).toList();
    } else {
      throw Exception('فشل في تعديل الرسالة');
    }
  }

  Future<void> addMessage(
    String message_name,
    String message_description,
  ) async {
    messageWait.value = true;
    final response = await http.post(
      Uri.parse(AppLinksApi.addMessage),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'message_name': message_name,
        'message_description': message_description,
        'user_id': users!.value.user_id as int,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
      } else {}
    } else {}
  }

  ////////////////////////////////// ............Terms........................////////////
  RxBool isNotHaveAccount = false.obs;
  RxBool showMessageNotHaveAccount = false.obs;

  void CheckisNotHaveAccount() {
    if (isNotHaveAccount.value == true) {
      showMessageNotHaveAccount.value = true;
    } else {}
  }

  RxInt checkIfTheProductHaveSize = 0.obs;
  RxInt checkIfTheProductHaveColor = 0.obs;
  RxBool showMessageWearingTheSizeProduct = false.obs;
  RxBool showMessageWearingTheColorsProduct = false.obs;

  wearningTheNotChoesSizeProduct() {
    if (checkIfTheProductHaveSize.value == 1) {
      showMessageWearingTheSizeProduct.value = true;
    } else {}
  }

  wearningTheNotChoesColorProduct() {
    if (checkIfTheProductHaveColor.value == 1) {
      showMessageWearingTheColorsProduct.value = true;
    } else {}
  }

  ////////////////////////////############# WalletHistory................//////////////////

  Future<void> addWalletHistory(
    String date_of_operation,
    String description_of_operation,
    String transaction_amount,
  ) async {
    messageWait.value = true;
    final response = await http.post(
      Uri.parse(AppLinksApi.addWalletHistory),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'date_of_operation': date_of_operation,
        'description_of_operation': description_of_operation,
        'transaction_amount': transaction_amount,
        'user_id': users!.value.user_id,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
      } else {}
    } else {}
  }

  final listofWalletHistory = Rx<List<walletHistory>>([]);

  Future<void> getWalletHistory() async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getWalletHostory),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': users!.value.user_id,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      listofWalletHistory.value =
          jsonResponse.map((data) => walletHistory.fromJson(data)).toList();
    } else {
      throw Exception('فشل في تحميل الرسائل');
    }
  }

  /////////////////////////////////////............... Location........................./////////////

  //////////////////............................Get The Location..............///////////////////////
  RxBool aboutLocation = false.obs;
  RxBool locationPage = false.obs;
  RxBool showTheLocation = false.obs;
  RxBool showTheLocationInTheMap = false.obs;

  RxBool checkTheLocation = false.obs;
  RxBool MessageAboutLocationServiceEnable = false.obs;
  RxDouble displayLongLocation = 0.0.obs;
  RxDouble displayLatLocation = 0.0.obs;
  var myCurrentPositionLatitude = 2.2;
  var myCurrentPositionLongitude = 2.2;
  RxBool IsrequestPermissionDenied = false.obs;
  RxBool isVerificationLocationCompleted = false.obs;

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
/////////////////////////////////////////////////////////جلب الموقع الطريقة القديمة.....................//////////
  RxString address = "لايوجد عنوان".obs;
  RxBool noLocation = false.obs;
  Future<void> checkIsEnableLocationServices() async {
    checkTheLocation.value = true;
    bool services = await Geolocator.isLocationServiceEnabled();
    if (services) {
      LocationPermission per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied) {
        checkTheLocation.value = false;
        IsrequestPermissionDenied.value = true;
        per = await Geolocator.requestPermission();
      } else {
        Position position = await Geolocator.getCurrentPosition();
        myCurrentPositionLatitude = position.latitude;
        myCurrentPositionLongitude = position.longitude;
        upDateLocation(position.longitude, position.latitude);
        Future.delayed(Duration(seconds: 2), () {
          getDataUserInHome();
        });
        checkTheLocation.value = false;
        isVerificationLocationCompleted.value = true;
      }
    } else {
      checkTheLocation.value = false;
      MessageAboutLocationServiceEnable.value = true;
    }
  }

  Future<void> askPermissionOfLocation() async {
    await Geolocator.requestPermission();
    await checkIsEnableLocationServices();
  }

  ConvertIntoShortTextAddress() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(users!.value.lat, users!.value.log);
    Placemark placeMark = placemarks[0];

    // انشئ نص مختصر يحتوي على اسم المدينة والشارع
    String city = placeMark.locality ?? ''; // اسم المدينة
    String street = placeMark.street ?? ''; // اسم الشارع

    // قم بتجميع النص المختصر باللغة العربية
    String shortAddress = "$city، $street";

    // قم بتخزين النص المختصر في مكان مناسب (مثل متغير أو حالة)
    address.value = shortAddress;
  }

  /////////////Token////////////////////////

  Future<void> addToken() async {
    FirebaseMessaging.instance.getToken().then((value) async {
      final response = await http.post(
        Uri.parse(AppLinksApi.updateToken),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'token': value.toString(),
          'user_id': users!.value.user_id as int
        }),
      );
    });
  } /////////////Wallet////////////////////////

  Future<void> upDatAmount(String amount) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.updateAmount),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'amount': amount,
        'user_id': users!.value.user_id as int
      }),
    );
    getDataUserInHome();
  } /////////////Location UpDate////////////////////////

  Future<void> upDateLocation(double log, double lat) async {
    print("UpDateLocaionStart");
    final response = await http.post(
      Uri.parse(AppLinksApi.upDateLocation),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'log': log,
        'lat': lat,
        'user_id': users!.value.user_id as int
      }),
    );
    print("UpDateLocaionEnd");
  }

  //////////////////////////.............THe Orderssssssssssssssss...................................../////////////

  RxBool showDetialsOrder = false.obs;

  var currentOrder = Rxn<Orders>();

  void viewOrderDetails(Orders orders) {
    currentOrder.value = orders;

    showDetialsOrder.value = true;
  }

  int id_bussines = 0;

  getIdBussinesFromMemroy() {
    if (appServices.sharedPreferences.containsKey('IdBussines')) {
      id_bussines = appServices.sharedPreferences.get("IdBussines") as int;
    }
  }

  RxBool isNotTheBussines = false.obs;

  RxBool waitCreateOrder = false.obs;
  RxBool isCreateOrder = false.obs;
  RxBool isNotCreateOrder = false.obs;

  String generateRandOrder(int length) {
    var r = Random();
    const _chars = '1234567890';
    return List.generate(length, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  var theNewAmout = 0;
  RxBool isNoMoneyInWallet = false.obs;
  Future<void> creaetOrder(String total, String idbus, String code) async {
    if (address.value == "لايوجد عنوان") {
      noLocation.value = true;
    } else {
      if (listofBasket.value.length == 0) {
        isTheBasketEmpty.value = true;
      } else {
        if (users!.value.amount <= totalPrice.value) {
          isNoMoneyInWallet.value = true;
        } else if (users!.value.amount >= totalPrice.value) {
          initializeDateFormatting();
          Intl.defaultLocale = 'ar';
          DateTime now = DateTime.now();
          String format = 'hh:mm a';
          DateFormat formatter = DateFormat(format, 'ar');

          String arabicTime = formatter.format(now);
          String order = generateRandOrder(7);
          waitCreateOrder.value = true;
          final response = await http.post(
            Uri.parse(AppLinksApi.creaeOrder),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'order_number': order.toString(),
              'user_id': users!.value.user_id as int,
              'total': total.toString(),
              'special_code': specilcode.toString(),
              'business_account_id': idbus.toString(),
              'day_of_order':
                  "${DateFormat.MMM().format(DateTime.now()).toString()}-"
                      "${DateFormat.d().format(DateTime.now()).toString()}",
              'time_of_order': arabicTime.toString(),
              'code': code.toString(),
            }),
          );

          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(response.body);
            if (jsonResponse['status'] == 'success') {
              //////////
              addMessage("لقد تم إنشاء الطلبية برقم:$order",
                  "لقد انشئت الطلبية بنجاح ويتم الان مراجعتها من طِرف المتجر وسيتم إيفاءك بكافة المعلومات في الوقت المناسب");
/////////......//////
              addWalletHistory(
                  "${DateFormat.MMM().format(DateTime.now()).toString()}-"
                      "${DateFormat.d().format(DateTime.now()).toString()}",
                  "لقد تم تجميد مبلغ من محفظتك للطلبية التى تحمل رقم:$order",
                  total.toString());
              theNewAmout = users!.value.amount - totalPrice.value;
              upDatAmount(theNewAmout.toString());
              /////////
              getDataUserInHome();
              waitCreateOrder.value = false;
              bissineIdclear();
              clearCode();
              listofBasket.value.clear;
              totalPrice.value = 0;
              listofBasket.value.length = 0;
              newPriceBasket.value = "لايوجد خصم";
              showCode.value = false;
              waitCheckCode.value = false;
              isCodeTrue.value = false;
              isCodeNoTrue.value = false;
              oldPriceBasket.value = 0;

              codeEnter = "a";
              controllerOne.clear();
              isCreateOrder.value = true;
            } else {
              waitCreateOrder.value = true;
              isNotCreateOrder.value = true;
            }
          } else {
            waitCreateOrder.value = true;
            isNotCreateOrder.value = true;
          }
        }
      }
    }
  }

  final listofOrder = Rx<List<Orders>>([]);

  Future<void> getDataOrders() async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getOrder),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': users!.value.user_id as int,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      listofOrder.value =
          jsonResponse.map((data) => Orders.fromJson(data)).toList();
    } else {
      throw Exception('فشل في تحميل الطلبيات');
    }
  }

  /////////////////////..............################# Business.............//////////
  final listofBusiness = Rx<List<Business>>([]);

  Future<void> getDataBusiness() async {
    final response = await http.get(Uri.parse(AppLinksApi.getAllBusiness));

    if (response.statusCode == 200) {
      List<dynamic> Bsiness = json.decode(response.body)['data'];
      listofBusiness.value =
          Bsiness.map((json) => Business.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load buu');
    }
  }

  RxBool showDetialsBusiness = false.obs;

  var currentBusiness = Rxn<Business>();

  int idBusinessInPage = 0;

  void viewBusinessDetails(Business business) {
    currentBusiness.value = business;
    idBusinessInPage = currentBusiness.value?.business_account_id;
    getRatingBuss(currentBusiness.value?.business_account_id);
    showDetialsBusiness.value = true;
    fetchWebviews(currentBusiness.value?.business_account_id);
  }
  void viewBusinessDetailsInProdcus(var Idbusiness) {
    
    getRatingBuss(Idbusiness);
    showDetialsBusiness.value = true;
    fetchWebviews(Idbusiness);
  }
  clearInDetilasBusiness() {
    averageRatingBuss.value = 0;
    showDetialsBusiness.value = false;
  }

  ///////////////////////The MainType showing...............///////////////
  RxBool showTheProduct = true.obs;
  RxBool showTheBussines = false.obs;
  RxBool showTheAuction = false.obs;
  ////////////////////////////////////////////////...............The Ban..............////////////
  RxBool showTheBan = false.obs;
  RxBool waitBan = false.obs;
  RxBool isBan = false.obs;
  RxBool isNotBan = false.obs;
  int saveIdProductTOBan = 0;
  int saveBusinesssToBan = 0;
  String saveNameproductToBan = "";
  String saveStoreToBan = "";
/////////////////////Text Edit......................///////////
  TextEditingController controllerTheOne = new TextEditingController();
  TextEditingController controllerTheTwo = new TextEditingController();
  TextEditingController controllerTheThree = new TextEditingController();
  TextEditingController controllerTheFour = new TextEditingController();
  TextEditingController controllerTheFive = new TextEditingController();

  String controllerTheOneText = "a";
  String controllerTheTwoText = "a";
  String controllerTheThreeText = "a";
  String controllerTheFourText = "a";
  String controllerTheFiveText = "a";

  RxBool isChooesImage = false.obs;
  RxBool addImageWork = false.obs;
  RxInt makeCountImage = 0.obs;
  RxBool addImageWorkOne = false.obs;

  Uint8List? imageBytes;
  String imageName = "";

  Uint8List? imageBytesOne;
  String imageNameOne = "";
// دالة لرفع الصورة إلى السيرفر
  Future<void> uploadImageToServer() async {
    try {
      final uri = Uri.parse(AppLinksApi.addImage);
      final request = http.MultipartRequest('POST', uri)
        ..files.add(http.MultipartFile.fromBytes('image', imageBytes!,
            filename: imageName));
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // إذا كان الطلب ناجحًا، قم بمعالجة البيانات هنا
        print('Image uploaded successfully');

        // تصفير التعديلات
      } else {
        // إذا فشل الطلب، قم بمعالجة الخطأ هنا
        print('Failed to upload image');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> uploadImageToServerOne() async {
    try {
      final uri = Uri.parse(AppLinksApi.addImage);
      final request = http.MultipartRequest('POST', uri)
        ..files.add(http.MultipartFile.fromBytes('image', imageBytesOne!,
            filename: imageNameOne));
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // إذا كان الطلب ناجحًا، قم بمعالجة البيانات هنا
        print('Image uploaded successfully');

        // تصفير التعديلات
      } else {
        // إذا فشل الطلب، قم بمعالجة الخطأ هنا
        print('Failed to upload image');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final TheimageBytes = await pickedFile.readAsBytes();
      final filename = path.basename(pickedFile.path); // اسم الملف فقط
      imageName = filename; // يمكنك تعيينه كما هو أو تخصيصه حسب احتياجاتك

      imageBytes = Uint8List.fromList(TheimageBytes);
      addImageWork.value = true;
    } else {
      addImageWork.value = false;
    }
  }

  Future<void> pickImageOne() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final TheimageBytes = await pickedFile.readAsBytes();
      final filename = path.basename(pickedFile.path); // اسم الملف فقط
      imageNameOne = filename; // يمكنك تعيينه كما هو أو تخصيصه حسب احتياجاتك

      imageBytesOne = Uint8List.fromList(TheimageBytes);
      addImageWorkOne.value = true;
    } else {
      addImageWorkOne.value = false;
    }
  }

  clearController() {
    controllerTheOne.clear();
    controllerTheTwo.clear();
    controllerTheThree.clear();
    controllerTheFour.clear();
    controllerTheFive.clear();
    controllerTheOneText = "a";
    controllerTheTwoText = "a";
    controllerTheThreeText = "a";
    controllerTheFourText = "a";
    controllerTheFiveText = "a";
    addImageWork.value = false;

    addImageWorkOne.value = false;
  }

  Future<void> BanTheProduct(
      String name, String description, String banImage) async {
    waitBan.value = true;
    final response = await http.post(
      Uri.parse(AppLinksApi.addBan),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'ban_name': name,
        'ban_description': description,
        'ban_image':
            "https://kilyan.arabiagroup.me/kilyani/storage/images/$banImage",
        'ban_id_product': saveIdProductTOBan,
        'ban_id_bussines': saveBusinesssToBan,
        'ban_id_user': users!.value.user_id as int,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        waitBan.value = false;
        isBan.value = true;
      } else {
        waitBan.value = false;
        isNotBan.value = true;
      }
    } else {
      waitBan.value = false;
      isNotBan.value = true;
    }
  }

  final listofBan = Rx<List<Ban>>([]);

  Future<void> getDataBan() async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getBanUser),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': users!.value.user_id,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      listofMessages.value =
          jsonResponse.map((data) => messages.fromJson(data)).toList();
    } else {
      throw Exception('فشل في تحميل الحظر');
    }
  }
  ////////////////////////////////////////////////...............The Ask Business Account..............////////////

  RxBool waitAskBusiness = false.obs;
  RxBool isAskDone = false.obs;
  RxBool isNotAskDone = false.obs;
  RxBool isEmptyAsk = false.obs;

  Future<void> askCreateAccountBusiness(String name, String description,
      String image, String username, String password, String lic) async {
    if (controllerTheOneText == "a" ||
        controllerTheTwoText == "a" ||
        controllerTheThreeText == "a" ||
        controllerTheFourText == "a" ||
        addImageWorkOne.value == false ||
        addImageWork.value) {
      waitAskBusiness.value = true;
      final response = await http.post(
        Uri.parse(AppLinksApi.askBusiness),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'business_account_name': name,
          'business_account_description': description,
          'business_account_logo':
              "https://kilyan.arabiagroup.me/kilyani/storage/images/$image",
          'business_account_admin': username,
          'business_account_password': password,
          'business_license':
              "https://kilyan.arabiagroup.me/kilyani/storage/images/$lic",
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          waitAskBusiness.value = false;
          isAskDone.value = true;
        } else {
          waitAskBusiness.value = false;
          isNotAskDone.value = true;
        }
      } else {
        waitAskBusiness.value = false;
        isNotAskDone.value = true;
      }
    } else {
      isEmptyAsk.value = true;
    }
  }

////////////Login business.............///////////////

  Rx<Business>? business = Rx<Business>(Business(
      nameBuss: 0,
      logoBuss: 'لايوجد مستخدم',
      business_account_id: '',
      description: '',
      business_account_admin: '0',
      business_account_password: '0.0',
      business_license: '0.0',
      business_account_date: '0.0'));

  void setbBdusiness(Business newBusinsess) {
    business!.value = newBusinsess;
  }

  Future<void> loingbusinessAccount(String name, String password) async {
    if (nameInSingUp == "a" || passwordInSing == "a") {
      emptyLogin.value = true;
    } else {
      messageWait.value = true;
      final response = await http.post(
        Uri.parse(AppLinksApi.loginBusiness),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'business_account_admin': name,
          'business_account_password': password,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          messageWait.value = false;
          messageSuccessfully.value = true;
          // إنشاء كائن المستخدم من البيانات المستجابة
          Business business = Business.fromJson(jsonResponse['data']);
          setbBdusiness(business);
          Future.delayed(Duration(seconds: 1), () async {
            Get.offAll(HomeBuseiness());
            clearLoginOrSignUp();
          });
        } else {
          messageWait.value = false;
          errorLogin.value = true;
        }
      } else {
        messageWait.value = false;
        errorLogin.value = true;
      }
    }
  }

  ////////////////
  RxBool showDetialsAuction = false.obs;

  var currentAuction = Rxn<Auction>();

  void viewAuctionDetails(Auction auction) {
    currentAuction.value = auction;

    showDetialsAuction.value = true;
  }

  clearInDetilasAuction() {
    showDetialsAuction.value = false;
  }

  final listofAuction = Rx<List<Auction>>([]);

  Future<void> getDataAuction() async {
    final response = await http.get(Uri.parse(AppLinksApi.getAuctions));

    if (response.statusCode == 200) {
      List<dynamic> AuctionJson = json.decode(response.body)['data'];
      listofAuction.value =
          AuctionJson.map((json) => Auction.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Auction');
    }
  }

  Future<List<Auction>> getDataAuctionUser(String idAuction) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getAuctionsUser),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'business_account_id': idAuction,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Auction.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load  Auction');
    }
  }

  ///////////////////
  checkWallet() {
    print("///////////////////////////////${id_bussines}");
    print("///////////////////////////////${listofBasket.value.length}");
  }

  //////////////////////////////............Package................................///////////////
  var selectedPackage = Rxn<Package>();

  RxBool showThePackage = false.obs;
  final listofPackages = Rx<List<Package>>([]);

  Future<void> getDataPackages() async {
    try {
      final response = await http.get(Uri.parse(AppLinksApi.getPackaget));

      if (response.statusCode == 200) {
        List<dynamic> packageJson = json.decode(response.body)['data'];
        listofPackages.value =
            packageJson.map((json) => Package.fromJson(json)).toList();

        if (listofPackages.value.isNotEmpty) {
          selectedPackage.value =
              listofPackages.value.first; // تعيين الباقة الأولى
        }
      } else {
        throw Exception('Failed to load packages');
      }
    } catch (e) {
      print('Error fetching packages: $e');
    }
  }


  /////////////////////////..................................Auctions...............///////////////
  final listofAuctionUser = Rx<List<AuctionUser>>([]);
  String newPrice = "a";
  Future<List<AuctionUser>> getDataAcutionUser(String id) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getAuctionsUserAdd),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'auction_id': id,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => AuctionUser.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load  products');
    }
  }

  int priceAuctionHigh = 0;
  RxBool addAuctionData = false.obs;
  RxBool isPriceLessTheHigh = false.obs;
  Future<void> addAuction(dynamic id, dynamic price) async {
    if (int.parse(newPrice) <= priceAuctionHigh) {
      isPriceLessTheHigh.value = true;
    } else {
      isPriceLessTheHigh.value = false;

      if (newPrice == "a") {
      } else {
        initializeDateFormatting();
        Intl.defaultLocale = 'ar';
        DateTime now = DateTime.now();
        String format = 'hh:mm a';
        DateFormat formatter = DateFormat(format, 'ar');

        String arabicTime = formatter.format(now);
        final response = await http.post(
          Uri.parse(AppLinksApi.addAuction),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'user_id': users!.value.user_id as int,
            'auction_id': id,
            'price': price.toString(),
            'day': "${DateFormat.MMM().format(DateTime.now()).toString()}-"
                "${DateFormat.d().format(DateTime.now()).toString()}",
            'time': arabicTime.toString()
          }),
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status'] == 'success') {
            newPrice = "a";
            controllerOne.clear();
            addAuctionData.value = false;
            priceAuctionHigh = 0;
            addMessage(
                "لقد قمت بالمزايدة على :${currentAuction.value?.auctionName.toString()}",
                "لقد شاركت في المزاد الخاص وتم تجميد مبلغ المشاركة في المزاد وهو:${price.toString()}");

            addWalletHistory(
                "${DateFormat.MMM().format(DateTime.now()).toString()}-"
                    "${DateFormat.d().format(DateTime.now()).toString()}",
                "لقد تمت عملية مشاركتك في المزاد الخاص وتجميد مبلغ معين المزاد بإسم منتج:${currentAuction.value?.auctionName.toString()}",
                price.toString());
            theNewAmout = users!.value.amount - int.parse(price);
            upDatAmount(theNewAmout.toString());
            getDataUserInHome();
            // إنشاء كائن المستخدم من البيانات المستجابة
          } else {}
        }
      }
    }
  }

  //////////////////////////..................

  final discountPercentage = 0.10;

  RxString newPriceBasket = "لايوجد خصم".obs;
  RxBool showCode = false.obs;
  RxBool waitCheckCode = false.obs;
  RxBool isCodeTrue = false.obs;
  RxBool isCodeNoTrue = false.obs;

  RxInt oldPriceBasket = 0.obs;

  String codeEnter = "a";
  RxBool isTheCodeTheUser = false.obs;
  Future<void> checkTheCode(String code) async {
    if (users!.value.code == codeEnter) {
      isTheCodeTheUser.value = true;
    } else {
      waitCheckCode.value = true;
      final response = await http.post(
        Uri.parse(AppLinksApi.checkCode),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'code': code.toString(),
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success') {
          waitCheckCode.value = false;
          isCodeTrue.value = true;
          final discount = totalPrice * discountPercentage;
          var newPrice = totalPrice.value - discount;
          newPriceBasket.value = newPrice.toString();
          totalPrice.value = double.parse(newPriceBasket.value).toInt();
        } else {
          waitCheckCode.value = false;
          isCodeNoTrue.value = true;
        }
      } else {
        waitCheckCode.value = false;
        isCodeNoTrue.value = true;
      }
    }
  }

  RxBool storesTerms = false.obs;
///////////////////////////////////Store................////////
  String StoreRulesTitle = "#:إنشاء المتاجر ";
  String createStoreRules = '''
    • يُسمح لأصحاب المتاجر بإنشاء متاجرهم الخاصة.
    • يجب رفع بيانات المتجر بشكل كامل ودقيق، بما في ذلك:
      - الاسم.
      - الوصف.
      - اللوجو.
      - صورة من الرخصة التجارية.
    • تحتفظ المنصة بحق قبول طلب الانضمام للمتجر أو رفضه حسب المعلومات الواردة.
    • يجب أن تكون البيانات كاملة وواضحة.
    • يجب كتابة البيانات بلغة عربية صحيحة.
    • يجب ألا تحمل البيانات أي ملامح غموض أو خداع.
    • يُفضل تجنب استخدام عبارات مبالغة مثل “الأفضل” أو “الأقوى”.
  ''';

  String subscriptionRulesTitle = "#:الباقات";
  String subscriptionRules = '''
    • يجب على أصحاب المتاجر اختيار الباقة المناسبة لنشاطهم.
    • يجب أن تكون الباقات موضحة بشكل كامل، ولا يمكن بدء النشاط دون اختيار الباقة المناسبة.
  ''';
  String productAuctionRulesTitle = "#:المنتجات والمزادات";
  String productAuctionRules = '''
    • يجب اختيار وصف مناسب وصحيح عند رفع المنتجات أو بدء المزادات.
    • يجب أن تكون صور المنتجات والمزادات بخلفية بيضاء أو مقاربة لها وبدقة عالية.
    • يُمنع بشدة رفع صور المنتجات المخلة للآداب العامة أو تحمل صور نساء بأي شكل من الأشكال.
    • يجب أن يكون وصف المنتجات والمزادات خاليًا من صفات المبالغة أو الخداع أو الزيف.
    • يجب الالتزام بتوفير الألوان والأحجام المتوفرة لكل منتج عند رفعه إلى المنصة.
  ''';
  String orderRulesTitle = "#:الطلبيات";
  String orderRules = '''
    • يجب تسليم الطلبية إلى العميل في الوقت المناسب والمكان المناسب.
    • يجب إيصال الطلبية كما هو موضح ومطلوب دون تغيير المنتج أو جزء منه (مثل اللون أو الحجم).
    • يجب أن يتم تسليم الطلبية بنفس الجودة المعروضة للمنتج.
    • أي سوء أو انخفاض في جودة عملية التسليم يتحمله المتجر بشكل كامل.
    • يحق للمتجر رفض أي طلبية يراها غير مناسبة للتسليم من حيث الكمية أو الموقع الجغرافي.
  ''';
  String commissionAndDiscountRulesTitle = "#:التسويق";

  String commissionAndDiscountRules = '''
    • يحق للمستخدم استخدام أكواد التسويق لخفض إجمالي مبلغ الطلبية بنسبة 10%.
    • يحق للمستخدم الحصول على عمولة تسويق وخصمها من إجمالي مبلغ الطلبية بنسبة 3%. هذا يعني أن المستخدم يمكنه الاستفادة من ترويج المنتجات والحصول على مكافأة عندما يتم الشراء.
    • لا يُمكن التراجع عن عمليات التخفيض أو العمولة؛ حيث يكون هذا الحق محفوظًا للمنصة بشكل كامل.
  ''';

  String reportSystemRulesTitle = "#:البلاغات";

  // نظام البلاغات
  String reportSystemRules = '''
    • تُعامل البلاغات بجدية قصوى، ويتم فحص أي شكوى بدقة.
    • في حال وجود مخالفة، يتم حظر المتجر فورًا، والمخالفات الجسيمة يتم الرجوع إلى القضاء المختص للنشاط التجاري الإلكتروني لاتخاذ الإجراءات اللازمة.
  ''';
  String storeBanAndFreezeRulestitle = "#: حظر وتجميد الحسابات";

  // حظر وتجميد المتجر
  String storeBanAndFreezeRules = '''
    • يحق للمنصة حظر أو تجميد حساب المتجر في أي وقت تجده مخالفًا للقوانين والشروط والأحكام، دون الرجوع إلى المتجر أو إبلاغه بذلك.
  ''';

  ///////////////////////////////////users................////////

  String accountCreationRulesTitle = "#:الحسابات";

  String accountCreationRules = '''
    1. يُسمح للمستخدمين العاديين بإنشاء حساباتهم باستخدام اسم المستخدم وكلمة المرور.
    2. توفر المنصة لكل مستخدم كود تسويق خاص به ومحفظة إلكترونية.
    3. توفر المنصة وسيلة دقيقة وآمنة لحفظ بيانات المستخدم الشخصية.
    4. يجب على المستخدمين توخي الحذر وعدم مشاركة معلوماتهم الخاصة مع الآخرين لتجنب حظر الحساب.
  ''';

  // قوانين الموقع الجغرافي
  String geolocationRulestitle = "#:الموقع الجغرافي";

  String geolocationRules = '''
    1. يتم استخدام خرائط Google لتحديد موقع المستخدم بدقة.
    2. يجب على المستخدمين تفعيل خدمة الموقع على هواتفهم.
    3. عدم تفعيل أو تحديد الموقع الجغرافي يؤدي إلى تعطيل عملية طلب المنتجات.
    4. نحن نضمن سرية بيانات الموقع الجغرافي للمستخدم.
  ''';

  // قوانين استعراض المنتجات والمزادات

  String productAuctionReviewRulesTitle = "#:المنتجات والمزادات";

  String productAuctionReviewRules = '''
    1. يمكن للمستخدم تحديد التفاصيل المحددة عند طلب منتج، مثل المقاس أو اللون.
    2. المنصة لا تتحمل مسؤولية الأخطاء في الاختيار، وبمجرد إنشاء الطلبية بنجاح، يتم تجميد المبلغ ولا يمكن التراجع عنه.
    3. في حال المشاركة في مزاد على منتج، لا يمكن التراجع عن العرض، ويتم تجميد المبلغ حتى انتهاء موعد المزاد.
  ''';

  // قوانين المحفظة الإلكترونية
  String electronicWalletRulesTitle = "#:المحفظة الإلكترونية";

  String electronicWalletRules = '''
    1. يتم إنشاء المحفظة الإلكترونية لكل مستخدم عند إنشاء حسابه.
    2. يتم رفض عمليات الطلب أو المشاركة في المزاد عند عدم توفر رصيد كافٍ في المحفظة.
    3. يتم تجميد المبالغ بعد كل عملية إنشاء طلب أو دخول مزاد حتى انتهاء العملية أو رفضها من قبل المتجر.
  ''';

  String reportSystemRulesUsersTitle = "#:البلاغات";

  // قوانين البلاغات
  String reportSystemRulesUsers = '''
      - يمكن للمستخدمين الإبلاغ عن منتجات غير ملائمة أو مخالفة.
      - يجب أن يكون الإبلاغ دقيقًا وصادقًا.
      - المنصة تحتفظ بالحق في التعامل مع البلاغات بالطريقة المناسبة.
  ''';

  String marketingSystemRulestitle = "#:التسويق";

  // نظام التسويق
  String marketingSystemRules = '''
   
      - تتيح المنصة لكل مستخدم كود تسويق خاص به، حيث يمكن استخدامه للترويج للمنصة ومنتجاتها.
      - عند استخدام أي مستخدم لكود التسويق، يحصل صاحب الكود على نسبة 3% من إجمالي مبلغ الطلبية عند استكمال الطلب.
      - لا يحق للمستخدم المطالبة بأي أموال أو جهد مبذول للترويج للمنصة، إلا في حال توثيق عملية الطلب من خلال كود التسويق واكتمال العملية. سيتم خصم المبلغ تلقائيًا وتوجيهه إلى صاحب الكود.
      - يُمنع استخدام كود التسويق الخاص بالمستخدم في حالة تضارب المصالح.
  ''';

  ///////////////////////////check Is The Basket Empty Or no .....///////////

  RxBool isTheBasketReadyEmpty = false.obs;

  checkTheBasket() {
    Future.delayed(Duration(seconds: 2), () async {
      isTheBasketReadyEmpty.value = true;
    });
  }

  ////////////////////////Auth Account.............//////////
  RxBool showTheAuthCreaet = false.obs;
  RxBool isEmptyData = false.obs;
  RxInt stepOneAuthAcocunt = 0.obs;
  RxBool waitAddAuth = false.obs;
  RxBool IsAddAuth = false.obs;
  RxBool isTheAuthError = false.obs;
  String quOne = "a";
  String asOne = "a";
  String quTwo = "a";
  String asTwo = "a";
  String phoneNumber = "a";

  TextEditingController controllerOneAuth = TextEditingController();
  TextEditingController controllerTwoAuth = TextEditingController();
  TextEditingController controllerThreeAuth = TextEditingController();
  TextEditingController controllerFourAuth = TextEditingController();
  TextEditingController controllerFiveAuth = TextEditingController();

  Future<void> creaeAuth(
    String quTheOne,
    String anTheOne,
    String quTheTwo,
    String anTheTwo,
    String phoneAuth,
  ) async {
    waitAddAuth.value = true;
    final response = await http.post(
      Uri.parse(AppLinksApi.createAuth),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': users!.value.user_id as int,
        'question_one': quTheOne,
        'question_two': quTheTwo,
        'answer_one': anTheOne,
        'answer_two': anTheTwo,
        'user_phone': phoneAuth,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        waitAddAuth.value = false;
        IsAddAuth.value = true;
      } else {
        waitAddAuth.value = false;
        isTheAuthError.value = true;
      }
    } else {
      waitAddAuth.value = false;
      isTheAuthError.value = true;
    }
  }

  clearAuth() {
    stepOneAuthAcocunt.value = 0;
    waitAddAuth.value = false;
    IsAddAuth.value = false;
    isTheAuthError.value = false;
    quOne = "a";
    asOne = "a";
    quTwo = "a";
    asTwo = "a";
    phoneNumber = "a";
    showTheAuthCreaet.value = false;
    controllerOneAuth.clear();
    controllerTwoAuth.clear();
    controllerThreeAuth.clear();
    controllerFourAuth.clear();
    controllerFiveAuth.clear();
  }

  /////////////////////////////////...............ForgetPassword..................../////////////
  RxBool ForgetThePasswordPage = false.obs;
  RxBool ForgetThePasswordPageTwo = false.obs;
  RxBool ForgetThePasswordPageThree = false.obs;
  RxBool PageNewPassword = false.obs;

  RxBool isEmptyDataForagetPassword = false.obs;
  RxBool waitForgetPassword = false.obs;
  RxBool IsAddForgetPaswword = false.obs;
  RxBool IsAddForgetPaswwordError = false.obs;
  String anOnepForgetPassword = "a";
  String anTwoForgetPassword = "a";
  String PhoneNumberForgetPassword = "a";
  String NewPassewordForgetPassword = "a";

  TextEditingController controllerOneForgetPassword = TextEditingController();
  TextEditingController controllerTwoForgetPassword = TextEditingController();
  TextEditingController controllerThreeForgetPassword = TextEditingController();
  TextEditingController controllerFourForgetPassword = TextEditingController();

  Future<void> checkAuthData(String anThePagePassworsOne,
      String anThePagePassworsTwo, String phoneThePageForgetPassword) async {
    waitForgetPassword.value = true;

    final response = await http.post(
      Uri.parse(AppLinksApi.checkAuth),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'answer_one': anThePagePassworsOne.toString(),
        'answer_two': anThePagePassworsTwo.toString(),
        'user_phone': phoneThePageForgetPassword.toString(),
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        waitForgetPassword.value = false;

        Users user = Users.fromJson(jsonResponse['data']);
        setUser(user);

        PageNewPassword.value = true;
      } else {
        waitForgetPassword.value = false;
        IsAddForgetPaswwordError.value = true;
      }
    } else {
      waitForgetPassword.value = false;
      IsAddForgetPaswwordError.value = true;
    }
  }

  Future<void> upDatPassword(String passwordNewThePageForget) async {
    waitForgetPassword.value = true;
    final response = await http.post(
      Uri.parse(AppLinksApi.upDatePassword),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_password': passwordNewThePageForget,
        'user_id': users!.value.user_id as int,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        waitForgetPassword.value = false;
        IsAddForgetPaswword.value = true;
        Future.delayed(Duration(seconds: 5), () async {
          clearForgetPassword();
        });
      } else {
        waitForgetPassword.value = false;
        IsAddForgetPaswwordError.value = true;
      }
    } else {
      waitForgetPassword.value = false;
      IsAddForgetPaswwordError.value = true;
    }
  }

  clearForgetPassword() {
    ForgetThePasswordPage.value = false;
    ForgetThePasswordPageTwo.value = false;
    ForgetThePasswordPageThree.value = false;

    isEmptyDataForagetPassword.value = false;
    waitForgetPassword.value = false;
    IsAddForgetPaswword.value = false;
    IsAddForgetPaswwordError.value = false;
    anOnepForgetPassword = "a";
    anTwoForgetPassword = "a";
    PhoneNumberForgetPassword = "a";
    NewPassewordForgetPassword = "a";
    PageNewPassword.value = false;
    controllerOneForgetPassword.clear();
    controllerTwoForgetPassword.clear();
    controllerThreeForgetPassword.clear();
    controllerFourForgetPassword.clear();
    Get.offAll(WelcomeScreen());
  }

  ////////////////////

  RxBool statusAuthAccount = false.obs;
  RxBool isSendMessageAuthAccount = false.obs;

  checkStatuAuthAccount() {
    Future.delayed(Duration(seconds: 10), () async {
      if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
        if (users!.value.status_auth == 0) {
          if (isSendMessageAuthAccount.value == false) {
            statusAuthAccount.value = true;
          } else {}
        } else {
          statusAuthAccount.value = false;
        }
      } else {}
    });
  }

  ///////////////////In Foraget................/
  Future<void> getDataUserInMemoeryForget() async {
    users!.value.user_id = appServices.sharedPreferences.getInt('TheUserId');
    users!.value.user_name =
        appServices.sharedPreferences.getString('TheUserName');
    users!.value.code = appServices.sharedPreferences.getString('TheUserCode');
    users!.value.user_phone =
        appServices.sharedPreferences.getString('TheUserPhone');
    users!.value.amount =
        appServices.sharedPreferences.getString('TheUserAmount');
    users!.value.log = appServices.sharedPreferences.getDouble('TheUserLog');
    users!.value.lat = appServices.sharedPreferences.getDouble('TheUserLat');
    users!.value.status_auth =
        appServices.sharedPreferences.getString('statusAuth');

    ConvertIntoShortTextAddress();

    addToken();
  }

  Future<void> getDataUserInHomeForget() async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getdataUserId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': users!.value.user_id as int,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        Users user = Users.fromJson(jsonResponse['data']);

        setUser(user);
        f.value = users!.value.amount;

        saveDataUserInMemory(
            users!.value.user_id as int,
            users!.value.user_name.toString(),
            users!.value.code.toString(),
            users!.value.user_phone.toString(),
            users!.value.amount.toString(),
            users!.value.log,
            users!.value.lat,
            users!.value.status_auth.toString());

        ConvertIntoShortTextAddress();
      } else {}
    } else {}
  }

  //////////////////////////////////////////////////////Check Name Account///

/////////////////////////////////////////................Rating........................///////////////////
  RxBool showTheRatingProduct = false.obs;
  RxBool addRatintProduct = false.obs;
  RxInt numberOfRating = 0.obs;
  String theRatingText = "a";
  RxBool errorRating = false.obs;
  Future<void> addRating(
      String numberOfRatings, String textRating, String idProduct) async {
    messageWait.value = true;
    final response = await http.post(
      Uri.parse(AppLinksApi.addRating),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': users!.value.user_id,
        'id_product': idProduct,
        'text_rating': textRating,
        'rating': numberOfRatings,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        messageWait.value = false;
        messageSuccessfully.value = true;
        getRating(currentProduct.value!.id.toString());
        Future.delayed(Duration(seconds: 2), () async {
          messageSuccessfully.value = false;
          addRatintProduct.value = false;
          showTheRatingProduct.value = false;
          theRatingText = "a";
          controllerTheOne.clear();
          numberOfRating.value = 0;
        });
      } else {
        messageWait.value = false;
        errorRating.value = true;
      }
    } else {
      messageWait.value = false;
      errorRating.value = true;
    }
  }

  RxDouble averageRating = 0.0.obs;

  // في HomeController
  Future<List<Rating>> getRating(dynamic ProductId) async {
    try {
      final response = await http.post(
        Uri.parse(AppLinksApi.getRating),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'id_product': ProductId}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final data = jsonResponse['data'] as List;

        // تسجيل البيانات للتحقق منها
        print("Received ratings data: $data");

        List<Rating> ratings =
            data.map((item) => Rating.fromJson(item)).toList();

        // حساب المتوسط
        double total = 0;
        for (var rating in ratings) {
          if (rating.rating is int) {
            total += rating.rating.toDouble();
          } else if (rating.rating is String) {
            total += double.parse(rating.rating);
          } else {
            print("Unknown rating type: ${rating.rating.runtimeType}");
          }
        }

        averageRating.value = ratings.isNotEmpty ? total / ratings.length : 0.0;
        print("Calculated average: ${averageRating.value}");

        return ratings;
      } else {
        throw Exception("Failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching ratings: $e");
      throw Exception("Failed to load ratings");
    }
  }
  ///////////////////////...........Chat.........................///////////////

  RxBool showTheChat = false.obs;
  String chatText = "";

  Future<void> addChat(String chat, int idBuss) async {
    initializeDateFormatting();
    Intl.defaultLocale = 'ar';
    DateTime now = DateTime.now();
    String format = 'hh:mm a';
    DateFormat formatter = DateFormat(format, 'ar');
    String arabicTime = formatter.format(now);
    final response = await http.post(
      Uri.parse(AppLinksApi.addChat),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'day': "${DateFormat.MMM().format(DateTime.now()).toString()}-"
            "${DateFormat.d().format(DateTime.now()).toString()}",
        'time': arabicTime.toString(),
        'id_user': users!.value.user_id as int,
        'id_buss': idBuss,
        'chat_text': chat,
        'how_is_send': 1,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        controllerTheOne.clear();
        chatText = "";
      } else {
        print("h1");
      }
    } else {
      print("h2");
    }
  }

  final listOfTheChat = Rx<List<TheChat>>([]);

  Future<void> getChatData(dynamic idBuss) async {
    print("Loading get ChatData");
    final response = await http.post(
      Uri.parse(AppLinksApi.getChat),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': users!.value.user_id as int,
        'id_buss': idBuss,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse['status'] == 'success') {
        List<dynamic> dataList = jsonResponse['data'];

        listOfTheChat.value =
            dataList.map((data) => TheChat.fromJson(data)).toList();
      } else {}
    } else {
      throw Exception();
    }
  }

///////////////////................Conv..................//////////////////
  Future<void> addConv(dynamic idBuss) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.addConv),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': users!.value.user_id,
        'id_buss': idBuss,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == 'success') {
        showTheChat.value = true;
      } else {
        throw Exception('خطأ في الإضافة: ${jsonResponse['message']}');
      }
    } else {
      throw Exception(
          'فشل في الاتصال بالخادم: ${response.statusCode} ${response.reasonPhrase}');
    }
  }

  RxBool chatInConv = false.obs;

  var currentConv = Rxn<Conv>();

  void viewConv(Conv conv) {
    currentConv.value = conv;
    getChatData(currentConv.value?.business_account_id ?? 0);
    Future.delayed(Duration(milliseconds: 740), () async {
      chatInConv.value = true;
    });
  }

  final listOfConv = Rx<List<Conv>>([]);

  Future<void> getConvData() async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getConv),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': users!.value.user_id as int,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];

      listOfConv.value =
          jsonResponse.map((data) => Conv.fromJson(data)).toList();
    } else {
      throw Exception('فشل في تحميل المحادثات');
    }
  }

  Future<void> checkConv(dynamic idBuss) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.checkConv),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': users!.value.user_id,
        'id_buss': idBuss,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        getChatData(idBuss);
        showTheChat.value = true;
      } else {
        getChatData(idBuss);

        addConv(idBuss);
      }
    } else {}
  }

  /////////////////////////////////////////................Rating Buss........................///////////////////
  RxDouble averageRatingBuss = 0.0.obs;
  RxBool showTheRatingBuss = false.obs;
  RxBool addRatintBuss = false.obs;
  RxInt numberOfRatingBuss = 0.obs;
  String theRatingTextBuss = "a";
  RxBool errorRatingBuss = false.obs;
  Future<void> addRatingBuss(
      String numberOfRatings, String textRating, String id) async {
    messageWait.value = true;
    final response = await http.post(
      Uri.parse(AppLinksApi.addRatingBuss),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': users!.value.user_id,
        'id_buss': id,
        'text_rating': textRating,
        'rating': numberOfRatings,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        messageWait.value = false;
        messageSuccessfully.value = true;
        getRatingBuss(currentProduct.value!.id.toString());
        Future.delayed(Duration(seconds: 2), () async {
          messageSuccessfully.value = false;
          addRatintBuss.value = false;
          showTheRatingBuss.value = false;
          theRatingTextBuss = "a";
          controllerTheOne.clear();
          numberOfRatingBuss.value = 0;
        });
      } else {
        messageWait.value = false;
        errorRating.value = true;
      }
    } else {
      messageWait.value = false;
      errorRating.value = true;
    }
  }

  Future<List<Rating>> getRatingBuss(dynamic id) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getRatingBuss),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_buss': id as int,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      num totalRatings = 0; // تغيير النوع إلى `num` لتجنب الخطأ
      int numberOfRatings = jsonResponse.length;

      for (var data in jsonResponse) {
        final ratingItem = Rating.fromJson(data);

        if (ratingItem.rating is int) {
          totalRatings += ratingItem.rating;
        } else if (ratingItem.rating is String) {
          totalRatings += int.parse(ratingItem.rating);
        } else {
          print("النوع غير المتوقع: ${ratingItem.rating.runtimeType}");
        }
      }

      averageRatingBuss.value =
          numberOfRatings > 0 ? totalRatings / numberOfRatings : 0.0;
      print('Average Rating: ${averageRating.value}');
      return jsonResponse.map((data) => Rating.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load getRating');
    }
  }

  RxBool waitAddMessageChat = false.obs;

  /////////////////////
  String titleTheNo = "";
  String bodyTheNo = "";
  RxBool isSendNo = false.obs;

  static const _scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

  void sendTheNotification(String title, String thebody) async {
    var client = http.Client();
    try {
      var credentials = await obtainAccessCredentialsViaServiceAccount(
        ServiceAccountCredentials.fromJson(r'''
      {
        "type": "service_account",
        "project_id": "kilyani-ccfc8",
        "private_key_id": "defb94ebe2cb995ce7cbd725a4d0d3cb981ed903",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDMJabI2FaZ7W0U\nzyKxzkWq5QREJd/wo/fGkre9KvS70D92+fYtenQF/sPFNcVvekmx8CMQAlnpdv6c\nciJbUe+HJeF6Zk9NW2ACs8PNZts6FxCy3k+Jy7hyrbBlJpg2VB13I/gIOzCbihU/\n3U+p90pfDDmNyooKZpG6w/o3Rp9xUPP9Ohl95smycpMminpow22rH7/MPBXBnPPB\nuSB4MALy8j6cNYf/cPdgHbNIJ5vnioB6Fa/oMgKt0lNmVbEZmw1A8JkH+0lAMcZ6\naXqyvuoSqpUy9fqFFemKXmaxd0ErSoS3terdGn/Br0uri5dh5UZ1d3Nhe7JzcDIC\n7J/PR+azAgMBAAECggEADIFP7qSl5WbwVCJ+FxMyHE5MDRqe1aBNqLnLDIjplemj\nQZf9Nvr1yXo6JsXs8q+0fPRfSXdDZ7Q004OATETAHfC5l6RVvkDXKEM3vsjKrAvG\np5ZLm/7BLTEriX6sO0O6zFYFNwfdKeHy/EcDvr8ZrKnUirV58DopOh4QITuvv6Kg\nN+nw+x7zs7YYFupDdWSdpKmc7FFlb1uKL/KoqITTi7pRwuY2xTLaga3/ZJymPWHD\nL7CFnx9+Qa+NTITSsaUgdROoqTtoR+qThnpqTWMvaFq1Jznb8yvKszb03Q6U1I73\niYtbFHldoA0b2iMDq0HrRnSbODxuSYmaBKsQ5MpL/QKBgQDQuNGzuoRomhAyuQy0\nHLLjcTfBBtio7d5cI8GssUpGPn4xSo9Eirbt38LDMOFlxFg3ulLdMt0G6oDOj0Gb\nmgP3UBKP/rtS+trnndxnL2hG6OJnf9oQVRWTGI0R/dUgGBNkQODhkkmZaJwZ4WLK\nBUUgeaZKgWCK0A6Bys3dtiaPhQKBgQD6Y4x3Kwt5QNOkkGoDqiaaBesVIF27yeTR\nnZgD8mut8F9sao2CqA1/WBW+eMYsUKnYratWGEMSdAi6TklZagw4+AiudZ7hjqaV\n172FzKQ5p7fSQmWWpf157nnNm0bya1Mt0rKwWHdMWfwVnr3HUX4Hq2l+BFEyi3GI\nBxOYPjtG1wKBgD2c8TpO6ts9714pxhg9CImfWEgAz2A+p48ndvqVc0l9FR9T1Sr0\nj790eDfKbB7wcOIyfFeTti9edhuDqmhWdKlC19ft6Do8lvYcYX2MPwn/oSXQVfzQ\nQQglDS+scIeC0+aaSEgOOO+yM7JoGBNurtNBVddUjb0sYbvqtA6owIVJAoGAf+e2\na3GbrNcGxjvXTAPxMCDx05rzBui9cK62Zt3BT9tIg5Nyslmye2i9wszjPuP9v2gH\n7DT8nkKT6sfvBDP+BmP921DOVp6OTmEkuWKuSZ15c3jjeC9W6qB9rCAz/8X/eZr2\nGMs4NdKJyWmLvHPOk5BmlS8TY2SEHF6xDcZMdYUCgYBlXFGdpFpV7XpGX76gK14W\nBv4ukDq56eqvf4r3Q+rt+1x/cr5F9SYjlNL5ENBR6G8fMXX8tCh4tQalqugFC7cL\n0Pm32xFRTa6Wz+Wi83PB7Tt34ZYIerS52R3mMvwbSB08wo4LWftQEYeCfmNM6KAW\nHbCb/40OxCLSIq1oI0ECig==\n-----END PRIVATE KEY-----\n",
        "client_email": "kilyani-ccfc8@appspot.gserviceaccount.com",
        "client_id": "115345744149246964632",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/kilyani-ccfc8%40appspot.gserviceaccount.com",
        "universe_domain": "googleapis.com"

      }
      '''),
        _scopes,
        client,
      );
      if (credentials.accessToken.hasExpired) {
        credentials = await refreshCredentials(
          ServiceAccountCredentials.fromJson(r'''
        {
          "type": "service_account",
          ... // Same JSON content as above
        }
        ''') as ClientId,
          credentials.refreshToken! as AccessCredentials,
          client,
        );
      }
      var url = Uri.parse(
          'https://fcm.googleapis.com/v1/projects/kilyani-ccfc8/messages:send');
      var headersList = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${credentials.accessToken.data}'
      };
      var body = json.encode({
        "message": {
          "topic": "all",
          "notification": {
            "title": title.toString(),
            "body": thebody.toString(),
            "image": "",
          },
          "android": {"priority": "high"},
          "apns": {
            "headers": {"apns-priority": "10"}
          },
          "webpush": {
            "headers": {"Urgency": "high"}
          },
          "data": {
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "status": "done"
          }
        }
      });
      var res = await client.post(url, headers: headersList, body: body);
      if (res.statusCode >= 200 && res.statusCode < 300) {
        print("الإشعار تم إرساله بنجاح: ${res.body}");
        isSendNo.value = true;
        controllerOne.clear();
        controllerTwo.clear();
      } else {
        print("فشل في إرسال الإشعار: ${res.reasonPhrase}");
      }
    } catch (e) {
      print("حدث خطأ أثناء إرسال الإشعار: $e");
    } finally {
      client.close();
    }
  } //////////////////////////////////..........................Bills...................../////////////

  RxBool showTheBills = false.obs;
  final listOfBills = Rx<List<TheBills>>([]);

  checkBills() {
    getDataBills();
    showTheBills.value = true;
  }

  Future<void> getDataBills() async {
    final response = await http.post(
      Uri.parse(AppLinksApi.getBills),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': users!.value.user_id as int,
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      listOfBills.value =
          jsonResponse.map((data) => TheBills.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load  getDataBills');
    }
  }

  Future<void> AddBills(
    String linkString,
  ) async {
    final response = await http.post(
      Uri.parse(AppLinksApi.addBills),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': users!.value.user_id,
        'link_bill':
            "https://kilyan.arabiagroup.me/kilyani/storage/pdfs/$linkString",
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
      } else {}
    } else {}
  }

  /////////////
  ///
  RxBool showSearching = false.obs;

//////////////........جلب أحدث المنتجات............................///////////
  Future<List<Products>> getDataProductsDatabaseLastest() async {
    final response = await http.get(
      Uri.parse(AppLinksApi.getLastesrProduct),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load  products');
    }
  }

//////////////////////////....................جلب أعلى المنتجات تقييم.............///////
  Future<List<Products>> getDataProductsDatabaseTopRated() async {
    final response = await http.get(
      Uri.parse(AppLinksApi.topRatedProduct),
    );
    print("Status code: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load  products');
    }
  }

/////////////////////...................جلب أحدث المتاجر................///////
  final listofBusinessLast = Rx<List<Business>>([]);

  Future<void> getDataLastBusinessesDatabase() async {
    final response =
        await http.get(Uri.parse(AppLinksApi.getLastestBusinesess));

    if (response.statusCode == 200) {
      List<dynamic> Bsiness = json.decode(response.body)['data'];
      listofBusinessLast.value =
          Bsiness.map((json) => Business.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load buu');
    }
  }

//////////////........................جلب أحدلث المزادات...............//////
  final listofAuctionLast = Rx<List<Auction>>([]);

  Future<void> getDataLastAuctionDatabase() async {
    final response = await http.get(Uri.parse(AppLinksApi.getLastestAuctions));

    if (response.statusCode == 200) {
      List<dynamic> AuctionJson = json.decode(response.body)['data'];
      listofAuctionLast.value =
          AuctionJson.map((json) => Auction.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Auction');
    }
  }

  //////////////////////////شحن المـحفظة.................////////
  /// 🔹 إضافة شحن محفظة جديد
  TextEditingController NumberOfAccount = TextEditingController();
  TextEditingController priceCharge = TextEditingController();
  Future<void> addCharge({
    required String accountNumber,
    required int transferredAmount,
    String? receiptPicture,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(AppLinksApi.chargeWallet),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json", // طلب استجابة بصيغة JSON
        },
        body: jsonEncode({
          "user_id": users!.value.user_id as int,
          "account_number": accountNumber,
          "transferred_amount": transferredAmount.toDouble(),
          "receipt_picture": receiptPicture != null
              ? "https://kilyan.arabiagroup.me/kilyani/storage/images/$receiptPicture"
              : null,
        }),
      );

      // طباعة الرابط والاستجابة لمراجعة التفاصيل
      print("🔗 رابط API: ${AppLinksApi.chargeWallet}");
      print("📥 استجابة السيرفر: ${response.body}");

      if (response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        print("✅ تمت إضافة الشحنة بنجاح");
        print("📌 البيانات المسترجعة: $responseData");

        Get.snackbar(
          "نجاح",
          "تم إرسال بيانات عملية الشحن سيتم التاكد منها ثم إبلاغك بعملية شحن الرصيد",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        print("❌ فشل في الإضافة. رمز الحالة: ${response.statusCode}");
        print("🔍 تفاصيل الخطأ: ${response.body}");

        String errorMessage;
        try {
          var responseData = jsonDecode(response.body);
          errorMessage =
              responseData['message'] ?? "فشل في الإضافة، حاول مجددًا";
        } catch (e) {
          // إذا لم يكن الاستجابة JSON
          errorMessage = "فشل في الإضافة، تحقق من إعدادات السيرفر.";
        }

        Get.snackbar(
          "خطأ",
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("⚠️ خطأ غير متوقع: $e");
      Get.snackbar(
        "خطأ",
        "حدث خطأ غير متوقع، تحقق من اتصالك بالإنترنت",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  //////////////////Searching....................
  final listofBusinessSearch = Rx<List<Business>>([]);
  RxBool isLoadingListBussSearch = true.obs;

  Future<void> getDataBusinessesDatabaseSearch([String? search]) async {
    try {
      isLoadingListBussSearch.value = true;
      final response = await http.post(
        Uri.parse(AppLinksApi.getBusinessesSearch),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'search':
              search?.toString() ?? '', // إذا لم يُمرر قيمة، ترسل قيمة فارغة
        }),
      );

      if (response.statusCode == 200) {
        List<dynamic> businessData = json.decode(response.body)['data'];

        if (businessData.isEmpty) {
          print('البيانات التي تم جلبها فارغة');
          // إفراغ القائمة عند عدم وجود بيانات
          listofBusinessSearch.value = [];
        } else {
          print('تم جلب البيانات بنجاح: ${businessData.length} متجر');
          listofBusinessSearch.value =
              businessData.map((json) => Business.fromJson(json)).toList();
        }
      } else {
        print('فشل في تحميل المتاجر');
        throw Exception('Failed to load businesses');
      }
    } catch (e) {
      print('Error: $e');
      // في حالة حدوث خطأ، إفراغ القائمة لضمان ظهور رسالة عدم وجود بيانات
      listofBusinessSearch.value = [];
      throw Exception('Failed to load businesses');
    } finally {
      // تأكد من إيقاف مؤشر التحميل دائماً
      isLoadingListBussSearch.value = false;
    }
  }

  //////////////////////
  final listofAuctionSearch = Rx<List<Auction>>([]);
  RxBool isLoadingListAuctionSearch = true.obs;

  Future<void> getDataAuctionsDatabaseSearch([String? searchQuery]) async {
    try {
      isLoadingListAuctionSearch.value = true;

      // 1. بناء الرابط مع المعلمة الصحيحة
      final uri = Uri.parse(AppLinksApi.getAuctionsSearch).replace(
        queryParameters: {
          if (searchQuery != null && searchQuery.isNotEmpty)
            'auction_name': searchQuery, // التأكد من اسم المعلمة
        },
      );

      // 2. طباعة الرابط للتحقق
      print('Search URL: $uri');

      // 3. إرسال الطلب GET
      final response = await http.get(uri);

      // 4. معالجة الرد
      if (response.statusCode == 200) {
        final responseBody = json.decode(utf8.decode(response.bodyBytes));

        if (responseBody['status'] == 'success') {
          listofAuctionSearch.value = (responseBody['data'] as List)
              .map((json) => Auction.fromJson(json))
              .toList();
          print('تم جلب ${listofAuctionSearch.value.length} مزاد');
        } else {
          listofAuctionSearch.value = [];
        }
      } else {
        throw Exception('Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      listofAuctionSearch.value = [];
    } finally {
      isLoadingListAuctionSearch.value = false;
    }
  }

  void toggleDetails(String shoppingId) {
    if (showMoreDetails.value && (idShowMordeDetails.value == shoppingId)) {
      showMoreDetails.value = false;
    } else {
      showMoreDetails.value = true;
      idShowMordeDetails.value = shoppingId;
    }
  }

  ///////////location New..............
  RxBool isLoadingLocation = false.obs;
  Rxn<double> latitude = Rxn<double>();
  Rxn<double> longitude = Rxn<double>();
/////////////////////Just Get MapSearching...................//////

  // Function to get the current location
  Future<void> fetchCurrentLocation() async {
    try {
      // تحديث حالة التحميل
      isLoadingLocation.value = true;
      checkTheLocation.value = true;

      // 1. التحقق من تفعيل خدمة الموقع
      final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        await _handleLocationServiceDisabled();
        return;
      }

      // 2. التحقق من الأذونات
      final permissionStatus = await _checkAndRequestLocationPermissions();
      if (permissionStatus != LocationPermission.whileInUse &&
          permissionStatus != LocationPermission.always) {
        return;
      }

      // 3. محاولة الحصول على آخر موقع معروف
      final lastKnownPosition = await Geolocator.getLastKnownPosition();
      if (lastKnownPosition != null) {
        await _usePosition(lastKnownPosition, isLastKnown: true);
        return;
      }

      // 4. الحصول على الموقع الحالي مع مهلة محددة
      await _fetchCurrentPositionWithTimeout();
    } catch (e) {
      await _handleLocationError(e);
    } finally {
      // إعادة تعيين حالات التحميل
      isLoadingLocation.value = false;
      checkTheLocation.value = false;
    }
  }

// --- الدوال المساعدة ---
  Future<bool> ensureLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await requestLocationPermission();
    }
    // أرجع true إذا الإذن ممنوح، false خلاف ذلك
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  Future<LocationPermission> requestLocationPermission() async {
    return await Geolocator.requestPermission();
  }

  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> _handleLocationServiceDisabled() async {
    isLoadingLocation.value = false;
    await Get.dialog(
      AlertDialog(
        title: const Text("خدمة الموقع معطلة"),
        content: const Text("يرجى تفعيل خدمة الموقع لاستخدام هذه الميزة"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              await Geolocator.openLocationSettings();
            },
            child: const Text("فتح الإعدادات"),
          ),
        ],
      ),
    );
  }

  Future<LocationPermission> _checkAndRequestLocationPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      isLoadingLocation.value = false;
      Get.snackbar(
        "الإذن مطلوب",
        "يرجى منح إذن الوصول إلى الموقع من إعدادات التطبيق",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    }

    return permission;
  }

  Future<void> _usePosition(Position position,
      {bool isLastKnown = false}) async {
    latitude.value = position.latitude;
    longitude.value = position.longitude;

    // 1. أبقِ عملية رفع الموقع كما هي
    await upDateLocation(position.longitude, position.latitude);

    // 2. جلب بيانات المستخدم (تُحدّث users.value)
    await getDataUserInHome();

    // 3. بعد تحديث users. استخرج العنوان المختصر من الإحداثيات
    await ConvertIntoShortTextAddress();

    // 4. أخيرًا حدّث الحالة بأن الموقع جرى التحقق منه
    isVerificationLocationCompleted.value = true;

    if (isLastKnown) {
      Get.snackbar(
        "تم استخدام آخر موقع معروف",
        "جاري تحديث البيانات بناءً على آخر موقع مسجل",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        "نجاح",
        "تم تحديث موقعك الجغرافي بنجاح",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> _fetchCurrentPositionWithTimeout() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      ).timeout(
        const Duration(seconds: 25),
        onTimeout: () => throw TimeoutException(
            "استغرقت عملية الحصول على الموقع وقتاً طويلاً"),
      );

      await _usePosition(position);
    } catch (e) {
      await _handleLocationError(e);
    }
  }

  Future<void> _handleLocationError(dynamic error) async {
    String errorMessage = "حدث خطأ غير متوقع أثناء الحصول على الموقع";

    if (error is TimeoutException) {
      errorMessage = "تجاوزت عملية تحديد الموقع المهلة المسموح بها";
    } else if (error is PlatformException) {
      switch (error.code) {
        case 'PERMISSION_DENIED':
          errorMessage = "تم رفض إذن الوصول إلى الموقع";
          break;
        case 'LOCATION_SERVICES_DISABLED':
          errorMessage = "خدمة الموقع معطلة";
          break;
        case 'LOCATION_UPDATE_FAILURE':
          errorMessage = "فشل تحديث الموقع";
          break;
      }
    }

    Get.snackbar(
      "خطأ في الموقع",
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );

    // تسجيل الخطأ للتحليل
    debugPrint("Location Error: $error");
  }

  /////////
   var webviews = <StoreWebview>[].obs;

  /// جلب جميع روابط المتجر
Future<void> fetchWebviews(int bussId) async {
  try {
    final String requestUrl =
        'https://kilyan.arabiagroup.me/kilyani/public/webviews/$bussId';
    print('Request URL: $requestUrl');
    
    final response = await http.get(
      Uri.parse(requestUrl),
      headers: {'Accept': 'application/json'},
    );
    
    print('HTTP Status Code: ${response.statusCode}');
    print('HTTP Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'success') {
        final data = jsonResponse['data'] as List;
        try {
          webviews.value =
              data.map((e) => StoreWebview.fromJson(e)).toList();
        } catch (modelError) {
          print('خطأ في تحليل بيانات الـ StoreWebview: $modelError');
        }
      } else {
      }
    } else {
      String errorDetails;
      try {
        final parsedError = jsonDecode(response.body);
        errorDetails = parsedError['message'] ?? response.body;
      } catch (_) {
        errorDetails = response.body;
      }
     
    }
  } catch (e) {
    print(e);
    Get.snackbar('خطأ', 'حدث خطأ أثناء جلب البيانات: $e');
  }
}

Future<void> refreshStatuses() async {
    final res = await http.post(Uri.parse(AppLinksApi.refreshstatuses));
    if (res.statusCode != 200) {
      throw Exception('Failed to refresh statuses');
    }
  }
}
