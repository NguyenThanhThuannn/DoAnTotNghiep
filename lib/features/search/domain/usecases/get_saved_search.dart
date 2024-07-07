import '../../../../core/usecase.dart';
import '../../../homepage/domain/entities/product.dart';
import '../entities/search.dart';
import '../repository/search_repository.dart';

class GetSavedSearchUseCase implements UseCase<List<SearchEntity>,void>{
  final SearchRepository _searchRepository;
  GetSavedSearchUseCase(this._searchRepository);

  @override
  Future<List<SearchEntity>> call({void params}) {
    return _searchRepository.getSaveSearches();
  }

  
}