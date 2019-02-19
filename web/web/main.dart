import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:core/core.dart';
import 'package:http/http.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'package:redux/redux.dart';
import 'package:key_value_store_web/key_value_store_web.dart';
import 'main.template.dart' as self;

final Store<AppState> _store = createStore(
  Client(),
  WebKeyValueStore(window.localStorage),
);
Store<AppState> storeFactory() => _store;

@GenerateInjector([
  const FactoryProvider(Store, storeFactory), routerProvidersHash,
])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: rootInjector);
}
