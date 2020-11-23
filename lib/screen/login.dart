import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatelessWidget {
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
                final result = await FacebookAuth.instance.login();
                final token = result.token;
                if (token != null) {
                  final userData = await FacebookAuth.instance.getUserData();
                  print(userData.entries);
                }
              },
              child: Text('Login with Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}
