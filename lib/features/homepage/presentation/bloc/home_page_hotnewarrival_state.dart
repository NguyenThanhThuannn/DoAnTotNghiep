part of 'home_page_hotnewarrival_bloc.dart';

sealed class HomePageHotnewarrivalState extends Equatable {
  const HomePageHotnewarrivalState({this.hotnewarrival,this.error});
  final List<HotNewArrivalEntity> ? hotnewarrival;
  final DioError ? error;
  @override
  List<Object> get props => [hotnewarrival!,error!];
}

final class HomePageHotnewarrivalLoading extends HomePageHotnewarrivalState {}
final class HomePageHotnewarrivalLoaded extends HomePageHotnewarrivalState {
  HomePageHotnewarrivalLoaded(List<HotNewArrivalEntity> hotnewarrival):super(hotnewarrival: hotnewarrival);
}
final class HomePageHotnewarrivalError extends HomePageHotnewarrivalState {
  HomePageHotnewarrivalError(DioError error):super(error: error);
}