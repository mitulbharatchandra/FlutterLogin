import 'package:core/src/models/login_request.dart';
import 'package:core/src/models/login_response.dart';

class InitAction {}

class LoginCompleteAction {
  LoginCompleteAction(
      this.loginResponse
      );

  final LoginResponse loginResponse;
}

class LoginStartAction {
  LoginStartAction(
      this.loginRequest
      );

  final LoginRequest loginRequest;
}