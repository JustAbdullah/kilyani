class Conv {
  var user_id;
  var user_name;
  var code;
  var user_phone;
  var amount;
  var log;
  var lat;
  var status_auth;
  var nameBuss;
  var logoBuss;
  var business_account_id;
  var description;
  var business_account_admin;
  var business_account_password;
  var business_license;
  var business_account_date;
  Conv(
      {required this.user_id,
      required this.user_name,
      required this.code,
      required this.user_phone,
      required this.amount,
      required this.log,
      required this.lat,
      required this.status_auth,
      required this.nameBuss,
      required this.logoBuss,
      required this.business_account_id,
      required this.description,
      required this.business_account_admin,
      required this.business_account_password,
      required this.business_license,
      required this.business_account_date});

  factory Conv.fromJson(Map<String, dynamic> json) {
    return Conv(
      user_id: json['user']['user_id'] ?? 0,
      user_name: json['user']['user_name'] ?? '',
      code: json['user']['code'] ?? '',
      user_phone: json['user']['user_phone'] ?? '',
      amount: json['user']['amount'] ?? 0,
      log: json['user']['log'] ?? 0.0,
      lat: json['user']['lat'] ?? 0.0,
      status_auth: json['user']['status_auth'] ?? '0',
      nameBuss: json['business']['business_account_name'] ?? "",
      logoBuss: json['business']['business_account_logo'] ?? 'Default about',
      business_account_id:
          json['business']['business_account_id'] ?? 'Default about',
      description:
          json['business']['business_account_description'] ?? 'Default about',
      business_account_admin:
          json['business']['business_account_admin'] ?? 'Default about',
      business_account_password:
          json['business']['business_account_password'] ?? 'Default about',
      business_license: json['business']['business_license'] ?? 'Default about',
      business_account_date:
          json['business']['business_account_date'] ?? 'Default about',
    );
  }
}
