class messages {
  var message_id;
  var message_name;
  var message_description;
  var date_message;
  var is_read;

  messages(
      {required this.message_id,
      required this.message_name,
      required this.message_description,
      required this.date_message,
      required this.is_read});

  factory messages.fromJson(Map<String, dynamic> json) {
    return messages(
      message_id: json['message_id'] ?? 1,
      message_name: json['message_name'] ?? 'Default Title',
      message_description: json['message_description'] ?? 'Default image',
      date_message: json['date_message'] ?? '0',
      is_read: json['is_read'] ?? 0,
    );
  }
}
