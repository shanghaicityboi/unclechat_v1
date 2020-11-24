import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> loginWithFacebook(OAuthCredential credential) async {
    return _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> logout() async {
    await Future.wait([
      _firebaseAuth.signOut(),
      _facebookAuth.logOut(),
    ]);
  }
}
