class TheBills {
  var BillsId;
  var BillsLink;
  var UserId;
  TheBills(
      {required this.BillsId, required this.BillsLink, required this.UserId});

  factory TheBills.fromJson(Map<String, dynamic> json) {
    return TheBills(
      BillsId: json['bill_id'] ?? 0,
      UserId: json['id_user'] ?? 'Default Title',
      BillsLink: json['link_bill'] ?? 'Default Title',
    );
  }
}
