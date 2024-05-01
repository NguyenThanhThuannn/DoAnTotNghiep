import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/product.dart';
import '../repository/product_repository.dart';

class GetTodaysDealsUseCase implements UseCase<DataState<List<TodaysDealsEntity>>,void>{
  GetTodaysDealsUseCase(this._productRepository);
  final ProductRepository _productRepository;
  
  @override
  Future<DataState<List<TodaysDealsEntity>>> call({void params}) {
    return _productRepository.getTodaysDealsUseCase();
  }
}