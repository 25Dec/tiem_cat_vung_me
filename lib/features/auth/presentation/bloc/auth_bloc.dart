import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_user_data.dart';
import '../../domain/usecases/register_account.dart';
import '../../domain/usecases/send_otp.dart';
import '../../domain/usecases/sign_out.dart';
import '../../domain/usecases/verify_otp_and_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtp _sendOtp;
  final VerifyOtpAndSignIn _verifyOtpAndSignIn;
  final RegisterAccount _registerAccount;
  final SignOut _signOut;
  final GetUserData _getUserData;

  AuthBloc(
      {required SendOtp sendOtp,
      required VerifyOtpAndSignIn verifyOtpAndSignIn,
      required RegisterAccount registerAccount,
      required SignOut signOut,
      required GetUserData getUserData})
      : _sendOtp = sendOtp,
        _verifyOtpAndSignIn = verifyOtpAndSignIn,
        _registerAccount = registerAccount,
        _signOut = signOut,
        _getUserData = getUserData,
        super(AuthInitial()) {
    on<SendOtpEvent>(_onSendOtpEvent);
    on<VerifyOtpAndSignInEvent>(_onVerifyOtpAndSignInEvent);
    on<RegisterAccountEvent>(_onRegisterAccountEvent);
    on<SignOutEvent>(_onSignOutEvent);
    on<GetUserDataEvent>(_onGetUserDataEvent);
  }

  void _onSendOtpEvent(SendOtpEvent event, Emitter<AuthState> emit) async {
    final response = await _sendOtp.execute(phoneNumber: event.phoneNumber);

    response.fold(
      (failure) => emit(AuthErrorState(message: failure.message)),
      (_) => emit(AuthInitial()),
    );
  }

  void _onVerifyOtpAndSignInEvent(
      VerifyOtpAndSignInEvent event, Emitter<AuthState> emit) async {
    final response = await _verifyOtpAndSignIn.execute(otp: event.otp);

    response.fold(
      (failure) => AuthErrorState(message: failure.message),
      (user) {
        return user != null
            ? emit(AlreadyHaveAnAccountState(user: user))
            : emit(NotHaveAnAccountState());
      },
    );
  }

  void _onRegisterAccountEvent(
      RegisterAccountEvent event, Emitter<AuthState> emit) async {
    final response = await _registerAccount.execute(
      fullName: event.fullName,
      email: event.email,
      password: event.password,
      phoneNumber: event.phoneNumber,
    );

    response.fold(
      (failure) => emit(AuthErrorState(message: failure.message)),
      (_) => emit(AccountRegistrationSuccessfulState()),
    );
  }

  void _onSignOutEvent(SignOutEvent event, Emitter<AuthState> emit) async {
    final response = await _signOut.execute();

    response.fold(
      (failure) => emit(AuthErrorState(message: failure.message)),
      (_) => emit(AuthInitial()),
    );
  }

  void _onGetUserDataEvent(GetUserDataEvent event, Emitter<AuthState> emit) async {
    final response = await _getUserData.execute();

    response.fold(
      (failure) => AuthErrorState(message: failure.message),
      (user) {
        return user != null ? HasUserDataState(user: user) : NoUserDataFoundState();
      },
    );
  }
}
