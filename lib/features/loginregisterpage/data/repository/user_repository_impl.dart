import 'dart:convert';
import 'dart:developer';

import '../../../../core/data_state.dart';
import '../../../../network/api.dart';
import '../../../../network/end_points.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user_repository.dart';
import 'package:dio/dio.dart';

import '../model/user_model.dart';

class UserRepositoryImpl implements UserRepository{
  UserRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<User>> getUserById(final int id)async {
    try{
    final res = await _api.getUserById(id);
    log('Du lieu user: $res');
    return DataSucces(res!.data);
   } on DioError catch(e){
    return DataFailed(e);
   }
  }
  
  @override
  Future<DataState<User>> updateUser(final User user) async {
     try {
      final res = await _api.updateUser(user);
      return DataSucces(res!.data);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}