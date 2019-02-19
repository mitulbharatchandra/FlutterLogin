import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EventsPageContent extends StatelessWidget {
  EventsPageContent(this.mobilenumber, this.password);
  final String mobilenumber;
  final String password;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPageViewModel>(
      distinct: true,
      onInit: (store) => store.dispatch(LoginStartAction(new LoginRequest(mobilenumber, password))),
      converter: (store) => LoginPageViewModel.fromStore(store),
      builder: (_, viewModel) => PageContent(viewModel),
    );
  }

}

class PageContent extends StatelessWidget {
  PageContent(this.viewModel);
  final LoginPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    String msg = "Please wait ........";
    if(viewModel.loginResponse != null) {
      msg = viewModel.loginResponse.msg;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Text('Login Response : $msg'),
       ),
    );
  }
}