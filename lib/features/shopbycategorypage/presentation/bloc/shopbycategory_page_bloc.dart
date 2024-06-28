import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../data/models/category_response_model.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_category.dart';

part 'shopbycategory_page_event.dart';
part 'shopbycategory_page_state.dart';

class ShopbycategoryPageBloc extends Bloc<ShopbycategoryPageEvent, ShopbycategoryPageState> {
  ShopbycategoryPageBloc(this._getCategoryUseCase) : super(ShopbycategoryPageLoading()) {
    on<GetCategories>(onGetCategories);
  }
  final GetCategoryUseCase _getCategoryUseCase;
  Future<void> onGetCategories(final GetCategories event, final Emitter<ShopbycategoryPageState> emit) async{
    final dataState = await _getCategoryUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(ShopbycategoryPageLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(ShopbycategoryPageLError(dataState.error!));
    }
  }
}
