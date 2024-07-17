import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../../orderpage/domain/entities/order.dart';
import '../../domain/getShippingMethod.dart';

part 'shipping_method_event.dart';
part 'shipping_method_state.dart';

class ShippingMethodBloc extends Bloc<ShippingMethodEvent, ShippingMethodState> {
  ShippingMethodBloc(this._getShippingMethodUseCase) : super(ShippingMethodLoading()) {
    on<GetShippingMethods>(onShippingMethod);
  }
  final GetShippingMethodUseCase _getShippingMethodUseCase;
  Future<void> onShippingMethod (final GetShippingMethods event, final Emitter<ShippingMethodState> emit) async{
    final dataState = await _getShippingMethodUseCase();
    if(dataState is DataSucces && dataState.data!=null){
      emit(ShippingMethodLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(ShippingMethodError(dataState.error!));
    }
  }
}
