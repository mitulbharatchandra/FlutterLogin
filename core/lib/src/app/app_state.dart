
import 'package:core/src/redux/login/login_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState({
    @required this.loginState,
  });

  final LoginState loginState;

  factory AppState.initial() {
    return AppState(
      loginState: LoginState.initial(),
    );
  }

  AppState copyWith({
    LoginState loginState,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              loginState == other.loginState;

  @override
  int get hashCode =>
      loginState.hashCode;
}