import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'end_points.dart';

class ApiProvider {
  ApiProvider({this.connectTimeOut = const Duration(seconds: 20000)}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 10000),
        connectTimeout: connectTimeOut ?? const Duration(seconds: 20000),
      ),
    );

    // Logging
    _dio.interceptors.add(PrettyDioLogger(requestBody: true));
  }
  late Dio _dio;

  final Duration? connectTimeOut;

  final baseUrl = EndPoints.baseUrl;

  Future<Map<String, dynamic>?> getRequest(
    final String endpoint, {
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? headers,
    Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    Response response;

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data; //Server
    //return jsonDecode(response.data); //Git
  }

  Future<Map<String, dynamic>?> postRequest(
    final String endpoint, {
    final Map<String, dynamic>? body,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? headers,
    Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    Response response;

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response.data;
  }

  Future<Map<String, dynamic>?> putRequest(
    final String endpoint, {
    final Map<String, dynamic>? body,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? headers,
    Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    Response response;

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    response = await _dio.put(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return jsonDecode(response.data);
  }

  Future<Map<String, dynamic>?> deleteRequest(
    final String endpoint, {
    final Map<String, dynamic>? body,
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? headers,
    Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    Response response;

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    response = await _dio.delete(
      endpoint,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}
