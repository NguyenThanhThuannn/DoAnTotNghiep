import '../../../../core/usecase.dart';
import '../../../homepage/domain/entities/product.dart';
import '../entities/search.dart';
import '../repository/search_repository.dart';

class SaveItemSearchUseCase implements UseCase<void, SearchEntity>{
  SaveItemSearchUseCase(this._searchRepository);
  final SearchRepository _searchRepository;
  
  @override
  Future<void> call({final SearchEntity ? params}) {
    return _searchRepository.saveSearches(params!);
  }
  
}