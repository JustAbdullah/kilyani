class walletHistory {
  var wallet_history_id;
  var date;
  var date_of_operation;
  var description_of_operation;
  var transaction_amount;
  var user_id;

  walletHistory({
    required this.wallet_history_id,
    required this.date_of_operation,
    required this.description_of_operation,
    required this.transaction_amount,
    required this.user_id,
    required this.date,
  });

  factory walletHistory.fromJson(Map<String, dynamic> json) {
    return walletHistory(
      wallet_history_id: json['wallet_history_id'] ?? "",
      date_of_operation: json['date_of_operation'] ?? "",
      description_of_operation: json['description_of_operation'] ?? "",
      transaction_amount: json['transaction_amount'] ?? "",
      user_id: json['user_id'] ?? 0,
      date: json['date'] ?? 0,
    );
  }
}
