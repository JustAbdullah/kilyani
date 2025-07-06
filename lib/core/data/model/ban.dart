class Ban {
  var ban_id;
  var ban_name;
  var ban_description;
  var ban_image;
  var ban_id_product;
  var ban_id_bussines;
  var ban_id_user;
  var ban_date;
  var business_account_id;
  var business_account_name;
  var business_account_description;
  var business_account_logo;
  var business_account_date;
  var product_id;
  var product_name;
  var product_description;
  var product_price;
  var image;
  var product_business_account;
  var product_date;

  Ban({
    required this.ban_id,
    required this.ban_name,
    required this.ban_description,
    required this.ban_image,
    required this.ban_id_product,
    required this.ban_id_bussines,
    required this.ban_id_user,
    required this.ban_date,
    required this.business_account_id,
    required this.business_account_name,
    required this.business_account_description,
    required this.business_account_logo,
    required this.business_account_date,
    required this.product_id,
    required this.product_name,
    required this.product_description,
    required this.product_price,
    required this.image,
    required this.product_business_account,
    required this.product_date,
  });

  factory Ban.fromJson(Map<String, dynamic> json) {
    return Ban(
      ban_id: json['ban_id'] ?? "Default",
      ban_name: json['ban_name'] ?? "Default",
      ban_description: json['ban_description'] ?? "Default",
      ban_image: json['ban_image'] ?? "Default",
      ban_id_product: json['ban_id_product'] ?? "Default",
      ban_id_bussines: json['ban_id_bussines'] ?? "Default",
      ban_id_user: json['ban_id_user'] ?? "Default",
      ban_date: json['ban_date'] ?? "Default",
      business_account_id:
          json['business']['business_account_id'] ?? 'Default Title',
      business_account_name:
          json['business']['business_account_name'] ?? 'Default Title',
      business_account_description:
          json['business']['business_account_description'] ?? 'Default Title',
      business_account_logo:
          json['business']['business_account_logo'] ?? 'Default Title',
      business_account_date:
          json['business']['business_account_date'] ?? 'Default Title',
      product_id: json['product']['product_id'] ?? 'Default Title',
      product_name: json['product']['product_name'] ?? 'Default Title',
      product_description:
          json['product']['product_description'] ?? 'Default Title',
      product_price: json['product']['product_price'] ?? 'Default Title',
      image: json['product']['image'] ?? 'Default Title',
      product_business_account:
          json['product']['product_business_account'] ?? 'Default Title',
      product_date: json['product']['product_date'] ?? 'Default Title',
    );
  }
}
