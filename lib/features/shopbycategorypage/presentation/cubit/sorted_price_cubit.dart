/* import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data_state.dart';
import '../../domain/usecases/get_category.dart';
import '../../domain/usecases/get_sorted.dart';

part 'sorted_price_state.dart';

class SortedPriceCubit extends Cubit<SortedPriceState> {
  SortedPriceCubit(this._getSortedUseCase) : super(SortedPriceLoading());
  final GetSortedUseCase _getSortedUseCase;
  Future<void> sortProducts(final bool isAscending,final bool isDescening) async {
    final dataState = await _getSortedUseCase();
    if (isAscending) {
        widget.cate.sort((final a, final b) => a.price.compareTo(b.price));
      } else if (isDescening) {
        widget.cate.sort((final a, final b) => b.price.compareTo(a.price));
      }
  }
}
 */