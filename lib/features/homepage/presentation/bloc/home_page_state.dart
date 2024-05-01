part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState({this.bestSelling,this.error});
  final List<ProductEntity> ? bestSelling;
  final DioError ? error;
  
  @override
  List<Object> get props => [bestSelling!,error!];
}

final class HomePageLoading extends HomePageState {
  const HomePageLoading();
}
final class HomePageLoaded extends HomePageState{
   const HomePageLoaded(List<ProductEntity> bestSelling):super(bestSelling: bestSelling);
}
final class HomePageError extends HomePageState{
  HomePageError(DioError error):super(error: error);
}