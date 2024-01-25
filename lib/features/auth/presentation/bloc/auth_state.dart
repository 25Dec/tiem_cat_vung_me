part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class OTPSentSuccessfullyState extends AuthState {}

class OTPVerificationSuccessfulState extends AuthState {}

class AccountRegistrationSuccessfulState extends AuthState {
  final UserEntity user;

  AccountRegistrationSuccessfulState({required this.user});
}

class AlreadyHaveAnAccountState extends AuthState {}

class NotHaveAnAccountState extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
