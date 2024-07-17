import '../../../core/data_state.dart';
import 'payment_entity.dart';

abstract class PaymentRepository{
  Future<DataState<List<PaymentEntity>>> getPaymentType();
}