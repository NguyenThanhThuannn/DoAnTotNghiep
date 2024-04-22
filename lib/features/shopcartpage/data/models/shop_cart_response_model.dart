class ShopCartResponseModel{
  ShopCartResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  int? code;
  String? message;
  ShopCartData data;
}
class ShopCartData{
  ShopCartData({
    required this.type,
    this.tag,
    required this.title,
    this.price_sale,
    required this.price,
    required this.status,
    required this.description,
    required this.subDesItem,
    required this.SKU,
    required this.pro,
    required this.relatePro,
  });
  String type;
  String? tag;
  String title;
  String? price_sale;
  String price;
  bool status;
  String description;
  List<SubDescription> subDesItem;
  String SKU;
  List<Product> pro;
  List<Product> relatePro;
}
class SubDescription{
  SubDescription({
    required this.item,
  });
  String item;
}
class Product{
  Product({
    required this.price,
    this.price_sale,
    required this.title,
    this.tag,
  });
  String price;
  String? price_sale;
  String title;
  String? tag;

}