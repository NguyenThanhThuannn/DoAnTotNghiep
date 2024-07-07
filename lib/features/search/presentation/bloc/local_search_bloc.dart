import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../homepage/domain/entities/product.dart';
import '../../domain/entities/search.dart';
import '../../domain/usecases/get_saved_search.dart';
import '../../domain/usecases/remove_itemsearch.dart';
import '../../domain/usecases/save_itemsearch.dart';

part 'local_search_event.dart';
part 'local_search_state.dart';

class LocalSearchBloc extends Bloc<LocalSearchEvent, LocalSearchState> {
  final GetSavedSearchUseCase _getSavedSearchUseCase;
  final RemoveItemSearchUseCase _removeItemSearchUseCase;
  final SaveItemSearchUseCase _saveItemSearchUseCase;
  LocalSearchBloc(this._getSavedSearchUseCase,this._removeItemSearchUseCase,this._saveItemSearchUseCase) : super(LocalSearchLoading()) {
    on<GetSavedSearches>(onGetSavedSearches);
    on<RemoveItemSearch>(onRemoveItemSearch);
    on<SaveItemSearch>(onSaveItemSearch);
  }

  void onGetSavedSearches(GetSavedSearches event, Emitter<LocalSearchState> emit) async {
    final searches = await _getSavedSearchUseCase();
    emit(LocalSearchDone(searches));
  }

  void onRemoveItemSearch(RemoveItemSearch removeItemSearch, Emitter<LocalSearchState> emit) async {
    await _removeItemSearchUseCase(params: removeItemSearch.search);
    final searches = await _getSavedSearchUseCase();
    emit(LocalSearchDone(searches));
  }

  void onSaveItemSearch(SaveItemSearch saveItemSearch, Emitter<LocalSearchState> emit) async {
    await _saveItemSearchUseCase(params: saveItemSearch.search);
    final searches = await _getSavedSearchUseCase();
    emit(LocalSearchDone(searches));
  }
}
