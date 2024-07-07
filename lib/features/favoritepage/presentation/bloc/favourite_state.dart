part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState({this.favourite,this.error});
  final List<FavouriteEntity> ? favourite;
  final DioError ? error;
  @override
  List<Object> get props => [favourite!,error!];
}

final class FavouriteLoading extends FavouriteState {}
final class FavouriteLoaded extends FavouriteState {
  FavouriteLoaded(List<FavouriteEntity> favourite):super(favourite: favourite);
}
final class FavouriteError extends FavouriteState {
  FavouriteError(DioError error):super(error: error);
}