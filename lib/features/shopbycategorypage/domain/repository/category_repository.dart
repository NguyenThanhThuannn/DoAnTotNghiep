import '../../../../core/data_state.dart';
import '../../../homepage/domain/entities/product.dart';
import '../entities/category.dart';

abstract class CategoryRepository{
  Future<DataState<List<CategoryDataEntity>>> getCategory();
  Future<DataState<List<ProductEntity>>> getSortedCategory(bool ascending);
}