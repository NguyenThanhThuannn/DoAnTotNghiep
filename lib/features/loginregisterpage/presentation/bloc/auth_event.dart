part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent(this.email, this.password);
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SignupEvent extends AuthEvent {
  const SignupEvent(this.name, this.email, this.password,this.password_confirmation);
  final String name;
  final String email;
  final String password;
  final String password_confirmation;

  @override
  List<Object> get props => [name, email, password,password_confirmation];
}
