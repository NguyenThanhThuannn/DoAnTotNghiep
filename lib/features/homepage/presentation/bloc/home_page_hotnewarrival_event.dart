part of 'home_page_hotnewarrival_bloc.dart';

sealed class HomePageHotnewarrivalEvent{
  const HomePageHotnewarrivalEvent();
}
class GetHotNewArrivals extends HomePageHotnewarrivalEvent{
  GetHotNewArrivals();
}
