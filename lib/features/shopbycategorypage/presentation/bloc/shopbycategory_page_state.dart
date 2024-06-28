part of 'shopbycategory_page_bloc.dart';

sealed class ShopbycategoryPageState extends Equatable {
  const ShopbycategoryPageState({this.category,this.error});
  final List<CategoryEntity>? category;
  final DioError ? error;
  @override
  List<Object> get props => [category!,error!];
}

final class ShopbycategoryPageLoading extends ShopbycategoryPageState {}
final class ShopbycategoryPageLoaded extends ShopbycategoryPageState {
  ShopbycategoryPageLoaded(List<CategoryEntity> category):super(category: category);
}
final class ShopbycategoryPageLError extends ShopbycategoryPageState {
  ShopbycategoryPageLError(DioError error):super(error: error);
}