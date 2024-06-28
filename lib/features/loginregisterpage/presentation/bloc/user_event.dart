part of 'user_bloc.dart';

sealed class UserEvent{
  const UserEvent();
}
class GetUserById extends UserEvent{
  final int userId;

  const GetUserById(this.userId);

  @override
  List<Object?> get props => [userId];
}
