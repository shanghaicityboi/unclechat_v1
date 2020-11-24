import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class UserChanged extends AuthEvent {
  const UserChanged(this.user);

  final User user;
}

class LogoutRequested extends AuthEvent {}
