import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiem_cat_vung_me/features/auth/domain/entities/user_entity.dart';

import '../../domain/usecases/register_account.dart';
import '../../domain/usecases/send_otp.dart';
import '../../domain/usecases/sign_out.dart';
import '../../domain/usecases/verify_otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtp _sendOtp;
  final VerifyOtp _verifyOtp;
  final RegisterAccount _registerAccount;
  final SignOut _signOut;

  AuthBloc({
    required SendOtp sendOtp,
    required VerifyOtp verifyOtp,
    required RegisterAccount registerAccount,
    required SignOut signOut,
  })  : _sendOtp = sendOtp,
        _verifyOtp = verifyOtp,
        _registerAccount = registerAccount,
        _signOut = signOut,
        super(AuthInitial()) {
    on<SendOtpEvent>(_onSendOtpEvent);
    on<VerifyOtpEvent>(_onVerifyOtpEvent);
    on<RegisterAccountEvent>(_onRegisterAccountEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  void _onSendOtpEvent(SendOtpEvent event, Emitter<AuthState> emit) async {
    final response = await _sendOtp.execute(phoneNumber: event.phoneNumber);

    response.fold(
      (failure) => AuthError(message: failure.message),
      (_) => AuthInitial(),
    );
  }

  void _onVerifyOtpEvent(VerifyOtpEvent event, Emitter<AuthState> emit) async {
    final response = await _verifyOtp.execute(otp: event.otp);

    response.fold(
      (failure) => AuthError(message: failure.message),
      (state) {
        return OTPVerificationSuccessfulState();
      },
    );
  }

  void _onRegisterAccountEvent(
      RegisterAccountEvent event, Emitter<AuthState> emit) async {
    final response = await _registerAccount.execute(
        fullName: event.fullName, email: event.email, password: event.password);

    response.fold(
      (failure) => AuthError(message: failure.message),
      (user) => AccountRegistrationSuccessfulState(user: user),
    );
  }

  void _onSignOutEvent(SignOutEvent event, Emitter<AuthState> emit) async {
    final response = await _signOut.execute();

    response.fold(
      (failure) => AuthError(message: failure.message),
      (user) => AuthInitial(),
    );
  }
}
