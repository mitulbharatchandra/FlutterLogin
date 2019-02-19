

import 'package:core/core.dart';
import 'package:core/src/models/loading_status.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState {
  LoginState({
    @required this.loginRequest,
    @required this.loginStatus,
    @required this.loginResponse,
  });

  final LoadingStatus loginStatus;
  final LoginResponse loginResponse;
  final LoginRequest loginRequest;

  factory LoginState.initial() {
    return LoginState(
      loginRequest: null,
      loginStatus: LoadingStatus.idle,
      loginResponse: null,
    );
  }

  LoginState copyWith({
    LoginRequest loginRequest,
    LoadingStatus loginStatus,
    LoginResponse loginResponse,
  }) {
    return LoginState(
      loginRequest: loginRequest ?? this.loginRequest,
      loginStatus: loginStatus ?? this.loginStatus,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoginState &&
              runtimeType == other.runtimeType &&
              loginStatus == other.loginStatus &&
              loginResponse == other.loginResponse;

  @override
  int get hashCode =>
      loginStatus.hashCode ^
      loginResponse.hashCode;
}