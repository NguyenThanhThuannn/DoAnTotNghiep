class Product {
  Product({
    required this.price,
    required this.title,
    this.tag,
    this.price_sale,
    this.SLDaBan,
    this.SLTon,
    this.review
  });
  String price;
  String title;
  String? price_sale;
  String? tag;
  int? SLDaBan;
  int? SLTon;
  int? review;
}