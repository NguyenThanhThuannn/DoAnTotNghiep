part of 'shopbycategory_page_bloc.dart';

sealed class ShopbycategoryPageEvent {
  const ShopbycategoryPageEvent();
}
class GetCategories extends ShopbycategoryPageEvent{}
class SortProducts extends ShopbycategoryPageEvent {
  final bool isAscending;

  const SortProducts(this.isAscending);

  @override
  List<Object?> get props => [isAscending];
}