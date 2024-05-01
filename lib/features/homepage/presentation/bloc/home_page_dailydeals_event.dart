part of 'home_page_dailydeals_bloc.dart';

sealed class HomePageDailydealsEvent{
  const HomePageDailydealsEvent();
}
class GetDailyDeals extends HomePageDailydealsEvent{
  GetDailyDeals();
}