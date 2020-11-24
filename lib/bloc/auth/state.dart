enum AuthStatus { connected, disconnected, initialized }

class AuthState {
  const AuthState._({this.status = AuthStatus.initialized});

  const AuthState.initialized() : this._();

  const AuthState.connected() : this._(status: AuthStatus.connected);

  const AuthState.disconnected() : this._(status: AuthStatus.disconnected);

  final AuthStatus status;
}
