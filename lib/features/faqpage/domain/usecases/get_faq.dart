import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/faq.dart';
import '../repository/faq_repository.dart';

class GetFAQUseCase implements UseCase<DataState<List<FAQItemEntity>>,void>{
  GetFAQUseCase(this._faqRepository);
  final FAQRepository _faqRepository;
  @override
  Future<DataState<List<FAQItemEntity>>> call({void params}) {
    return _faqRepository.getFAQUseCase();
  }

}