import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetDailyDealsUseCase implements UseCase<DataState<List<DailyDealsEntity>>,void>{
  GetDailyDealsUseCase(this._productRepository);
  final ProductRepository _productRepository;
  
  @override
  Future<DataState<List<DailyDealsEntity>>> call({void params}) {
    return _productRepository.getDailyDealsUseCase();
  }
  
}