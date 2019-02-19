import 'package:core/src/models/login_request.dart';
import 'package:core/src/models/login_response.dart';

class LoginRequestAction {
  LoginRequestAction(this.loginRequest);
  final LoginRequest loginRequest;
}

class LoginResponseAction {
  LoginResponseAction(this.loginResponse);
  final LoginResponse loginResponse;
}

class LoginErrorAction {
  LoginErrorAction(this.loginRequest);
  final LoginRequest loginRequest;
}