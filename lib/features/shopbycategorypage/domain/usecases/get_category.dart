import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/category.dart';
import '../repository/category_repository.dart';

class GetCategoryUseCase implements UseCase<DataState<List<CategoryDataEntity>>,void>{
  GetCategoryUseCase(this._categoryRepository);
  final CategoryRepository _categoryRepository;
  
  @override
  Future<DataState<List<CategoryDataEntity>>> call({void params}) {
    return _categoryRepository.getCategory();
  }
}