class TheChat {
  var idChat;
  var day;
  var time;
  var idUser;
  var idBuss;
  var chatText;
  var howIsSend;
  var idDelete;
  var UserName;
  var BussName;

  TheChat({
    required this.idChat,
    required this.day,
    required this.time,
    required this.idUser,
    required this.idBuss,
    required this.chatText,
    required this.howIsSend,
    required this.idDelete,
    required this.UserName,
    required this.BussName,
  });

  factory TheChat.fromJson(Map<String, dynamic> json) {
    return TheChat(
      idChat: json['id_chat'] ?? 0,
      day: json['day'] ?? 0,
      time: json['time'] ?? 0,
      idUser: json['id_user'] ?? 0,
      idBuss: json['id_buss'] ?? 0,
      chatText: json['chat_text'] ?? 0,
      howIsSend: json['how_is_send'] ?? 0,
      idDelete: json['id_delete'] ?? 0,
      UserName: json['user']['user_name'] ?? 'Default Title',
      BussName: json['business']['business_account_name'] ?? 'Default Title',
    );
  }
}
