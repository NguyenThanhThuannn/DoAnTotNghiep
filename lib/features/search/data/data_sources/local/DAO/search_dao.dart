import 'package:floor/floor.dart';

import '../../../models/search_model.dart';

@dao
abstract class SearchDao{
  @Insert()
  Future<void> insertItemSearch(SearchModel search);

  @delete
  Future<void> deleteItemSearch(SearchModel search);

  @Query('SELECT * FROM search_product')
  Future<List<SearchModel>> getSearches();
}