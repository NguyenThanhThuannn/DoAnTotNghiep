/* import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetRecentBrowsingUseCase implements UseCase<DataState<List<ProductEntity>>,void>{
  GetRecentBrowsingUseCase(this._productRepository);
  final ProductRepository _productRepository;
  
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getRecentBrowsingUseCase();
  }
  
} */