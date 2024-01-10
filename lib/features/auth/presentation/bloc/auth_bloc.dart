import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_up_with_email.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn _signIn;
  final SignUpWithEmail _signUpWithEmail;

  AuthBloc({required SignIn signIn, required SignUpWithEmail signUpWithEmail})
      : _signIn = signIn,
        _signUpWithEmail = signUpWithEmail,
        super(AuthInitial()) {
    on<SignInEvent>(_onSignInEvent);
    on<SignUpWithEmailEvent>(_onSignUpWithEmailEvent);
  }

  void _onSignInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    final response = await _signIn.execute(email: event.email, password: event.password);

    response.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(SignedInState(user: user)),
    );
  }

  void _onSignUpWithEmailEvent(
      SignUpWithEmailEvent event, Emitter<AuthState> emit) async {
    final response = await _signUpWithEmail.execute(
        email: event.email, fullName: event.fullName, password: event.password);

    response.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => SignedUpState(),
    );
  }
}
