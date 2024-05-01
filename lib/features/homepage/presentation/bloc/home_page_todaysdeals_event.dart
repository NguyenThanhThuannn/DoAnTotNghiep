part of 'home_page_todaysdeals_bloc.dart';

sealed class HomePageTodaysdealsEvent {
  const HomePageTodaysdealsEvent();
}
class GetTodaysDeals extends HomePageTodaysdealsEvent{
  GetTodaysDeals();
}