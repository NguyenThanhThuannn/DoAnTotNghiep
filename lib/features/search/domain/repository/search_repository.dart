import '../../../homepage/domain/entities/product.dart';
import '../entities/search.dart';

abstract class SearchRepository{
  Future<List<SearchEntity>> getSaveSearches();
  Future<void> saveSearches(SearchEntity search);
  Future<void> removeSearches(SearchEntity search);
}