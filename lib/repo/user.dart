import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference get usersRef => _firebaseFirestore.collection('users');
  String get userID => _firebaseAuth.currentUser.uid;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> loginWithFacebook(OAuthCredential credential) async {
    return _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> updateUserInfo(Map<String, dynamic> info) {
    return usersRef
        .doc(userID)
        .set(info, SetOptions(merge: true))
        .then((value) => print("User updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> logout() async {
    await Future.wait([
      _firebaseAuth.signOut(),
      _facebookAuth.logOut(),
    ]);
  }
}
