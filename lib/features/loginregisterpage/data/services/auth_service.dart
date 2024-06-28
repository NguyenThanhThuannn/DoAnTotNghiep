import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../network/end_points.dart';
import '../model/user_model.dart';

class AuthService {
  AuthService(this.dio);
  final Dio dio;

  Future<UserModel> login(final String email, final String password) async {
    try {
      final response = await dio.post(
        '${EndPoints.baseUrl}login',
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response!.statusCode == 422) {
        // Xử lý trường hợp mã lỗi 422 ở đây
        print('Lỗi 422 xảy ra: ${e.message}');
        throw Exception(e.response!.data['error']);
      } else {
        // Xử lý các lỗi khác
        print('Lỗi không xác định: ${e.message}');
      }
      rethrow;
    }
  }

  Future<UserModel> signup(
    final String name,
    final String email,
    final String password,
    final String passwordConfirmation,
  ) async {
    try {
      final response = await dio.post(
        '${EndPoints.baseUrl}signup',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throwIf(e.response!.statusCode==500, 'Email đã tồn tại');
      rethrow;
    }
  }
}
