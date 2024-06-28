import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/category.dart';
import '../repository/category_repository.dart';

class GetCategoryUseCase implements UseCase<DataState<List<CategoryEntity>>,void>{
  GetCategoryUseCase(this._categoryRepository);
  final CategoryRepository _categoryRepository;
  
  @override
  Future<DataState<List<CategoryEntity>>> call({void params}) {
    return _categoryRepository.getCategory();
  }
}