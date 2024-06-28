import 'package:equatable/equatable.dart';
import '../../data/models/category_response_model.dart';

class CategoryEntity extends Equatable{
  const CategoryEntity({
    this.id,
    this.parent_category_id,
    this.category_name,
    this.created_at,
    this.updated_at,
  });
  final int ? id;
  final int ? parent_category_id;
  final String ? category_name;
  final String ? created_at;
  final String ? updated_at;
  
  @override
  List<Object?> get props {
    return [id,parent_category_id,category_name,created_at,updated_at];
  }
}