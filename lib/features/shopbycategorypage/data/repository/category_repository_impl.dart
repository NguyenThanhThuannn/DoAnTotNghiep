/* import '../../../../core/data_state.dart';
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
  Future<DataState<List<CategoryDataEntity>>> getCategory() async {
    try{
    final res = await _api.getCategory();
    return DataSucces(res!.data.category);
   } on DioError catch(e){
    return DataFailed(e);
   }
  }

  @override
  Future<DataState<List<ProductEntity>>> getSortedCategory(final bool ascending) async {
    try {
      final res = await _api.getCategory();
      List<CategoryItemModel> lst1 =[];
      List<CategoryProductModel> lst2=[];
      for (final i in res!.data.category){
        lst1.addAll(i.item!);
      }
      for(final i in lst1){
        lst2.addAll(i.pro!);
      }
      lst2.sort((final a, final b) => ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
      return DataSucces(lst2);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  } 
  
} */