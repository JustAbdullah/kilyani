class StoreWebview {
  final int id;
  final int business_account_id;
  final String siteName;
  final String? description;
  final String url;

  StoreWebview({
    required this.id,
    required this.business_account_id,
    required this.siteName,
    this.description,
    required this.url,
  });

  factory StoreWebview.fromJson(Map<String, dynamic> json) {
    return StoreWebview(
      id: json['id'],
      business_account_id: json['business_account_id'],
      siteName: json['website_name'],
      description: json['description'],
      url: json['website_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'business_account_id': business_account_id,
      'website_name': siteName,
      'description': description,
      'website_url': url,
    };
  }
}