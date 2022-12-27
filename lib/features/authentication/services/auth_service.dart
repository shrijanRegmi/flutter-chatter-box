import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  // register user with email and pass
  static Future<String?> registerUser({
    required final String email,
    required final String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Fluttertoast.showToast(
          msg: 'The email you have entered is invalid!',
        );
      } else if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: 'You must register first with that email!',
        );
      } else {
        Fluttertoast.showToast(
          msg: '${e.message}',
        );
      }
      return null;
    }
  }

  // login user with email and pass
  static Future<String?> loginUser({
    required final String email,
    required final String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Fluttertoast.showToast(
          msg: 'The email you have entered is invalid!',
        );
      } else if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: 'You must register first with that email!',
        );
      } else {
        Fluttertoast.showToast(
          msg: '${e.message}',
        );
      }
      return null;
    }
  }

  // logout user
  static void logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!!!: Logging out');
    }
  }

  // check if user is already authenticated or not
  static Stream<User?> checkAuthState() {
    return _auth.authStateChanges();
  }
}
