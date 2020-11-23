import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatelessWidget {
  final facebookAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                final user = await loginWithFacebook();
                print(user.user.uid);
                print(user.user.providerData);
              },
              child: Text('Login with Facebook'),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> loginWithFacebook() async {
    final result = await FacebookAuth.instance.login();
    final token = result.token;
    final credential = FacebookAuthProvider.credential(token);
    return facebookAuth.signInWithCredential(credential);
  }
}
