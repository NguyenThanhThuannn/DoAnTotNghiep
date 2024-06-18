/* import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../../../homepage/domain/entities/product.dart';
import '../repository/category_repository.dart';

class GetSortedUseCase implements UseCase<DataState<List<ProductEntity>>,void>{
  GetSortedUseCase(this._categoryRepository);
  final CategoryRepository _categoryRepository;
  
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _categoryRepository.getSortedCategory(false);
  }
  
} */