import '../../../../core/data_state.dart';
import '../entities/faq.dart';

abstract class FAQRepository{
  Future<DataState<List<FAQItemEntity>>> getFAQUseCase();
}