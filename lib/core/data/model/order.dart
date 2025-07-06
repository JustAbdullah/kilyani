class Orders {
  var order_id;
  var user_id;
  var total;
  var order_number;
  var order_status;
  var time_order_user;
  var date_order_user;
  var order_date;
  var nameBuss;
  var logoBuss;
  var business_account_id;
  var description;
  var specialCode;
  var day_get_order;

  Orders({
    required this.order_id,
    required this.user_id,
    required this.total,
    required this.order_number,
    required this.order_status,
    required this.time_order_user,
    required this.date_order_user,
    required this.order_date,
    required this.nameBuss,
    required this.logoBuss,
    required this.business_account_id,
    required this.description,
    required this.specialCode,
    required this.day_get_order,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      order_id: json['order_id'] ?? 0,
      user_id: json['user_id'] ?? 0,
      total: json['total'] ?? 0,
      order_number: json['order_number'] ?? 0,
      order_status: json['order_status'] ?? 2,
      time_order_user: json['time_of_order'] ?? '',
      date_order_user: json['day_of_order'] ?? '',
      order_date: json['order_date'] ?? '',
      specialCode: json['special_code'] ?? '',
      day_get_order: json['day_get_order'] ?? '',
      nameBuss: json['business']['business_account_name'] ?? "",
      logoBuss: json['business']['business_account_logo'] ?? 'Default about',
      business_account_id:
          json['business']['business_account_id'] ?? 'Default about',
      description:
          json['business']['business_account_description'] ?? 'Default about',
    );
  }
}
