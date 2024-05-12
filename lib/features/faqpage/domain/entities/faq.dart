import 'package:equatable/equatable.dart';

class FAQItemEntity extends Equatable{
  FAQItemEntity({
    this.title,
    this.description
  });
  final String ? title;
  final String ? description;
  
  @override
  List<Object?> get props => [title,description];
}