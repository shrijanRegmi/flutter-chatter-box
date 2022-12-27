import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  // register user with email and pass
  static Future<String?> registerUser({
    required final String email,
    required final String password,
  }) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
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
}
