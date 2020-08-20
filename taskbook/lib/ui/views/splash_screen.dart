import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taskbook/business_logic/view_models/splash_screen_viewmodel.dart';
import 'package:taskbook/router.dart';
import 'package:taskbook/services/service_locator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenViewModel viewModel = serviceLocator<SplashScreenViewModel>();

  @override
  void initState() {
    super.initState();
    initAppAndNavigate();
  }

  Future initAppAndNavigate() async {
    var _duration = new Duration(milliseconds: 1000);
    return new Timer(_duration, navigateToMainPage);
  }

  void navigateToMainPage() async {
    if (await viewModel.getUser() != null) {
      openHomeScreen(context);
    } else {
      openLoginPage(context);
    }
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
