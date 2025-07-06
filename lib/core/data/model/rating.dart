class Rating {
  var id_rating;
  var text_rating;
  var rating;
  var user_name;

  Rating({
    required this.id_rating,
    required this.text_rating,
    required this.rating,
    required this.user_name,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id_rating: json['id_rating'] ?? 0,
      text_rating: json['text_rating'] ?? '',
      rating: json['rating'] ?? '',
      user_name: json['user']['user_name'] ?? '',
    );
  }
}
