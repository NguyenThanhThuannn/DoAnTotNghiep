import '../../../../core/data_state.dart';
import '../entities/product.dart';

abstract class ProductRepository{
  Future<DataState<List<ProductEntity>>> getBestSellingUseCase();
  Future<DataState<List<DailyDealsEntity>>> getDailyDealsUseCase();
  Future<DataState<List<ProductEntity>>> getDailyDealsWeekUseCase();
  Future<DataState<List<ProductEntity>>> getDailyDealsWeek2UseCase();
  Future<DataState<List<ProductEntity>>> getRecentBrowsingUseCase();
  Future<DataState<List<HotNewArrivalEntity>>> getHotNewArrivalUseCase();
  Future<DataState<List<TodaysDealsEntity>>> getTodaysDealsUseCase();
}