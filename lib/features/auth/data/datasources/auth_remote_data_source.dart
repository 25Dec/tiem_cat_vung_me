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
      await _setUserData(fullName, email, phoneNumber);
      return true;
    } on FirebaseAuthException catch (e) {
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
  Future<UserModel?> getUserData({required String uid}) async {
    final result = await _getUserData(uid);
    return UserModel.fromJson(result.data()!);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserData(String uid) async {
    final result = await _firebaseFirestore.collection("users").doc(uid).get();
    return result;
  }

  Future<void> _setUserData(
    String fullName,
    String email,
    String phoneNumber,
  ) async {
    await _firebaseFirestore.collection("users").doc(_uid).set(
          UserModel(
            uid: _uid,
            email: email,
            fullName: fullName,
            phoneNumber: phoneNumber,
          ).toJson(),
        );
  }
}
