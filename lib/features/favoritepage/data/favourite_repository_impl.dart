
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../core/data_state.dart';
import '../../../network/api.dart';
import '../domain/favourite.dart';
import '../domain/favourtire_repository.dart';

class FavouriteRepositoryImpl implements FavouriteRepository{
  FavouriteRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<FavouriteEntity>>> getFavourite(int id) async {
    try{
    final res = await _api.getFavourite(id);
    log('Du lieu favoutire: $res');
    return DataSucces(res!.data);
   } on DioException catch(e){
    return DataFailed(e);
   }
  }
}