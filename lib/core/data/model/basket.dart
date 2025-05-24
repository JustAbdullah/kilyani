class Basket {
  var productName;
  var shoppingId;
  var quantity;
  var price;
  var product_image;
  var size_name;
  var color_code;
  var color_name;

  Basket(
      {required this.productName,
      required this.shoppingId,
      required this.quantity,
      required this.price,
      required this.product_image,
      required this.size_name,
      required this.color_code,
      required this.color_name});

  factory Basket.fromJson(Map<String, dynamic> json) {
    return Basket(
      productName: json['product']['product_name'] ?? "Default",
      product_image: json['product']['product_image'] ?? 'Default Title',
      shoppingId: json['shopping_basket_id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0,
      size_name: json['sizes']['size_name'] ?? 'Default Title',
      color_code: json['colors']['color_code'] ?? 'Default Title',
      color_name: json['colors']['color_name'] ?? 'Default Title',
    );
  }
}
