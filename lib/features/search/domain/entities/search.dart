import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  const SearchEntity({
    this.id,
    this.name,
  });
  final int? id;
  final String? name;

  @override
  List<Object?> get props {
    return [id, name];
  }
}
