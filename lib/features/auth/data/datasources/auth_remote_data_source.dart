import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exception.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> sendOtp({required String phoneNumber});
  Future<bool> verifyOtp({required String otp});
  Future<bool> checkAccountExists({required String phoneNumber});
  Future<UserModel> registerAccount({
    required String fullName,
    required String email,
    required String password,
  });
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  String _verifyId = "";

  AuthRemoteDataSourceImpl(this._firebaseAuth, this._firebaseFirestore);

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
  Future<bool> verifyOtp({required String otp}) async {
    try {
      final credential =
          PhoneAuthProvider.credential(verificationId: _verifyId, smsCode: otp);

      print("Haha $credential");
      final response = await _firebaseAuth.signInWithCredential(credential);

      if (response.user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message!);
    }
  }

  @override
  Future<bool> checkAccountExists({required String phoneNumber}) async {
    bool isExits = false;

    try {
      final collectionUsers = _firebaseFirestore.collection("users");

      QuerySnapshot querySnapshot = await collectionUsers.get();

      for (DocumentSnapshot document in querySnapshot.docs) {
        final user = UserModel.fromJson(document.data() as Map<String, dynamic>);

        if (user.phoneNumber == phoneNumber) {
          isExits = true;
          break;
        }
      }
      return isExits;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<UserModel> registerAccount({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      throw ServerException(message: "");
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
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

  Future<UserModel> _getUserData({required String uid}) async {
    try {
      final response = await _firebaseFirestore.collection("users").doc(uid).get();
      final user = response.data();
      return UserModel.fromJson(user!);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
