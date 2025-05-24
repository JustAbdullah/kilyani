class AuctionUser {
  var price;
  var day;
  var time;
  var date;
  var userName;

  AuctionUser({
    required this.price,
    required this.day,
    required this.time,
    required this.date,
    required this.userName,
  });

  factory AuctionUser.fromJson(Map<String, dynamic> json) {
    return AuctionUser(
      price: json['price'] ?? "Default",
      day: json['day'] ?? 'Default Title',
      time: json['time'] ?? 0,
      date: json['date'] ?? 0,
      userName: json['user']['user_name'] ?? 0,
    );
  }
}
