import 'package:equatable/equatable.dart';
import '../../../orderpage/data/model/order_response_model.dart';
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
  ProductEntity(
      {this.id,
      this.category_id,
      this.product_id,
      this.product,
      this.product_item_id,
      this.parent_category_id,
      this.category_name,
      this.SKU,
      this.qty,
      this.qty_in_stock,
      this.price,
      this.name,
      this.description,
      this.product_image,
      this.created_at,
      this.updated_at,
      this.rating,
      this.type,
      this.user_id,
      this.cart_id,
      this.class_bg,
      this.selectedClass,
      this.colors,
      this.sizes,
      this.ram,
      this.material,
      this.inStock,
      this.storage,
      this.product_item,
      this.category,
      this.order_id,
      this.user_review,});
  final int? id;
  final int? category_id;
  final int? product_id;
  final int? product_item_id;
  final int? parent_category_id;
  final String? category_name;
  final int? SKU;
  final int? qty;
  final int? qty_in_stock;
  final String? price;
  final String? name;
  final String? description;
  final String? product_image;
  final String? created_at;
  final String? updated_at;
  final double? rating;
  final String? type;
  final int? user_id;
  final int? cart_id;
  final String ? class_bg;
  final String ? selectedClass;
  List<ColorsModel>? colors;
  List<SizesModel>? sizes;
  final bool ? inStock;
  List<StorageModel>? storage;
  List<Map<String,dynamic>>? ram;
  List<MaterialModel>? material;
  ProductItemsModel? product_item;
  ProductCategoryModel? category;
  ProductItemsModel ? product;
  //order
  int? order_id;
  UserReviewModel? user_review;

  @override
  List<Object?> get props {
    return [
      id,
      category_id,
      name,
      description,
      product_image,
      created_at,
      updated_at,
      product_id,
      product_item_id,
      SKU,
      qty,
      qty_in_stock,
      price,
      category_name,
      parent_category_id,
      rating,
      type,
      user_id,
      cart_id,
      class_bg,
      selectedClass,
      colors,
      sizes,
      inStock,
      storage,
      ram,
      material,
      product_item,
      category,
      order_id,
      user_review,
      product,
    ];
  }
}

class UserReview extends Equatable {
  UserReview(
      {this.id,
      this.user_id,
      this.ordered_product_id,
      this.rating_value,
      this.comment,
      this.created_at,
      this.updated_at,});
  int? id;
  int? user_id;
  int? ordered_product_id;
  int? rating_value;
  String? comment;
  String? created_at;
  String? updated_at;

  @override
  List<Object?> get props => [
    id,
    user_id,
    ordered_product_id,
    rating_value,
    comment,
    created_at,
    updated_at,
  ];
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