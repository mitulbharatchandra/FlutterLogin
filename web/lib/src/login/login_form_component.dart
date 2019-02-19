import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:core/core.dart';
import 'package:core/src/models/login_request.dart';
import 'package:redux/redux.dart';


@Component(
  selector: 'login-form',
  templateUrl: 'login_form_component.html',
  directives: [coreDirectives, formDirectives],
)
class LoginFormComponent {
  LoginFormComponent(this._store);
  final Store<AppState> _store;

  LoginRequest mLoginRequest = LoginRequest("", "");
  bool submitted = false;


  void onSubmit() {
    print("OnSubmit");
    _store.dispatch(LoginStartAction(mLoginRequest));
  }
}