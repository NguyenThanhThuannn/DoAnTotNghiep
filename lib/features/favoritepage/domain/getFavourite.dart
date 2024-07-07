import '../../../core/data_state.dart';
import '../../../core/usecase.dart';
import 'favourite.dart';
import 'favourtire_repository.dart';

class GetFavouriteUseCase implements UseCase<DataState<List<FavouriteEntity>>, int>{
  GetFavouriteUseCase(this._favouriteRepository);
  final FavouriteRepository _favouriteRepository;
  
  @override
  Future<DataState<List<FavouriteEntity>>> call({int? params}) {
    return _favouriteRepository.getFavourite(params!);
  }
  
}