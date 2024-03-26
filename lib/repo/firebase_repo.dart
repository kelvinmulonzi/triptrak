import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseRepo {
  final FirebaseAuth firebase = firebase_auth.FirebaseAuth.instance;

  Future<UserCredential?> createuser(String email, String password) async {
    final user = await firebase.createUserWithEmailAndPassword(
        email: email, password: password);

    return user;
  }

  Future<UserCredential?> loginuser(String email, String password) async {
    try {
      final user = await firebase.signInWithEmailAndPassword(
          email: email, password: password);

      return user;
    } catch (e) {
      throw Future.error(e);
    }
  }

  // current user
  User? get currentUser => firebase.currentUser;

  // signout user
  Future<void> signout() async {
    await firebase.signOut();
  }
}
