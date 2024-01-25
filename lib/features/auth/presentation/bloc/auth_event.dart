part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final String phoneNumber;

  SendOtpEvent({required this.phoneNumber});
}

class VerifyOtpEvent extends AuthEvent {
  final String otp;

  VerifyOtpEvent({required this.otp});
}

class RegisterAccountEvent extends AuthEvent {
  final String fullName;
  final String email;
  final String password;

  RegisterAccountEvent(
      {required this.fullName, required this.email, required this.password});
}

class SignOutEvent extends AuthEvent {}
