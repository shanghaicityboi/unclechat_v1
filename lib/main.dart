import 'package:flutter/material.dart';
import 'package:unclechat_v1/screen/login.dart';

void main() {
  runApp(UncleChat());
}

class UncleChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uncle Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(centerTitle: true),
      ),
      home: LoginScreen(),
    );
  }
}
