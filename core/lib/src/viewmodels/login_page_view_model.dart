import 'package:collection/collection.dart';
import 'package:core/src/app/app_state.dart';
import 'package:core/src/models/loading_status.dart';
import 'package:core/src/models/login_request.dart';
import 'package:core/src/models/login_response.dart';
import 'package:core/src/redux/login/login_actions.dart';
import 'package:core/src/redux/login/login_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class LoginPageViewModel {
  LoginPageViewModel({
    @required this.status,
    @required this.loginResponse,
    @required this.loginEvents
  });

  final LoadingStatus status;
  final LoginResponse loginResponse;
  final Function loginEvents;

  static LoginPageViewModel fromStore(
      Store<AppState> store) {
    return LoginPageViewModel(
      status: store.state.loginState.loginStatus,
      loginResponse: store.state.loginState.loginResponse,
      loginEvents: (loginRequ) {
        store.dispatch(LoginResponseAction(loginRequ));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoginPageViewModel &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              loginResponse == other.loginResponse;

  @override
  int get hashCode => status.hashCode ^ loginResponse.hashCode;
}