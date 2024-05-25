import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  const SearchEntity({
    this.id,
    this.title,
  });
  final int? id;
  final String? title;

  @override
  List<Object?> get props {
    return [id, title];
  }
}
