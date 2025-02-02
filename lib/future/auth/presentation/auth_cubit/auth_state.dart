part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthLoginFailuer extends AuthState {
  final String message;
  AuthLoginFailuer(this.message);
}
