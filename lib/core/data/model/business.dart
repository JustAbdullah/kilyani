class Business {
  var nameBuss;
  var logoBuss;
  var business_account_id;
  var description;
  var business_account_admin;
  var business_account_password;
  var business_license;
  var business_account_date;
  Business(
      {required this.nameBuss,
      required this.logoBuss,
      required this.business_account_id,
      required this.description,
      required this.business_account_admin,
      required this.business_account_password,
      required this.business_license,
      required this.business_account_date});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      nameBuss: json['business_account_name'] ?? "",
      logoBuss: json['business_account_logo'] ?? 'Default about',
      business_account_id: json['business_account_id'] ?? 'Default about',
      description: json['business_account_description'] ?? 'Default about',
      business_account_admin: json['business_account_admin'] ?? 'Default about',
      business_account_password:
          json['business_account_password'] ?? 'Default about',
      business_license: json['business_license'] ?? 'Default about',
      business_account_date: json['business_account_date'] ?? 'Default about',
    );
  }
}
