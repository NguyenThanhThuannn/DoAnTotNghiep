import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetBestSellingUseCase implements UseCase<DataState<List<ProductEntity>>,void>{
  GetBestSellingUseCase(this._productRepository);
  final ProductRepository _productRepository;
  
  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getProducts();
  }
  
}