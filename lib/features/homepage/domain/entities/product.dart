import 'package:equatable/equatable.dart';
import '../../data/models/product_response_model.dart';

/* class SubDescriptionEntity extends Equatable {
  const SubDescriptionEntity({
    this.item,
  });
  final String? item;
  @override
  List<Object?> get props {
    return [item];
  }
} */

class ProductEntity extends Equatable {
  ProductEntity({
    this.id,
    this.category_id,
    this.product_id,
    this.parent_category_id,
    this.category_name,
    this.SKU,
    this.qty_in_stock,
    this.price,
    this.name,
    this.description,
    this.product_image,
    this.create_at,
    this.update_at,
    this.rating,
    this.type,
    this.product_item,
    this.category,
  });
  final int? id;
  final int? category_id;
  final int? product_id;
  final int? parent_category_id;
  final String? category_name;
  final int? SKU;
  final int? qty_in_stock;
  final String? price;
  final String? name;
  final String? description;
  final String? product_image;
  final String? create_at;
  final String? update_at;
  final int ? rating;
  final String ? type;
  ProductItemsModel ? product_item;
  ProductCategoryModel ? category;
  @override
  List<Object?> get props {
    return [
      id,
      category_id,
      name,
      description,
      product_image,
      create_at,
      update_at,
      product_id,
      SKU,
      qty_in_stock,
      price,
      category_name,
      parent_category_id,
      rating,
      type,
      product_item,
      category,
    ];
  }
}
/* class BestSellingEntity extends Equatable{
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
} */