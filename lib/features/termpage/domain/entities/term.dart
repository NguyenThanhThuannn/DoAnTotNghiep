import 'package:equatable/equatable.dart';
import '../../data/models/term_response_model.dart';

class TermItemEntity extends Equatable{
  const TermItemEntity({
    this.title,
    this.item,
  });
  final String ? title;
  final List<TermDataItemModel> ? item;

  @override
  List<Object?> get props {
    return [title,item];
  }
}
class TermDataItemEntity extends Equatable{
  const TermDataItemEntity({
    this.title,
  });
  final String ? title;
  
  @override
  List<Object?> get props {
    return [title];
  }
}