import '../../../core/data_state.dart';
import '../../../core/usecase.dart';
import 'payment_entity.dart';
import 'payment_repository.dart';

class GetPaymentUseCase implements UseCase<DataState<List<PaymentEntity>>,void>{
  GetPaymentUseCase(this._paymentRepository);
  final PaymentRepository _paymentRepository;
  
  @override
  Future<DataState<List<PaymentEntity>>> call({void params}) {
    return _paymentRepository.getPaymentType();
  }
}