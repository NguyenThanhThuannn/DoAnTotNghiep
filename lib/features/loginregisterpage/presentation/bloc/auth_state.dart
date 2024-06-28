part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {

  const AuthSuccess(this.user);
  final User? user;

  @override
  List<Object> get props => [user!];
}

class AuthFailure extends AuthState {

  const AuthFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
class RegisterSuccess extends AuthState {

  const RegisterSuccess(this.user);
  final User? user;

  @override
  List<Object> get props => [user!];
}

class RegisterFailure extends AuthState {

  const RegisterFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}