import 'package:equatable/equatable.dart';

import '../../data/models/product_response_model.dart';
class ProductEntity extends Equatable{
  const ProductEntity({
    this.price,
    this.title,
    this.price_sale,
    this.tag,
    this.SLTon,
    this.SLDaBan,
    this.review
  });
  final String ? price;
  final String ? title;
  final String ? price_sale;
  final String ? tag;
  final int ? SLTon;
  final int ? SLDaBan;
  final int ? review;

  @override
  List<Object?> get props {
    return [price,title,price_sale,tag,SLTon,SLDaBan,review];
  }
}
class BestSellingEntity extends Equatable{
  const BestSellingEntity({
    this.price,
    this.title,
    this.price_sale,
  });
  final String ? price;
  final String ? title;
  final String ? price_sale;

  @override
  List<Object?> get props {
    return [price,title,price_sale];
  }
}

class DailyDealsEntity extends Equatable{
  DailyDealsEntity({
    this.tab,
    this.pro,
  });
  final String ? tab;
  List<DailyDealsItemModel>? pro;
  @override
  List<Object?> get props{
    return [tab,pro];
  }
}
class DailyDealsItemEntity extends Equatable{
  const DailyDealsItemEntity({
    this.price,
    this.title,
    this.price_sale,
    this.tag,
  });
  final String ? price;
  final String ? title;
  final String ? price_sale;
  final String ? tag;
  @override
  List<Object?> get props {
    return [price,title,price_sale,tag];
  }
}
class HotNewArrivalEntity extends Equatable{
  HotNewArrivalEntity({
    this.tab,
    this.pro,
  });
  final String ? tab;
  List<HotNewArrivalItemModel>? pro;
  @override
  List<Object?> get props{
    return [tab,pro];
  }
}
class TodaysDealsEntity extends Equatable{
  TodaysDealsEntity({
    this.tab,
    this.pro,
  });
  final String ? tab;
  List<TodaysDealsItemModel>? pro;
  @override
  List<Object?> get props{
    return [tab,pro];
  }
}