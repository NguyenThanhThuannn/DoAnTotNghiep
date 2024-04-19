class DrawerResponseModel{
  DrawerResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  int? code;
  String? message;
  DrawerModel data;
}
class DrawerModel{
  DrawerModel({
    required this.drawer,
  });
  final List<DrawerModelItem> drawer;
}
class DrawerModelItem{
  DrawerModelItem({
    required this.name,
    this.items
  });
  final String name;
  List<ItemModel>? items;
}
class ItemModel{
  ItemModel({
    required this.item,
  });
  String item;
}