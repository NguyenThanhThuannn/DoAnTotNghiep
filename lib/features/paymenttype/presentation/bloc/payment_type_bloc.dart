import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../../../widgets/payment.dart';
import '../../domain/getPaymentType.dart';
import '../../domain/payment_entity.dart';

part 'payment_type_event.dart';
part 'payment_type_state.dart';

class PaymentTypeBloc extends Bloc<PaymentTypeEvent, PaymentTypeState> {
  PaymentTypeBloc(this._getPaymentUseCase) : super(PaymentTypeLoading()) {
    on<GetPaymentTypes>(onPaymentType);
  }
  final GetPaymentUseCase _getPaymentUseCase;
  Future<void> onPaymentType(final GetPaymentTypes event, final Emitter<PaymentTypeState> emit) async{
    final dataState = await _getPaymentUseCase();
    //emit(FavouriteLoading());
    if(dataState is DataSucces && dataState.data!=null){
      emit(PaymentTypeLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(PaymentTypeError(dataState.error!));
    }
  }
}
