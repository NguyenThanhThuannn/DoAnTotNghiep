// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseModel _$ProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: ProductModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseModelToJson(
        ProductResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      bestselling: (json['bestselling'] as List<dynamic>)
          .map((e) => BestSellingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailydeals: (json['dailydeals'] as List<dynamic>)
          .map((e) => DailyDealsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailydealsweek: (json['dailydealsweek'] as List<dynamic>)
          .map((e) => DailyDealsWeekModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailydealsweek2: (json['dailydealsweek2'] as List<dynamic>)
          .map((e) => DailyDealsWeek2Model.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentbrowsing: (json['recentbrowsing'] as List<dynamic>)
          .map((e) => RecentBrowsingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotnewarrival: (json['hotnewarrival'] as List<dynamic>)
          .map((e) => HotNewArrivalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      todaysdeals: (json['todaysdeals'] as List<dynamic>)
          .map((e) => TodaysDealsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'bestselling': instance.bestselling,
      'dailydeals': instance.dailydeals,
      'dailydealsweek': instance.dailydealsweek,
      'dailydealsweek2': instance.dailydealsweek2,
      'recentbrowsing': instance.recentbrowsing,
      'hotnewarrival': instance.hotnewarrival,
      'todaysdeals': instance.todaysdeals,
    };

BestSellingModel _$BestSellingModelFromJson(Map<String, dynamic> json) =>
    BestSellingModel(
      price: json['price'] as String,
      title: json['title'] as String,
      price_sale: json['price_sale'] as String,
    );

Map<String, dynamic> _$BestSellingModelToJson(BestSellingModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'title': instance.title,
      'price_sale': instance.price_sale,
    };

DailyDealsModel _$DailyDealsModelFromJson(Map<String, dynamic> json) =>
    DailyDealsModel(
      tab: json['tab'] as String?,
      pro: (json['pro'] as List<dynamic>?)
          ?.map((e) => DailyDealsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyDealsModelToJson(DailyDealsModel instance) =>
    <String, dynamic>{
      'tab': instance.tab,
      'pro': instance.pro,
    };

DailyDealsItemModel _$DailyDealsItemModelFromJson(Map<String, dynamic> json) =>
    DailyDealsItemModel(
      price: json['price'] as String,
      title: json['title'] as String,
      price_sale: json['price_sale'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$DailyDealsItemModelToJson(
        DailyDealsItemModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'title': instance.title,
      'price_sale': instance.price_sale,
      'tag': instance.tag,
    };

DailyDealsWeekModel _$DailyDealsWeekModelFromJson(Map<String, dynamic> json) =>
    DailyDealsWeekModel(
      price: json['price'] as String,
      title: json['title'] as String,
      price_sale: json['price_sale'] as String,
      SLTon: json['SLTon'] as int,
      SLDaBan: json['SLDaBan'] as int,
    );

Map<String, dynamic> _$DailyDealsWeekModelToJson(
        DailyDealsWeekModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'title': instance.title,
      'price_sale': instance.price_sale,
      'SLTon': instance.SLTon,
      'SLDaBan': instance.SLDaBan,
    };

DailyDealsWeek2Model _$DailyDealsWeek2ModelFromJson(
        Map<String, dynamic> json) =>
    DailyDealsWeek2Model(
      price: json['price'] as String,
      title: json['title'] as String,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$DailyDealsWeek2ModelToJson(
        DailyDealsWeek2Model instance) =>
    <String, dynamic>{
      'price': instance.price,
      'title': instance.title,
      'tag': instance.tag,
    };

RecentBrowsingModel _$RecentBrowsingModelFromJson(Map<String, dynamic> json) =>
    RecentBrowsingModel(
      price: json['price'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$RecentBrowsingModelToJson(
        RecentBrowsingModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'title': instance.title,
    };

HotNewArrivalModel _$HotNewArrivalModelFromJson(Map<String, dynamic> json) =>
    HotNewArrivalModel(
      tab: json['tab'] as String?,
      pro: (json['pro'] as List<dynamic>?)
          ?.map(
              (e) => HotNewArrivalItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotNewArrivalModelToJson(HotNewArrivalModel instance) =>
    <String, dynamic>{
      'tab': instance.tab,
      'pro': instance.pro,
    };

HotNewArrivalItemModel _$HotNewArrivalItemModelFromJson(
        Map<String, dynamic> json) =>
    HotNewArrivalItemModel(
      price: json['price'] as String,
      title: json['title'] as String,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$HotNewArrivalItemModelToJson(
        HotNewArrivalItemModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'title': instance.title,
      'tag': instance.tag,
    };

TodaysDealsModel _$TodaysDealsModelFromJson(Map<String, dynamic> json) =>
    TodaysDealsModel(
      tab: json['tab'] as String,
      pro: (json['pro'] as List<dynamic>?)
          ?.map((e) => TodaysDealsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodaysDealsModelToJson(TodaysDealsModel instance) =>
    <String, dynamic>{
      'tab': instance.tab,
      'pro': instance.pro,
    };

TodaysDealsItemModel _$TodaysDealsItemModelFromJson(
        Map<String, dynamic> json) =>
    TodaysDealsItemModel(
      price: json['price'] as String,
      title: json['title'] as String,
      review: json['review'] as int,
    );

Map<String, dynamic> _$TodaysDealsItemModelToJson(
        TodaysDealsItemModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'title': instance.title,
      'review': instance.review,
    };
