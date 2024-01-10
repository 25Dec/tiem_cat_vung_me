abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class SignUpWithEmailEvent extends AuthEvent {
  final String email;
  final String fullName;
  final String password;

  SignUpWithEmailEvent(
      {required this.email, required this.fullName, required this.password});
}
