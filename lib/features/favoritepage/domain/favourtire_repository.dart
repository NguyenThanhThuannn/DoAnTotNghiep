import '../../../core/data_state.dart';
import 'favourite.dart';

abstract class FavouriteRepository{
  Future<DataState<List<FavouriteEntity>>> getFavourite(int id);
}