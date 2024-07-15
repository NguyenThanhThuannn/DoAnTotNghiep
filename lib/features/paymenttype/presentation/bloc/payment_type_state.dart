part of 'payment_type_bloc.dart';

sealed class PaymentTypeState extends Equatable {
  PaymentTypeState({this.paymentType,this.error});
  final List<PaymentEntity>? paymentType;
  final DioError ? error;
  @override
  List<Object> get props => [paymentType!,error!];
}

final class PaymentTypeLoading extends PaymentTypeState {}
final class PaymentTypeLoaded extends PaymentTypeState {
  PaymentTypeLoaded(List<PaymentEntity> paymentType):super(paymentType: paymentType);
}
final class PaymentTypeError extends PaymentTypeState {
  PaymentTypeError(DioError error):super(error: error);
}