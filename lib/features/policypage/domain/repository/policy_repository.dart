import '../../../../core/data_state.dart';
import '../../../../network/api.dart';
import '../../data/repository/policy_repository_impl.dart';
import '../entities/policy.dart';
import 'package:dio/dio.dart';

class PolicyRepositoryImpl implements PolicyRepository{
  PolicyRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<PolicyItemEntity>>> getPolicyUseCase() async {
    try{
    final res = await _api.getPolicy();
    return DataSucces(res!.data.policy);
   } on DioError catch(e){
    return DataFailed(e);
   }
  }
}