class Users {
  var user_id;
  var user_name;
  var code;
  var user_phone;
  var amount;
  var log;
  var lat;
  var status_auth;

  Users(
      {required this.user_id,
      required this.user_name,
      required this.code,
      required this.user_phone,
      required this.amount,
      required this.log,
      required this.lat,
      required this.status_auth});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      user_id: json['user_id'] ?? 0,
      user_name: json['user_name'] ?? '',
      code: json['code'] ?? '',
      user_phone: json['user_phone'] ?? '',
      amount: json['amount'] ?? 0,
      log: json['log'] ?? 0.0,
      lat: json['lat'] ?? 0.0,
      status_auth: json['status_auth'] ?? '0',
    );
  }
}
