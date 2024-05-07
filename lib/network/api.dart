// ignore_for_file: only_throw_errors
import 'dart:async';
import 'dart:developer';
import '../features/homepage/data/models/product_response_model.dart';
import '../features/shopbycategorypage/data/models/category_response_model.dart';
import 'api_provider.dart';
import 'end_points.dart';
import 'network_helper.dart';

class Api {
  /* Api._internal();
  static Api instance = Api._internal(); */

  static final ApiProvider http = ApiProvider();

  /* static Future<Map<String, dynamic>> getHeaders({
    final bool useConfigToken = false,
  }) async {
    const version = '1.0.0';
    const tokenApi =
        'GHSAT0AAAAAACPH4DD3OWPR75SZZO6S6IVQZRM5MCA';
    return {
      'version': version,
      'token': tokenApi,
    };
  } */
  Future<ProductResponseModel?> getProduct() async{
    try{
      final res = await http.getRequest(EndPoints.product);
      final result = ProductResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('ProductResponseModel lỗi $e');
      return null;
    }
  }

  Future<ProductResponseModel?> getbestselling() async{
    try{
      final res = await http.getRequest(EndPoints.product);
      final result = ProductResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('Lỗi $e');
      return null;
    }
  }

  Future<ProductResponseModel?> getdailydeals() async{
    try{
      final res = await http.getRequest(EndPoints.product);
      final result = ProductResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('Lỗi $e');
      return null;
    }
  }
  
  Future<CategoryResponseModel?> getCategory() async{
    try{
      final res = await http.getRequest(EndPoints.Category);
      final result = CategoryResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('CategoryResponseModel lỗi $e');
      return null;
    }
  }
}