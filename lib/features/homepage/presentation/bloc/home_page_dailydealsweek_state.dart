part of 'home_page_dailydealsweek_bloc.dart';

sealed class HomePageDailydealsweekState extends Equatable {
  const HomePageDailydealsweekState({this.dailydealsweek,this.error});
  final List<ProductEntity> ? dailydealsweek;
  final DioError ? error;
  @override
  List<Object> get props => [dailydealsweek!,error!];
}

final class HomePageDailydealsweekLoading extends HomePageDailydealsweekState {}
final class HomePageDailydealsweekLoaded extends HomePageDailydealsweekState {
  HomePageDailydealsweekLoaded(List<ProductEntity> dailydealsweek):super(dailydealsweek: dailydealsweek);
}
final class HomePageDailydealsweekError extends HomePageDailydealsweekState {
  HomePageDailydealsweekError(DioError error):super(error: error);
}