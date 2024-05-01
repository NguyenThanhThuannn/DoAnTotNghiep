part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState({this.bestSelling,this.error});
  final List<BestSellingEntity> ? bestSelling;
  final DioError ? error;
  
  @override
  List<Object> get props => [bestSelling!,error!];
}

final class HomePageLoading extends HomePageState {
  const HomePageLoading();
}
final class HomePageLoaded extends HomePageState{
   const HomePageLoaded(List<BestSellingEntity> bestSelling):super(bestSelling: bestSelling);
}
final class HomePageError extends HomePageState{
  HomePageError(DioError error):super(error: error);
}