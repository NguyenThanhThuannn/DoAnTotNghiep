part of 'local_search_bloc.dart';

sealed class LocalSearchState extends Equatable {
  const LocalSearchState({this.searches});
  final List<SearchEntity> ? searches;
  @override
  List<Object> get props => [searches!];
}

final class LocalSearchLoading extends LocalSearchState {}
final class LocalSearchDone extends LocalSearchState {
  const LocalSearchDone(final List<SearchEntity> searches):super(searches: searches);
}