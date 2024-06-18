/* import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetDailyDealsWeek2UseCase implements UseCase<DataState<List<ProductEntity>>,void>{
  GetDailyDealsWeek2UseCase(this._productRepository);
  final ProductRepository _productRepository;
  
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getDailyDealsWeek2UseCase();
  }
  
} */