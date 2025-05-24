class WalletChargeModel {
  int chargeId;
  int userId;
  String accountNumber;
  double transferredAmount;
  String? receiptPicture;
  DateTime createdAt;
  UserModel user; // يحتوي على بيانات المستخدم

  WalletChargeModel({
    required this.chargeId,
    required this.userId,
    required this.accountNumber,
    required this.transferredAmount,
    this.receiptPicture,
    required this.createdAt,
    required this.user,
  });

  factory WalletChargeModel.fromJson(Map<String, dynamic> json) {
    return WalletChargeModel(
      chargeId: json['charge_id'],
      userId: json['user_id'],
      accountNumber: json['account_number'],
      transferredAmount: double.parse(json['transferred_amount'].toString()),
      receiptPicture: json['receipt_picture'],
      createdAt: DateTime.parse(json['created_at']),
      user: UserModel.fromJson(json['user']), // جلب بيانات المستخدم
    );
  }
}

class UserModel {
  int userId;
  String userName;
  String userPhone;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userPhone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      userName: json['user_name'],
      userPhone: json['user_phone'],
    );
  }
}
