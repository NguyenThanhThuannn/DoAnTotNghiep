part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState({this.user,this.error});
  final User ? user;
  final DioError ? error;
  
  @override
  List<Object> get props => [user!,error!];
}

final class UserLoading extends UserState {}
final class UserLoaded extends UserState{
  UserLoaded(User user):super(user: user);
}
final class UserError extends UserState{
  UserError(DioError error):super(error:error);
}