import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/term.dart';
import '../repository/term_repository.dart';

class GetTermUseCase implements UseCase<DataState<List<TermItemEntity>>,void>{
  GetTermUseCase(this._termRepository);
  final TermRepository _termRepository;
  
  @override
  Future<DataState<List<TermItemEntity>>> call({void params}) {
    return _termRepository.getTermUseCase();
  }
}