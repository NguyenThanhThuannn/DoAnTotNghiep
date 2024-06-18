import 'dart:developer';

import '../../../../core/data_state.dart';
import '../../../../network/api.dart';
import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl implements ProductRepository{
  ProductRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<ProductEntity>>> getProducts() async{
   try{
    final res = await _api.getProduct();
    log('Du lieu:$res');
    return DataSucces(res!.data);
   } on DioError catch(e){
    return DataFailed(e);
   }
  }
  
  /* @override
  Future<DataState<List<DailyDealsEntity>>> getDailyDealsUseCase()async {
    try{
      final res = await _api.getdailydeals();
      return DataSucces(res!.data.dailydeals);
    }on DioError catch(e){
      return DataFailed(e);
    }
  }
  @override
  Future<DataState<List<ProductEntity>>> getRecentBrowsingUseCase()async {
    try{
      final res = await _api.getdailydeals();
      return DataSucces(res!.data.recentbrowsing);
    }on DioError catch(e){
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<List<ProductEntity>>> getDailyDealsWeek2UseCase() async {
    try{
      final res = await _api.getProduct();
      return DataSucces(res!.data.dailydealsweek2);
    }on DioError catch(e){
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<List<ProductEntity>>> getDailyDealsWeekUseCase() async {
    try{
      final res = await _api.getProduct();
      return DataSucces(res!.data.dailydealsweek);
    }on DioError catch(e){
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<List<HotNewArrivalEntity>>> getHotNewArrivalUseCase()async {
    try{
      final res = await _api.getProduct();
      return DataSucces(res!.data.hotnewarrival);
    }on DioError catch(e){
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<List<TodaysDealsEntity>>> getTodaysDealsUseCase() async{
    try{
      final res = await _api.getProduct();
      return DataSucces(res!.data.todaysdeals);
    }on DioError catch(e){
      return DataFailed(e);
    }
  } */
}