
import 'package:core/src/models/loading_status.dart';
import 'package:core/src/redux/login/login_actions.dart';
import 'package:core/src/redux/login/login_state.dart';

LoginState loginReducer(LoginState state, dynamic action) {
  if (action is LoginRequestAction) {
    return state.copyWith(
      loginStatus: LoadingStatus.loading,
      loginRequest: action.loginRequest,
    );
  } else if (action is LoginResponseAction) {
    return state.copyWith(
      loginStatus: LoadingStatus.success,
      loginResponse: action.loginResponse,
    );
  } else if (action is LoginErrorAction) {
    return state.copyWith(
      loginStatus: LoadingStatus.error
    );
  }

  return state;
}


