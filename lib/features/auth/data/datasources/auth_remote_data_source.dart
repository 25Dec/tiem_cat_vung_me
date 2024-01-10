import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exception.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signUpWithEmail({
    required String email,
    required String fullName,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRemoteDataSourceImpl(this._auth, this._firebaseFirestore);

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = response.user;

      if (user == null) {
        throw ServerException(
          message: 'Please try again later',
        );
      }
      var userData = await _getUserData(user);

      if (userData.exists) {
        return UserModel.fromJson(userData.data()!);
      }
      await _setUserData(user, email);

      userData = await _getUserData(user);
      return UserModel.fromJson(userData.data()!);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message!);
    }
  }

  @override
  Future<void> signUpWithEmail({
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      final response =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _sendEmailVerification();

      final user = response.user;
      user!.updateDisplayName(fullName);
      _setUserData(user, password);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.message!);
    }
  }

  Future<void> _setUserData(User user, String password) async {
    await _firebaseFirestore.collection("users").doc(user.uid).set(UserModel(
          uid: user.uid,
          email: user.email!,
          fullName: user.displayName!,
          password: password,
        ).toJson());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserData(User user) async {
    return await _firebaseFirestore.collection("users").doc(user.uid).get();
  }

  Future<void> _sendEmailVerification() async {
    await _auth.currentUser!.sendEmailVerification();
  }
}
