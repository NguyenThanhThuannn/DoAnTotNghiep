part of 'home_page_recentbrowsing_bloc.dart';

sealed class HomePageRecentbrowsingState extends Equatable {
  const HomePageRecentbrowsingState({this.recentBrowsing,this.error});
  final List<ProductEntity> ? recentBrowsing;
  final DioError ? error;
  @override
  List<Object> get props => [recentBrowsing!,error!];
}

final class HomePageRecentbrowsingLoading extends HomePageRecentbrowsingState {}
final class HomePageRecentbrowsingLoaded extends HomePageRecentbrowsingState{
  HomePageRecentbrowsingLoaded(List<ProductEntity> recentBrowsing):super(recentBrowsing: recentBrowsing);
}
final class HomePageRecentbrowsingError extends HomePageRecentbrowsingState{
  HomePageRecentbrowsingError(DioError error):super(error: error);
}