import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:login/EventsPageContent.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _mobileNumber;
  String _password;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = SnackBar(
      content: Text('Email: $_mobileNumber, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
    /*StoreConnector<AppState, LoginPageViewModel>(
      onInit: (store) => store.dispatch(LoginStartAction(new LoginRequest(_mobileNumber, _password))),
      converter: (store) => LoginPageViewModel.fromStore(store),
      builder: (_, viewModel) => EventsPageContent(viewModel),
    );*/
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return new EventsPageContent(_mobileNumber, _password);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile number'),
                keyboardType: TextInputType.phone,
                maxLength:10,
                /*validator: (val) =>
                    !val.contains('@') ? 'Not a valid email.' : null,*/
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  Pattern pattern = r'^([9]{1})([234789]{1})([0-9]{8})$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Enter valid mobile number';
                  }
                },
                onSaved: (val) => _mobileNumber = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                validator: (val) =>
                    val.length < 8 ? 'Password must be 8 charater.' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),

              RaisedButton(
                onPressed: _submit,
                child: Text('Login'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
