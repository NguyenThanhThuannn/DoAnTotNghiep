part of 'home_page_dailydeals_bloc.dart';

sealed class HomePageDailydealsState extends Equatable {
  const HomePageDailydealsState({this.dailyDeals,this.error});
  final List<DailyDealsEntity> ? dailyDeals;
  final DioError ? error;
  
  @override
  List<Object> get props => [dailyDeals!,error!];
}

final class HomePageDailydealsLoading extends HomePageDailydealsState {}
final class HomePageDailyDealsLoaded extends HomePageDailydealsState{
   const HomePageDailyDealsLoaded(final List<DailyDealsEntity> dailyDeal):super(dailyDeals: dailyDeal);
}
final class HomePageDailyDealsError extends HomePageDailydealsState{
   const HomePageDailyDealsError(final DioError error):super(error: error);
}