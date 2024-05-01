part of 'home_page_dailydealsweek2_bloc.dart';

sealed class HomePageDailydealsweek2State extends Equatable {
  const HomePageDailydealsweek2State({this.dailydealsweek2,this.error});
  final List<ProductEntity> ? dailydealsweek2;
  final DioError ? error;
  @override
  List<Object> get props => [dailydealsweek2!,error!];
}

final class HomePageDailydealsweek2Loading extends HomePageDailydealsweek2State {}
final class HomePageDailydealsweek2Loaded extends HomePageDailydealsweek2State {
  HomePageDailydealsweek2Loaded(List<ProductEntity> dailydealsweek2):super(dailydealsweek2: dailydealsweek2);
}
final class HomePageDailydealsweek2Error extends HomePageDailydealsweek2State {
  HomePageDailydealsweek2Error(DioError error):super(error: error);
}