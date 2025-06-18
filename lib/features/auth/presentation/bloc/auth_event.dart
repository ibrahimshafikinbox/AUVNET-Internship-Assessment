









































import 'package:auvnet_flutter_internship/features/auth/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final UserEntity user;
  const LoggedIn(this.user);

  @override
  List<Object> get props => [user];
}

class LoggedOut extends AuthEvent {}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  const LoginSubmitted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}


class RegisterSubmitted extends AuthEvent {
  final String email;
  final String password;
  
  

  const RegisterSubmitted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}


class LogoutRequested extends AuthEvent {}
