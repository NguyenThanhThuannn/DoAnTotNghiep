part of 'home_page_recentbrowsing_bloc.dart';

sealed class HomePageRecentbrowsingEvent {
  const HomePageRecentbrowsingEvent();
}
class GetRecentBrowsing extends HomePageRecentbrowsingEvent{
  GetRecentBrowsing();
}
