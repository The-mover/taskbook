import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isUserLoggedIn = true;

  @override
  void initState() {
    super.initState();
    //checkUserStatus();
    initAppAndNavigate();
  }

  // Future checkUserStatus() async {
  //   if (await FirebaseAuthService.getCurrentUser() != null) {
  //     isUserLoggedIn = true;
  //   } else {
  //     isUserLoggedIn = false;
  //   }
  // }

  Future initAppAndNavigate() async {
    var _duration = new Duration(milliseconds: 3000);
    return new Timer(_duration, navigateToMainPage);
  }

  void navigateToMainPage() {
    isUserLoggedIn
        ? Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false)
        : Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildLogo(),
            SizedBox(height: 100.0),
            buildSpinner(),
          ],
        ),
      ),
    );
  }

  Widget buildLogo() {
    return Text(
      'Todo App',
      style: TextStyle(fontSize: 28),
    );
  }

  Widget buildSpinner() {
    return SpinKitDoubleBounce(color: Colors.blue);
  }
}
