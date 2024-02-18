part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class HasUserDataState extends AuthState {
  final UserEntity user;

  HasUserDataState({required this.user});
}

class NoUserDataFoundState extends AuthState {}

class AccountRegistrationSuccessfulState extends AuthState {}

class AlreadyHaveAnAccountState extends AuthState {
  final UserEntity user;

  AlreadyHaveAnAccountState({required this.user});
}

class NotHaveAnAccountState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}
