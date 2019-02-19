import 'package:core/src/app/app_state.dart';
import 'package:core/src/redux/login/login_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    loginState: loginReducer(state.loginState, action),
  );
}