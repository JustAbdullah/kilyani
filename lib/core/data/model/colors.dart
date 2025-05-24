class ProductsColors {
  var productColorId;
  var ColorId;

  var colorName;
  var colorCode;
  ProductsColors(
      {required this.productColorId,
      required this.colorName,
      required this.colorCode,
      required this.ColorId});

  factory ProductsColors.fromJson(Map<String, dynamic> json) {
    return ProductsColors(
      productColorId: json['products_color_id'] ?? 0,
      ColorId: json['color_id'] ?? 0,
      colorName: json['colors']['color_name'] ?? 'Default Title',
      colorCode: json['colors']['color_code'] ?? 'Default Title',
    );
  }
}
