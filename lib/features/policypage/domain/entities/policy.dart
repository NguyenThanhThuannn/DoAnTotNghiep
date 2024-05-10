import 'package:equatable/equatable.dart';

import '../../data/models/policy_response_model.dart';

class PolicyItemEntity extends Equatable{
  PolicyItemEntity({
    this.title,
    this.item,
  });
  final String ? title;
  final List<ItemModel> ? item;

  @override
  List<Object?> get props {
    return [title,item];
  }
}

class ItemEntity extends Equatable{
  const ItemEntity({
    this.title,
  });
  final String ? title;
  
  @override
  List<Object?> get props {
    return [title];
  }
}