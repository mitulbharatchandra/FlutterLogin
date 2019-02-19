import 'dart:async';
import 'dart:convert';
import 'package:core/core.dart';
import 'package:core/src/models/login_response.dart';
import 'package:http/http.dart';

class NetworkApi{
  NetworkApi(this.client);
  final Client client;

  static final String baseUrl = '192.168.8.40:8080';

  Future<LoginResponse> doLogin(LoginRequest loginRequest) async {

    final searchUri = Uri.http(baseUrl, 'HeroMoneykitWeb/heroMoneykit/funLogin');
    //print("Request Json: url : $searchUri  data:  ${json.encode(loginRequest)}");
    var map = new Map();
    map['Content-Type'] = 'application/json';

    print("Mobile: ${loginRequest.mobileNumber}");
    print("Password: ${loginRequest.password}");
    var response = await client.post(searchUri, headers:{"Content-Type":"application/json", "Access-Control-Allow-Origin":"http://localhost:8080", "Access-Control-Allow-Methods":"GET, POST, OPTIONS, PUT, PATCH, DELETE", "Access-Control-Allow-Headers":"X-Requested-With,content-type", "Access-Control-Allow-Credentials":"true"}, body: json.encode(loginRequest));
    print("Response Json: ${response.body}");

    Map responseMap = json.decode(response.body);
    var loginResponse = LoginResponse.fromJson(responseMap);

    print("Flag: ${loginResponse.flag}");
    print("Msg: ${loginResponse.msg}");

    if (loginResponse != null) {
      return loginResponse;
    }

    return null;
  }
}