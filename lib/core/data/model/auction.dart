class Auction {
  final int auctionId;
  final String auctionName;
  final String auctionDescription;
  final String auctionBeginning;
  final String auctionEnd;
  final String auctionDay;
  final String auctionDayEnd;
  final String auctionImage;
  final int auctionStatus;
  final double openingPrice;
  final int businessAccountId;
  final String auctionDate;
  final String nameBuss;
  final String logoBuss;

  Auction({
    required this.auctionId,
    required this.auctionName,
    required this.auctionDescription,
    required this.auctionBeginning,
    required this.auctionEnd,
    required this.auctionDay,
    required this.auctionDayEnd,
    required this.auctionImage,
    required this.auctionStatus,
    required this.openingPrice,
    required this.businessAccountId,
    required this.auctionDate,
    required this.nameBuss,
    required this.logoBuss,
  });

  factory Auction.fromJson(Map<String, dynamic> json) {
    return Auction(
      auctionId: json['auction_id'] ?? 0,
      auctionName: json['auction_name'] ?? "",
      auctionDescription: json['auction_description'] ?? "",
      auctionBeginning: json['auction_beginning'] ?? "",
      auctionEnd: json['auction_end'] ?? "",
      auctionDay: json['auction_day'] ?? "",
      auctionDayEnd: json['auction_day_end'] ?? "",
      auctionImage: json['auction_image'] ?? "",
      auctionStatus: json['auction_status'] ?? 0,
      openingPrice: (json['opening_price'] ?? 0).toDouble(),
      businessAccountId: json['business_account_id'] ?? 0,
      auctionDate: json['auction_date'] ?? "",
      nameBuss: json['business']?["business_account_name"] ?? "",
      logoBuss: json['business']?["business_account_logo"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "auction_id": auctionId,
      "auction_name": auctionName,
      "auction_description": auctionDescription,
      "auction_beginning": auctionBeginning,
      "auction_end": auctionEnd,
      "auction_day": auctionDay,
      "auction_day_end": auctionDayEnd,
      "auction_image": auctionImage,
      "auction_status": auctionStatus,
      "opening_price": openingPrice,
      "business_account_id": businessAccountId,
      "auction_date": auctionDate,
      "business": {
        "business_account_name": nameBuss,
        "business_account_logo": logoBuss,
      },
    };
  }
}
