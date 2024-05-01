part of 'home_page_todaysdeals_bloc.dart';

sealed class HomePageTodaysdealsState extends Equatable {
  const HomePageTodaysdealsState({this.todaysdeals,this.error});
  final List<TodaysDealsEntity>? todaysdeals;
  final DioError ? error;
  @override
  List<Object> get props => [todaysdeals!,error!];
}

final class HomePageTodaysdealsLoading extends HomePageTodaysdealsState {}
final class HomePageTodaysdealsLoaded extends HomePageTodaysdealsState {
  HomePageTodaysdealsLoaded(List<TodaysDealsEntity> todaysdeals):super(todaysdeals: todaysdeals);
}
final class HomePageTodaysdealsError extends HomePageTodaysdealsState {
  HomePageTodaysdealsError(DioError error):super(error: error);
}