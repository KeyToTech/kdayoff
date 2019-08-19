import 'package:flutter/material.dart';

import 'login_form.dart';
import 'login_presenter.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState(LoginViewModel());
}

class _LoginPageState extends State<LoginPage> {
  static const String loginButtonText = 'Sign In';

  final LoginViewModel _loginPresenter;

  _LoginPageState(this._loginPresenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginForm(this._loginPresenter),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
