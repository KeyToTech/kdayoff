import 'package:flutter/material.dart';
import 'package:kdayoff/src/presentation/scenes/sign_up/signup_form.dart';

class SignUpPage extends StatefulWidget {
  static final String routeName = "/signup";
  final String title;

  SignUpPage({Key key, this.title}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SignUpForm(),
        ),
      ),
    );
  }
}
