import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../data/model/user_model.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/addProductInCart.dart';
import '../../domain/usecases/deleteProduct.dart';
import '../../domain/usecases/getuserbyid_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._getUserByIdUseCase,this._addProductInCartUseCase,this._deleteProductInCartUseCase) : super(UserLoading()) {
    on<GetUserById>(onGetUserById);
    on<GetUserById2>(onGetUserById2);
    on<AddProduct>(onAddProduct);
    on<DeleteProduct>(onDeleteProductInCart);
}
  final GetUserByIdUseCase _getUserByIdUseCase;
  final AddProductInCartUseCase _addProductInCartUseCase;
  final DeleteProductInCartUseCase _deleteProductInCartUseCase;
  Future<void> onGetUserById (final GetUserById event, final Emitter<UserState> emit) async{
    
    final dataState = await _getUserByIdUseCase(params: event.userId);
    if(dataState is DataSucces && dataState.data!=null){
      //emit(UserLoading());
      emit(UserLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(UserError(dataState.error!));
    }
  }
  Future<void> onGetUserById2 (final GetUserById2 event, final Emitter<UserState> emit) async{
    emit(UserLoading());
    final dataState = await _getUserByIdUseCase(params: event.userId);
    //emit(UserLoading());
    if(dataState is DataSucces && dataState.data!=null){
      //emit(UserLoading());
      emit(UserLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(UserError(dataState.error!));
    }
  }

  Future<void> onAddProduct(final AddProduct event, final Emitter<UserState> emit) async {
    final dataState = await _addProductInCartUseCase.call(params: AddProductParams(event.userId, event.product, event.qty));
    if (dataState.data != null) {
      emit(CartSuccess(dataState.data!));
    } else {
      emit(CartError(dataState.error!));
    }
  }

  Future<void> onDeleteProductInCart(final DeleteProduct event, final Emitter<UserState> emit) async {
    final dataState = await _deleteProductInCartUseCase.call(params: event.cartId);
    if (dataState is DataSucces && dataState.data!=null) {
      emit(UserLoaded(dataState.data));
    } else {
      emit(UserError(dataState.error!));
    }
  }
}
