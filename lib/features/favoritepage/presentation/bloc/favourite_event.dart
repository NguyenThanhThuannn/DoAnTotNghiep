part of 'favourite_bloc.dart';

sealed class FavouriteEvent{
  const FavouriteEvent();
}
class GetFavourites extends FavouriteEvent{
  GetFavourites(this.userId);
  int userId;
  
   @override
  List<Object?> get props => [userId];
}
class GetFavourites2 extends FavouriteEvent{
  GetFavourites2(this.userId);
  int userId;
  
   @override
  List<Object?> get props => [userId];
}