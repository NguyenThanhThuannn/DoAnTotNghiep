part of 'local_search_bloc.dart';

sealed class LocalSearchEvent extends Equatable {
  const LocalSearchEvent({this.search});
  final SearchEntity ? search;

  @override
  List<Object> get props => [search!];
}

class GetSavedSearches extends LocalSearchEvent{
  const GetSavedSearches();
}
class RemoveItemSearch extends LocalSearchEvent{
  const RemoveItemSearch(final SearchEntity search):super(search: search);
}
class SaveItemSearch extends LocalSearchEvent{
  const SaveItemSearch(final SearchEntity search):super(search: search);
}