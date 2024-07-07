import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../../../network/api.dart';
import '../../domain/entities/order.dart';
import '../../domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository{
  OrderRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<OrderEntity>>> getOrder(int id) async {
    try{
    final res = await _api.getOrder(id);
    log('Du lieu order: $res');
    return DataSucces(res!.data);
   } on DioException catch(e){
    return DataFailed(e);
   }
  }
}