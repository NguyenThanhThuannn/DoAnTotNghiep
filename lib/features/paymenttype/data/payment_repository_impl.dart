import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../core/data_state.dart';
import '../../../network/api.dart';
import '../domain/payment_entity.dart';
import '../domain/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository{
  PaymentRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<PaymentEntity>>> getPaymentType() async {
    try{
    final res = await _api.getPaymentType();
    log('Du lieu payment type: $res');
    return DataSucces(res!.data);
   } on DioException catch(e){
    return DataFailed(e);
   }
  }
}