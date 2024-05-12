part of 'faq_page_bloc.dart';

sealed class FaqPageState extends Equatable {
  const FaqPageState({this.faq,this.error});
  final List<FAQItemEntity> ? faq;
  final DioError ? error;
  @override
  List<Object> get props => [faq!,error!];
}

final class FaqPageLoading extends FaqPageState {}
final class FaqPageLoaded extends FaqPageState {
  FaqPageLoaded(List<FAQItemEntity> faq):super(faq: faq);
}
final class FaqPageError extends FaqPageState {
  FaqPageError(DioError error):super(error: error);
}