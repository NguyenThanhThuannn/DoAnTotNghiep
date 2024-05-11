import '../../../../core/data_state.dart';
import '../entities/term.dart';

abstract class TermRepository{
  Future<DataState<List<TermItemEntity>>> getTermUseCase();
}