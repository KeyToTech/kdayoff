import 'package:flutter/material.dart';
import 'package:kdayoff/src/presentation/scenes/sign_in/login.dart';

import 'scenes/home/home_page.dart';
import 'scenes/sign_up/sign_up.dart';
import 'scenes/splash/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Login'),
      routes: <String, WidgetBuilder>{
        SignUpPage.routeName: (BuildContext context) =>
            SignUpPage(title: 'SignUp'),
        HomePage.routeName: (BuildContext context) =>
            HomePage(title: 'Day off'),
      },
    );
  }
}
