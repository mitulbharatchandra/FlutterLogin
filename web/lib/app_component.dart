import 'package:angular/angular.dart';
import 'package:core/core.dart';
import 'package:redux/redux.dart';
import 'src/login/login_form_component.dart';

@Component(
  selector: 'my-app',
  template: '<login-form></login-form>',
  directives: [LoginFormComponent],
)
class AppComponent implements OnInit{
  AppComponent(this._store);
  final Store<AppState> _store;

  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
    _store.dispatch(InitAction());
  }
}
