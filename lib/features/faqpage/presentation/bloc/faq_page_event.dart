part of 'faq_page_bloc.dart';

sealed class FaqPageEvent {
  const FaqPageEvent();
}
class GetFAQs extends FaqPageEvent{}
