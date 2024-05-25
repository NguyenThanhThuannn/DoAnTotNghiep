import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable{
  final int ? id;
  final String ? title;

  SearchEntity({
    this.id,
    this.title
  });


  @override
  List<Object?> get props {
    return [id,title];
  }
}