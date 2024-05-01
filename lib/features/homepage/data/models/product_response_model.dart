import 'package:json_annotation/json_annotation.dart';

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
  ProductModel data;
  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}
@JsonSerializable()
class ProductModel{
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
}
@JsonSerializable()
class BestSellingModel extends ProductEntity{
  BestSellingModel({
    required this.type,
    required this.price,
    required this.title,
    required this.price_sale,
    required this.tag,
    required this.status,
    required this.description,
    required this.subDesItem,
    required this.SKU,
    required this.pro,
    required this.relatePro,
  });
  factory BestSellingModel.fromJson(final Map<String, dynamic> json)=>_$BestSellingModelFromJson(json);
  @override
  String? type;
  @override
  String price;
  @override
  String title;
  @override
  String price_sale;
  @override
  String? tag;
  @override
  bool? status;
  @override
  String? description;
  @override
  List<SubDescriptionModel>? subDesItem;
  @override
  String? SKU;
  @override
  List<BundleProModel>? pro;
  @override
  List<RelateProModel>? relatePro;
  Map<String, dynamic> toJson() => _$BestSellingModelToJson(this);
}
@JsonSerializable()
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
}