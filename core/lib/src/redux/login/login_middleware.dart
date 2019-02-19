
import 'dart:async';
import 'package:core/src/_comman/comman_actions.dart';
import 'package:core/src/app/app_state.dart';
import 'package:core/src/models/login_request.dart';
import 'package:core/src/networking/network_api.dart';
import 'package:core/src/redux/login/login_actions.dart';
import 'package:redux/redux.dart';

class LoginMiddleWare extends MiddlewareClass<AppState> {
  LoginMiddleWare(this.api);
  final NetworkApi api;

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    print("Request Json 1");
    next(action);
    print("Request Json 2");
    if (action is LoginStartAction) {
      print("Request Json 3");
      await _startLoginEvents(store, next, action);
    }
  }


  Future<void> _startLoginEvents(Store<AppState> store, NextDispatcher next, dynamic action) async {
    print("Request Json 4");
    LoginRequest loginRequest = getLoginCredentials(store, action);
    print("Request Json 5");
    //next(LoginRequestAction(loginRequest));
    if (loginRequest != null) {
      print("Request Json 6");
      next(LoginRequestAction(loginRequest));
      print("Request Json 7");
      try {
        print("Request Json 8");
        final loginResponse = await api.doLogin(loginRequest);
        print("Request Json 9");
        next(LoginResponseAction(loginResponse));
        print("Request Json 10");
      } catch (e) {
        next(LoginErrorAction(loginRequest));
        print("Request Json 11");
      }
    }
  }

  LoginRequest getLoginCredentials(Store<AppState> store, action) {
    return action is LoginStartAction
        ? action.loginRequest
        : null;
  }
}
