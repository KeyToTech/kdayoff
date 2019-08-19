import 'package:flutter/material.dart';
import 'package:kdayoff/src/presentation/scenes/home/home_page.dart';
import 'package:kdayoff/src/presentation/scenes/sign_up/sign_up.dart';

import 'login_presenter.dart';
import 'login_state.dart';

class LoginForm extends StatefulWidget {
  final LoginViewModel _loginPresenter;

  LoginForm(this._loginPresenter);

  @override
  _LoginFormState createState() => _LoginFormState(this._loginPresenter);
}

class _LoginFormState extends State<LoginForm> {
  final LoginViewModel _loginPresenter;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextEditingController = new TextEditingController();
  TextEditingController _passwordTextEditingController = new TextEditingController();

  _LoginFormState(this._loginPresenter);

  @override
  void initState() {
    super.initState();
    _emailTextEditingController.addListener(textChangeListener);
    _passwordTextEditingController.addListener(textChangeListener);
  }

  void textChangeListener() {
    _loginPresenter.validate(
        _emailTextEditingController.text,
        _passwordTextEditingController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoginState>(
        stream: _loginPresenter.loginStateObservable,
        builder: (BuildContext context, AsyncSnapshot<LoginState> snapshot) {
          final loginState = snapshot.data;
          return buildUi(context, loginState);
        });
  }

  void _submit() {
    _formKey.currentState.validate();
    print('Form submitted');
    _loginPresenter.login(
        _emailTextEditingController.text,
        _passwordTextEditingController.text
    );
  }

  void _navigateToRegistration(BuildContext context) {
    Navigator.pushNamed(context, SignUpPage.routeName);
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, HomePage.routeName);
  }

  Widget buildUi(BuildContext context, LoginState loginState) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            controller: _emailTextEditingController,
            validator: (String value) {
              return loginState.validationsState.emailValidation.errorMessage;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            controller: _passwordTextEditingController,
            validator: (String value) {
              return loginState.validationsState.passwordValidation.errorMessage;
            },
          ),
          Row(
            children: <Widget>[
              const Spacer(),
              OutlineButton(
                highlightedBorderColor: Colors.black,
                onPressed: loginState.signInButtonEnabled ? _submit : null,
                child: const Text('SignIn'),
              ),
              OutlineButton(
                highlightedBorderColor: Colors.black,
                onPressed: () => _navigateToRegistration(context),
                child: const Text('Register'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }
}
