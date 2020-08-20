import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskbook/services/auth_service.dart';
import 'package:taskbook/services/service_locator.dart';

class SplashScreenViewModel extends ChangeNotifier {
  final AuthService _authService = serviceLocator<AuthService>();

  Future<FirebaseUser> getUser() async {
    FirebaseUser user = await _authService.getCurrentUser();
    return user;
  }
}
