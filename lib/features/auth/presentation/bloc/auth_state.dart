import '../../domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class SignedInState extends AuthState {
  final UserEntity user;

  SignedInState({required this.user});
}

class SignedUpState extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
