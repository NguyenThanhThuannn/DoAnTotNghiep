part of 'home_page_bloc.dart';

sealed class HomePageEvent{
  const HomePageEvent();
}
class GetBestSellings extends HomePageEvent{
  GetBestSellings();
}