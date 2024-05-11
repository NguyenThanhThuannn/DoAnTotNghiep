part of 'term_page_bloc.dart';

sealed class TermPageState extends Equatable {
  const TermPageState({this.term, this.error});
  final List<TermItemEntity> ? term;
  final DioError ? error;
  @override
  List<Object> get props => [term!,error!];
}

final class TermPageLoading extends TermPageState {}
final class TermPageLoaded extends TermPageState {
  TermPageLoaded(List<TermItemEntity> term):super(term: term);
}
final class TermPageError extends TermPageState {
  TermPageError(DioError error):super(error: error);
}