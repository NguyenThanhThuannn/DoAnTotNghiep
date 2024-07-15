
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/order.dart';
import '../../domain/usecases/getOrder.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this._getOrderUseCase) : super(OrderLoading()) {
    on<GetOrders>(onGetOrder);
    on<GetOrders2>(onGetOrder2);
  }
  Future<void> onGetOrder(final GetOrders event, final Emitter<OrderState> emit) async{
    final dataState = await _getOrderUseCase(params: event.userId);
    //emit(OrderLoading());
    if(dataState is DataSucces && dataState.data!=null){
      emit(OrderLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(OrderError(dataState.error!));
    }
  }
  Future<void> onGetOrder2(final GetOrders2 event, final Emitter<OrderState> emit) async{
    emit(OrderLoading());
    final dataState = await _getOrderUseCase(params: event.userId);
    
    if(dataState is DataSucces && dataState.data!=null){
      
      emit(OrderLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(OrderError(dataState.error!));
    }
  }
  final GetOrderUseCase _getOrderUseCase;
  
}
