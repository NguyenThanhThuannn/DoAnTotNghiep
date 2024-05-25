import '../../../../network/api.dart';
import '../../domain/entities/search.dart';
import '../../domain/repository/search_repository.dart';
import '../data_sources/local/app_database.dart';
import '../models/search_model.dart';

class SearchRepositoryImpl implements SearchRepository{
  final Api _api;
  final AppDatabase _appDatabase;
  SearchRepositoryImpl(this._api,this._appDatabase);
  @override
  Future<List<SearchEntity>> getSaveSearches() {
    return _appDatabase.searchDAO.getSearches();
  }

  @override
  Future<void> removeSearches(SearchEntity search) {
    return _appDatabase.searchDAO.deleteItemSearch(SearchModel.fromEntity(search));
  }

  @override
  Future<void> saveSearches(SearchEntity search) {
    return _appDatabase.searchDAO.insertItemSearch(SearchModel.fromEntity(search));
  }

}