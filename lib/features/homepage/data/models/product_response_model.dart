import 'package:json_annotation/json_annotation.dart';
import '../../../orderpage/data/model/order_response_model.dart';
import '../../domain/entities/product.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel{
  ProductResponseModel({
    this.code,
    this.message,
    required this.data,
  });

  factory ProductResponseModel.fromJson(final Map<String, dynamic> json)=>_$ProductResponseModelFromJson(json);
  int? code;
  String? message;
  List<ProductModel> data;
  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}
/* class ProductModel{
  ProductModel({
    required this.bestselling,
    required this.dailydeals,
    required this.dailydealsweek,
    required this.dailydealsweek2,
    required this.recentbrowsing,
    required this.hotnewarrival,
    required this.todaysdeals,
  });
  factory ProductModel.fromJson(final Map<String, dynamic> json)=>_$ProductModelFromJson(json);
  List<BestSellingModel> bestselling;
  List<DailyDealsModel> dailydeals;
  List<DailyDealsWeekModel> dailydealsweek;
  List<DailyDealsWeek2Model> dailydealsweek2;
  List<RecentBrowsingModel> recentbrowsing;
  List<HotNewArrivalModel> hotnewarrival;
  List<TodaysDealsModel> todaysdeals;
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
} */
@JsonSerializable()
class ProductModel extends ProductEntity{
  ProductModel({
    this.id,
    this.category_id,
    this.name,
    this.description,
    this.product_image,
    this.created_at,
    this.updated_at,
    this.type,
    this.colors,
    this.sizes,
    this.storage,
    this.ram,
    this.material,
    this.product_item,
    this.category,
  });
  factory ProductModel.fromJson(final Map<String, dynamic> json)=>_$ProductModelFromJson(json);
  @override
  int ? id;
  @override
  int ? category_id;
  @override
  String ? name;
  @override
  String ? description;
  @override
  String ? product_image;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  @override
  String ? type;
  @override
  List<ColorsModel> ? colors;
  @override
  List<SizesModel> ? sizes;
  @override
  List<StorageModel> ? storage;
  @override
  List<Map<String, dynamic>> ? ram;
  @override
  List<MaterialModel> ? material;
  @override
  ProductItemsModel ? product_item;
  @override
  ProductCategoryModel ? category;
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ColorsModel extends ProductEntity{
  ColorsModel({
    this.name,
    this.class_bg,
    this.selectedClass,
  });
  factory ColorsModel.fromJson(final Map<String, dynamic> json)=>_$ColorsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ColorsModelToJson(this);
  @override
  final String ? name;
  @override
  @JsonKey(name: 'class')
  final String ? class_bg;
  @override
  final String ? selectedClass;
}

@JsonSerializable()
class SizesModel extends ProductEntity{
  SizesModel({
    this.name,
    this.inStock,
  });
  factory SizesModel.fromJson(final Map<String, dynamic> json)=>_$SizesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SizesModelToJson(this);
  @override
  final String ? name;
  @override
  final bool ? inStock;
}

@JsonSerializable()
class StorageModel extends ProductEntity{
  StorageModel({
    this.name,
    this.inStock,
  });
  factory StorageModel.fromJson(final Map<String, dynamic> json)=>_$StorageModelFromJson(json);
  Map<String, dynamic> toJson() => _$StorageModelToJson(this);
  @override
  final String ? name;
  @override
  final bool ? inStock;
}

@JsonSerializable()
class MaterialModel extends ProductEntity{
  MaterialModel({
    this.name,
    this.inStock,
  });
  factory MaterialModel.fromJson(final Map<String, dynamic> json)=>_$MaterialModelFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialModelToJson(this);
  @override
  final String ? name;
  @override
  final bool ? inStock;
}

@JsonSerializable()
class ProductItemsModel extends ProductEntity {
  ProductItemsModel({
    this.id,
    this.product_id,
    this.SKU,
    this.qty_in_stock,
    this.product_image,
    this.price,
    this.create_at,
    this.update_at,
    this.rating,
  });
  factory ProductItemsModel.fromJson(final Map<String, dynamic> json)=>_$ProductItemsModelFromJson(json);
  @override
  int ? id;
  @override
  int ? product_id;
  @override
  int ? SKU;
  @override
  int ? qty_in_stock;
  @override
  String ? product_image;
  @override
  String ? price;
  @override
  String ? create_at;
  @override
  String ? update_at;
  @override
  double ? rating;
  Map<String, dynamic> toJson() => _$ProductItemsModelToJson(this);
}
@JsonSerializable()
class ProductCategoryModel extends ProductEntity{
  ProductCategoryModel({
    this.id,
    this.parent_category_id,
    this.category_name,
    this.create_at,
    this.update_at,
  });
  factory ProductCategoryModel.fromJson(final Map<String, dynamic> json)=>_$ProductCategoryModelFromJson(json);
  @override
  int ? id;
  @override
  int ? parent_category_id;
  @override
  String ? category_name;
  @override
  String ? create_at;
  @override
  String ? update_at;
  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);
}
/* @JsonSerializable()
class SubDescriptionModel extends SubDescriptionEntity{
  SubDescriptionModel({
    required this.item,
  });
  @override
  String item;
  factory SubDescriptionModel.fromJson(Map<String, dynamic> json) => _$SubDescriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubDescriptionModelToJson(this);
}
@JsonSerializable()
class BundleProModel extends ProductEntity{
  BundleProModel({
    required this.price,
    required this.title,
  });
  @override
  String price;
  @override
  String title;
  factory BundleProModel.fromJson(Map<String, dynamic> json)=> _$BundleProModelFromJson(json);
  Map<String, dynamic> toJson() => _$BundleProModelToJson(this);
}
@JsonSerializable()
class RelateProModel extends ProductEntity{
  RelateProModel({
    required this.price,
    required this.title,
    this.price_sale,
    this.tag,
  });
  @override
  String price;
  @override
  String title;
  @override
  String? tag;
  @override
  String? price_sale;
  factory RelateProModel.fromJson(Map<String, dynamic> json)=>_$RelateProModelFromJson(json);
  Map<String, dynamic> toJson() =>_$RelateProModelToJson(this);
}
@JsonSerializable()
class DailyDealsModel extends DailyDealsEntity{
  DailyDealsModel({
    required this.tab,
    required this.pro,
  });
  factory DailyDealsModel.fromJson(final Map<String, dynamic> json) => _$DailyDealsModelFromJson(json);
  @override
  String ? tab;
  @override
  List<DailyDealsItemModel>? pro;
  Map<String, dynamic> toJson() => _$DailyDealsModelToJson(this);
}
@JsonSerializable()
class DailyDealsItemModel extends ProductEntity{
  DailyDealsItemModel({
    required this.price,
    required this.title,
    this.price_sale,
    this.tag,
  });
  factory DailyDealsItemModel.fromJson(final Map<String, dynamic> json)=>_$DailyDealsItemModelFromJson(json);
  @override
  String price;
  @override
  String title;
  @override
  String ? price_sale;
  @override
  String ? tag;
  Map<String, dynamic> toJson() => _$DailyDealsItemModelToJson(this);
}
@JsonSerializable()
class DailyDealsWeekModel extends ProductEntity{
  DailyDealsWeekModel({
    required this.price,
    required this.title,
    required this.price_sale,
    required this.SLTon,
    required this.SLDaBan,
  });
  factory DailyDealsWeekModel.fromJson(final Map<String,dynamic> json)=>_$DailyDealsWeekModelFromJson(json);
  @override
  String price;
  @override
  String title;
  @override
  String price_sale;
  @override
  int SLTon;
  @override
  int SLDaBan;
  Map<String, dynamic> toJson()=>_$DailyDealsWeekModelToJson(this);
}
@JsonSerializable()
class DailyDealsWeek2Model extends ProductEntity{
  DailyDealsWeek2Model({
    required this.price,
    required this.title,
    this.tag,
  });
  factory DailyDealsWeek2Model.fromJson(final Map<String,dynamic> json)=>_$DailyDealsWeek2ModelFromJson(json);
  @override
  String price;
  @override
  String title;
  @override
  String ? tag;
  Map<String, dynamic> toJson()=>_$DailyDealsWeek2ModelToJson(this);
}
@JsonSerializable()
class RecentBrowsingModel extends ProductEntity{
  RecentBrowsingModel({
    required this.price,
    required this.title,
  });
  factory RecentBrowsingModel.fromJson(final Map<String,dynamic> json) =>_$RecentBrowsingModelFromJson(json);
  @override
  String price;
  @override
  String title;
  Map<String, dynamic> toJson() => _$RecentBrowsingModelToJson(this);
}
@JsonSerializable()
class HotNewArrivalModel extends HotNewArrivalEntity{
  HotNewArrivalModel({
    required this.tab,
    required this.pro,
  });
  factory HotNewArrivalModel.fromJson(final Map<String, dynamic> json) => _$HotNewArrivalModelFromJson(json);
   @override
  String ? tab;
  @override
  List<HotNewArrivalItemModel>? pro;
  Map<String, dynamic> toJson() => _$HotNewArrivalModelToJson(this);
}
@JsonSerializable()
class HotNewArrivalItemModel extends ProductEntity{
  HotNewArrivalItemModel({
    required this.price,
    required this.title,
    required this.tag,
  });
  factory HotNewArrivalItemModel.fromJson(final Map<String, dynamic> json) => _$HotNewArrivalItemModelFromJson(json);
  @override
  String price;
  @override
  String title;
  @override
  String ? tag;
  Map<String, dynamic> toJson() => _$HotNewArrivalItemModelToJson(this);
}
@JsonSerializable()
class TodaysDealsModel extends TodaysDealsEntity{
  TodaysDealsModel({
    required this.tab,
    required this.pro,
  });
  factory TodaysDealsModel.fromJson(final Map<String, dynamic> json) => _$TodaysDealsModelFromJson(json);
  @override
  String tab;
  @override
  List<TodaysDealsItemModel>? pro;
  Map<String, dynamic> toJson()=>_$TodaysDealsModelToJson(this);
}
@JsonSerializable()
class TodaysDealsItemModel extends ProductEntity{
  TodaysDealsItemModel({
    required this.price,
    required this.title,
    required this.review,
  });
  factory TodaysDealsItemModel.fromJson(final Map<String, dynamic> json) => _$TodaysDealsItemModelFromJson(json);
  @override
  String price;
  @override
  String title;
  @override
  int review;
  Map<String, dynamic> toJson()=>_$TodaysDealsItemModelToJson(this);
} */