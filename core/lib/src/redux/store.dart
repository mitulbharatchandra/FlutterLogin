
import 'package:core/src/app/app_state.dart';
import 'package:core/src/networking/network_api.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart';
import 'package:core/src/app/app_reducer.dart';
import 'package:core/src/redux/login/login_middleware.dart';

Store<AppState> createStore(Client client, KeyValueStore keyValueStore) {
  final api = NetworkApi(client);
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      LoginMiddleWare(api),
    ],
  );
}

