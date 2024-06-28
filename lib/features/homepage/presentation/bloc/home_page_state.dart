part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState({this.products,this.error});
  final List<ProductEntity> ? products;
  final DioError ? error;
  
  @override
  List<Object> get props => [products!,error!];
}

final class HomePageLoading extends HomePageState {
  const HomePageLoading();
}
final class HomePageLoaded extends HomePageState{
   const HomePageLoaded(List<ProductEntity> bestSelling):super(products: bestSelling);
}
final class HomePageError extends HomePageState{
  HomePageError(DioError error):super(error: error);
}