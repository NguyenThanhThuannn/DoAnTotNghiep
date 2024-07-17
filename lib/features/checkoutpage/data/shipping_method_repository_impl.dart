import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../core/data_state.dart';
import '../../../network/api.dart';
import '../../orderpage/domain/entities/order.dart';
import '../domain/shipping_method_repository.dart';

class ShippingMethodRepositoryImpl implements ShippingMethodRepository{
  ShippingMethodRepositoryImpl(this._api);
  final Api _api;
  @override
  Future<DataState<List<ShippingMethodEntity>>> getShippingMethod() async {
    try{
    final res = await _api.getShippingMethod();
    log('Du lieu shipping_method: $res');
    return DataSucces(res!.data);
   } on DioError catch(e){
    return DataFailed(e);
   }
  }

}