import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdayoff/src/presentation/scenes/home/home_page.dart';
import 'package:kdayoff/src/presentation/scenes/sign_in/login.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void handleTimeout() {
    if(false){
      Navigator.pushReplacement<LoginPage, SplashPage>(
          context,
          MaterialPageRoute<LoginPage>(
              builder: (BuildContext context) => LoginPage(title: 'Login')));
    } else {
      Navigator.pushReplacement<HomePage, SplashPage>(
          context,
          MaterialPageRoute<HomePage>(
              builder: (BuildContext context) => HomePage(title: 'KDay')));
    }
  }

  void startTimeout() async {
    Duration duration = Duration(seconds: 2);
    Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("KDay"),
        ),
      ),
    );
  }
}
