import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'package:unclechat_v1/bloc/auth/event.dart';
import 'package:unclechat_v1/bloc/auth/state.dart';
import 'package:unclechat_v1/repo/user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.userRepo) : super(AuthState.initialized()) {
    userSub = userRepo.user.listen(
      (user) => add(UserChanged(user)),
    );
  }

  final UserRepo userRepo;
  StreamSubscription<User> userSub;

  @override
  Future<void> close() {
    userSub?.cancel();
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is UserChanged) {
      yield event.user != null
          ? const AuthState.connected()
          : const AuthState.disconnected();
    } else if (event is LogoutRequested) {
      unawaited(userRepo.logout());
    }
  }
}
