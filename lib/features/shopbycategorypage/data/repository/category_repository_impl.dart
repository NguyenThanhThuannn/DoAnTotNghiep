import '../../../../core/data_state.dart';
import '../../../../network/api.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../domain/entities/category.dart';
import '../../domain/repository/category_repository.dart';
import 'package:dio/dio.dart';

import '../models/category_response_model.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  CategoryRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<CategoryEntity>>> getCategory() async {
    try{
    final res = await _api.getCategory();
    return DataSucces(res!.data);
   } on DioError catch(e){
    return DataFailed(e);
   }
  }

  /* @override
  Future<DataState<List<ProductEntity>>> getSortedCategory(final bool ascending) async {
    try {
      final res = await _api.getProduct();
      final List<ProductEntity> lst2 =[];
      for(final i in res!.data){
        lst2.add(i);
      }
      lst2.sort((final a, final b) => ascending ? a.product_item!.price!.compareTo(b.product_item!.price!) : b.product_item!.price!.compareTo(a.product_item!.price!));
      return DataSucces(lst2);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }  */
  
}