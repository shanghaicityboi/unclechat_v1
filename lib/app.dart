import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclechat_v1/bloc/auth/bloc.dart';
import 'package:unclechat_v1/bloc/auth/state.dart';
import 'package:unclechat_v1/screen/home.dart';
import 'package:unclechat_v1/screen/intro.dart';
import 'package:unclechat_v1/screen/login.dart';
import 'package:unclechat_v1/screen/profile.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uncle Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(centerTitle: true),
      ),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            print(state.status);
            switch (state.status) {
              case AuthStatus.connected:
                _navigator.pushAndRemoveUntil<void>(
                  ProfileScreen.route(),
                  (route) => false,
                );
                break;
              case AuthStatus.disconnected:
                _navigator.pushAndRemoveUntil<void>(
                  LoginScreen.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => IntroScreen.route(),
    );
  }
}
