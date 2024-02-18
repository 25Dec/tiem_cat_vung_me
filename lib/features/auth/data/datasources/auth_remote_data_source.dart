// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exception.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> sendOtp({required String phoneNumber});
  Future<UserModel?> verifyOtpAndSignIn({required String otp});
  Future<bool> registerAccount({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  });
  Future<void> signOut();
  Future<UserModel?> getUserData({required String uid});
}

const USER_INFO = "USER_INFO";

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  String _verifyId = "";
  String _uid = "";

  AuthRemoteDataSourceImpl(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  @override
  Future<void> sendOtp({required String phoneNumber}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+84${phoneNumber.substring(1)}",
        timeout: const Duration(seconds: 30),
        verificationCompleted: (phoneAuthCredential) async {
          return;
        },
        verificationFailed: (error) async {
          return;
        },
        codeSent: (verificationId, resendToken) async {
          _verifyId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) async {
          return;
        },
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message!);
    }
  }

  @override
  Future<UserModel?> verifyOtpAndSignIn({required String otp}) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verifyId,
        smsCode: otp,
      );
      final response = await _firebaseAuth.signInWithCredential(credential);
      final user = response.user;

      if (user == null) {
        throw ServerException(
          message: 'Please try again later',
        );
      }

      _uid = user.uid;

      final userData = await _getUserData(_uid);

      print(userData.exists);

      if (userData.exists) {
        return UserModel.fromJson(userData.data()!);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message!);
    }
  }

  @override
  Future<bool> registerAccount({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await response.user?.updateDisplayName(fullName);
      await response.user?.updatePassword(password);
      await _setUserData(_firebaseAuth.currentUser!, phoneNumber);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/email-already-in-use') {}
      throw ServerException(message: e.message!);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<UserModel?> getUserData({required String uid}) async {}

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserData(
    String uid,
  ) async {
    return await _firebaseFirestore.collection("users").doc(uid).get();
  }

  Future<void> _setUserData(User user, String phoneNumber) async {
    await _firebaseFirestore.collection("users").doc(user.uid).set(
          UserModel(
            uid: _uid,
            email: user.email!,
            fullName: user.displayName!,
            phoneNumber: phoneNumber,
          ).toJson(),
        );
  }
}
