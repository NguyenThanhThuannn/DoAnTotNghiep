import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetBestSellingUseCase implements UseCase<DataState<List<BestSellingEntity>>,void>{
  GetBestSellingUseCase(this._productRepository);
  final ProductRepository _productRepository;
  
  @override
  Future<DataState<List<BestSellingEntity>>> call({void params}) {
    return _productRepository.getBestSellingUseCase();
  }
  
}