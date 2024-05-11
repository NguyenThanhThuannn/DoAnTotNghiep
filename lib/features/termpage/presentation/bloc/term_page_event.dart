part of 'term_page_bloc.dart';

sealed class TermPageEvent {
  const TermPageEvent();
}
class GetTerms extends TermPageEvent{}