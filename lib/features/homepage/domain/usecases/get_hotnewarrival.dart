import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetHotNewArrivalUseCase implements UseCase<DataState<List<HotNewArrivalEntity>>,void>{
  GetHotNewArrivalUseCase(this._productRepository);
  final ProductRepository _productRepository;
  
  @override
  Future<DataState<List<HotNewArrivalEntity>>> call({void params}) {
    return _productRepository.getHotNewArrivalUseCase();
  }
}