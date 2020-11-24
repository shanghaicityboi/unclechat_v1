import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => IntroScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
